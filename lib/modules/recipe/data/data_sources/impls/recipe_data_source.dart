import 'dart:developer';

import 'package:chefio_recipe_app/config/app_session.dart';
import 'package:chefio_recipe_app/core/models/failure.dart';
import 'package:chefio_recipe_app/core/services/firebase_storage.dart';
import 'package:chefio_recipe_app/core/services/firestore_collections.dart';
import 'package:chefio_recipe_app/modules/recipe/data/data_sources/interfaces/i_recipe_datasource.dart';
import 'package:chefio_recipe_app/modules/recipe/data/models/requests/cooking_step_request.model.dart';
import 'package:chefio_recipe_app/modules/recipe/data/models/requests/upload_recipe_request.model.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/entities/requests/cooking_step.request.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RecipeDataSource implements IRecipeDataSource {
  @override
  Future<void> upload(UploadRecipeRequestModel request) async {
    try {
      await recipesCollection.doc(request.recipeId).set(request.toMap());
      await Future.wait([
        _uploadCoverPhoto(request),
        _uploadCookingSteps(request),
      ]);
    } catch (e, s) {
      log(e.toString());
      log(s.toString());

      _removeRecordsAfterUpload(request);

      throw Failure('Failed to upload recipe');
    }
  }

  Future<void> _uploadCoverPhoto(UploadRecipeRequestModel request) async {
    final file = request.coverPhoto;
    final ref = recipeCoverPhotosStorage.child(request.recipeId);
    await ref.putFile(file);
    final coverPhotoUrl = await ref.getDownloadURL();
    recipesCollection.doc(request.recipeId).update({'cover_photo_url': coverPhotoUrl});
  }

  Future<void> _uploadCookingSteps(UploadRecipeRequestModel request) async {
    final cookingStepRequestModels = _convertCookingStepsToRequestModels(request.cookingSteps);

    final List<CookingStepRequestModel> updatedCookingStepsModels = [];

    for (final cookingStepRequestModel in cookingStepRequestModels) {
      final updatedModel = await _updateCookingStepModel(
        recipeId: request.recipeId,
        cookingStepRequestModel: cookingStepRequestModel,
      );
      updatedCookingStepsModels.add(updatedModel);
    }

    await recipesCollection.doc(request.recipeId).update({
      'cooking_steps': updatedCookingStepsModels.map((e) => e.toMap()).toList(),
    });
  }

  List<CookingStepRequestModel> _convertCookingStepsToRequestModels(
      List<CookingStepRequest> cookingSteps) {
    return cookingSteps
        .map(
          (e) => CookingStepRequestModel(
            description: e.description,
            step: e.step,
            photo: e.photo,
          ),
        )
        .toList();
  }

  Future<CookingStepRequestModel> _updateCookingStepModel({
    required String recipeId,
    required CookingStepRequestModel cookingStepRequestModel,
  }) async {
    if (cookingStepRequestModel.photo == null) {
      return cookingStepRequestModel;
    }

    final fileName = 'step-${cookingStepRequestModel.step}';
    final ref = recipeCookingStepPhotosStorage.child(recipeId).child(fileName);
    await ref.putFile(cookingStepRequestModel.photo!);
    final photoUrl = await ref.getDownloadURL();
    return cookingStepRequestModel.copyWith(photoUrl: photoUrl);
  }

  // if there was an error during upload, delete the uploaded files if any
  Future<void> _removeRecordsAfterUpload(UploadRecipeRequestModel request) async {
    try {
      await Future.wait([
        recipeCoverPhotosStorage.child(request.recipeId).delete(),
        recipeCookingStepPhotosStorage.child(request.recipeId).delete(),
        recipesCollection.doc(request.recipeId).delete(),
      ]);
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Future<void> updateLikeStatus(String recipeId, bool isLiked) async {
    try {
      final authUserReference = usersCollection.doc(AppSession.authUser?.id);
      final recipeReference = recipesCollection.doc(recipeId);

      if (isLiked) {
        await authUserReference.update({
          'liked_recipes': FieldValue.arrayUnion([recipeId])
        });
        await recipeReference.update({'like_count': FieldValue.increment(1)});
      } else {
        await authUserReference.update({
          'liked_recipes': FieldValue.arrayRemove([recipeId])
        });
        await recipeReference.update({'like_count': FieldValue.increment(-1)});
      }
    } catch (e) {
      log('Error updating like status: $e');
      throw Failure('Error updating like status');
    }
  }
}
