
import 'package:chefio_recipe_app/config/app_session.dart';
import 'package:chefio_recipe_app/core/models/failure.dart';
import 'package:chefio_recipe_app/core/services/firebase_utils.dart';
import 'package:chefio_recipe_app/modules/auth/domain/entities/user.dart';
import 'package:chefio_recipe_app/core/services/firestore_collections.dart';
import 'package:chefio_recipe_app/modules/recipe/data/data_sources/interfaces/i_recipe_list_datasource.dart';
import 'package:chefio_recipe_app/modules/recipe/data/models/recipe.model.dart';
import 'package:chefio_recipe_app/modules/recipe/data/models/recipe_category.model.dart';
import 'package:chefio_recipe_app/utils/functions.dart';

class RecipeListDataSource implements IRecipeListDataSource {
  final suthUserLikedRecipe =
      usersCollection.doc(AppSession.authUser?.id).collection('liked_recipes');

  @override
  Future<List<RecipeCategoryModel>> getAllCategories() async {
    try {
      final querySnapshot = await categoriesCollection.get();
      return querySnapshot.docs.map((doc) => RecipeCategoryModel.fromJson(doc.data())).toList();
    } catch (e, s) {
      logError(e, s,
          source: './lib/modules/recipe/data/data_sources/impls/recipe_list_data_source.dart');

      throw InternalFailure();
    }
  }

  @override
  Future<List<RecipeModel>> getLikedRecipesByUser(User user) async {
    return [];
  }

  @override
  Future<List<RecipeModel>> getRecipes({required RecipeCategoryModel? category}) async {
    if (AppSession.authUser == null) {
      throw Failure('User not found');
    }

    try {
      final likedRecipes = await FirebaseUtils.getLikedRecipeIds(AppSession.authUser!);
      final querySnapshot = await recipesCollection.get();
      final resultFutures = querySnapshot.docs.map(
        (doc) async {
          final data = doc.data();
          final user = await FirebaseUtils.getUser(data['user_id']);

          return RecipeModel.fromDataSource(
            data: doc.data(),
            user: user,
            category: category,
            likedRecipes: likedRecipes,
          );
        },
      );

      return await Future.wait(resultFutures);
    } catch (e, s) {
      logError(e, s,
          source:
              '/Users/appleyardvincent/Desktop/Flutter/PP/chefio_recipe_app/lib/modules/recipe/data/data_sources/impls/recipe_list_data_source.dart');

      throw InternalFailure();
    }
  }

  @override
  Future<List<RecipeModel>> getRecipesByUser(User user) async {
    try {
      final querySnapshot = await recipesCollection.where('user_id', isEqualTo: user.id).get();
      final likedRecipes = await FirebaseUtils.getLikedRecipeIds(user);
      final result = querySnapshot.docs.map(
        (doc) {
          return RecipeModel.fromDataSource(
            data: doc.data(),
            user: user,
            category: null,
            likedRecipes: likedRecipes,
          );
        },
      ).toList();
      return result;
    } catch (e, s) {
      logError(e, s,
          source:
              '/Users/appleyardvincent/Desktop/Flutter/PP/chefio_recipe_app/lib/modules/recipe/data/data_sources/impls/recipe_list_data_source.dart');

      throw InternalFailure();
    }
  }
}
