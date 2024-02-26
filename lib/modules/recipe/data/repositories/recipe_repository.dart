import 'package:chefio_recipe_app/modules/recipe/data/data_sources/i_recipe_datasource.dart';
import 'package:chefio_recipe_app/modules/recipe/data/models/recipe_category.model.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/entities/recipe_category.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/entities/recipe.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/repositories/i_recipe_repository.dart';

class RecipeRepository implements IRecipeRepository {
  RecipeRepository({required IRecipeDataSource dataSource}) : _dataSource = dataSource;

  final IRecipeDataSource _dataSource;

  @override
  Future<List<RecipeCategory>> getAllCategories() async {
    return await _dataSource.getAllCategories();
  }

  @override
  Future<List<Recipe>> getLikedRecipesByUser({required String userId}) async {
    return await _dataSource.getLikedRecipesByUser(userId: userId);
  }

  @override
  Future<List<Recipe>> getRecipes({required RecipeCategory category}) async {
    final categoryModel = RecipeCategoryModel.fromEntity(category);
    return await _dataSource.getRecipes(category: categoryModel);
  }

  @override
  Future<List<Recipe>> getRecipesByUser({required String userId}) async {
    return await _dataSource.getRecipesByUser(userId: userId);
  }

  @override
  Future<List<Recipe>> search(String query) async {
    return await _dataSource.search(query);
  }
}
