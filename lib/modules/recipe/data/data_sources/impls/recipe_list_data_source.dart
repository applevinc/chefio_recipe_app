import 'dart:developer';

import 'package:chefio_recipe_app/core/models/failure.dart';
import 'package:chefio_recipe_app/core/models/user.dart';
import 'package:chefio_recipe_app/core/services/firestore_collections.dart';
import 'package:chefio_recipe_app/modules/auth/data/models/user.model.dart';
import 'package:chefio_recipe_app/modules/recipe/data/data_sources/interfaces/i_recipe_list_datasource.dart';
import 'package:chefio_recipe_app/modules/recipe/data/models/recipe.model.dart';
import 'package:chefio_recipe_app/modules/recipe/data/models/recipe_category.model.dart';

class RecipeListDataSource implements IRecipeListDataSource {
  @override
  Future<List<RecipeCategoryModel>> getAllCategories() async {
    try {
      final querySnapshot = await categoriesCollection.get();
      return querySnapshot.docs.map((doc) => RecipeCategoryModel.fromJson(doc.data())).toList();
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
      final querySnapshot = await recipesCollection.where('user_id', isEqualTo: user.id).get();
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
}
