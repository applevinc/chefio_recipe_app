import 'dart:developer';
import 'dart:io';

import 'package:chefio_recipe_app/common/models/failure.dart';
import 'package:chefio_recipe_app/common/models/user.dart';
import 'package:chefio_recipe_app/common/services/firebase_storage.dart';
import 'package:chefio_recipe_app/common/services/firestore_collections.dart';
import 'package:chefio_recipe_app/config/app_session.dart';
import 'package:chefio_recipe_app/features/auth/data/models/user.model.dart';
import 'package:chefio_recipe_app/features/recipe/data/data_sources/i_recipe_datasource.dart';
import 'package:chefio_recipe_app/features/recipe/data/models/recipe.model.dart';
import 'package:chefio_recipe_app/features/recipe/data/models/recipe_category.model.dart';
import 'package:chefio_recipe_app/features/recipe/data/models/requests/cooking_step_request.model.dart';
import 'package:chefio_recipe_app/features/recipe/data/models/requests/upload_recipe_request.model.dart';
import 'package:chefio_recipe_app/features/recipe/domain/entities/requests/cooking_step.request.dart';

class RecipeDataSource implements IRecipeDataSource {
  @override
  Future<List<RecipeCategoryModel>> getAllCategories() async {
    try {
      final querySnapshot = await categoriesCollection.get();
      return querySnapshot.docs
          .map((doc) => RecipeCategoryModel.fromJson(doc.data()))
          .toList();
    } catch (e, s) {
      log(e.toString());
      log(s.toString());

      throw InternalFailure();
    }
  }

  @override
  Future<List<RecipeModel>> getLikedRecipesByUser(User user) async {
    return [];
  }

  @override
  Future<List<RecipeModel>> getRecipes({required RecipeCategoryModel? category}) async {
    try {
      final querySnapshot = await recipesCollection.get();
      final resultFutures = querySnapshot.docs.map(
        (doc) async {
          final data = doc.data();
          final user = await _getUser(data['user_id']);

          return RecipeModel.fromDataSource(
            data: doc.data(),
            user: user,
            category: category,
          );
        },
      );

      return await Future.wait(resultFutures);
    } catch (e, s) {
      log(e.toString());
      log(s.toString());

      throw InternalFailure();
    }
  }

  Future<UserModel> _getUser(String userId) async {
    final querySnapshot = await usersCollection.doc(userId).get();
    final data = querySnapshot.data();

    if (data == null) {
      throw Failure('User not found');
    }

    return UserModel.fromMap(data);
  }

  @override
  Future<List<RecipeModel>> getRecipesByUser(User user) async {
    try {
      final querySnapshot =
          await recipesCollection.where('user_id', isEqualTo: user.id).get();
      final result = querySnapshot.docs.map(
        (doc) {
          return RecipeModel.fromDataSource(
            data: doc.data(),
            user: user,
            category: null,
          );
        },
      ).toList();
      return result;
    } catch (e, s) {
      log(e.toString());
      log(s.toString());

      throw InternalFailure();
    }
  }

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
    final cookingStepRequestModels =
        _convertCookingStepsToRequestModels(request.cookingSteps);

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
}
