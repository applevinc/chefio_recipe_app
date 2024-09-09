import 'package:chefio_recipe_app/modules/auth/domain/entities/user.dart';
import 'package:chefio_recipe_app/modules/recipe/data/data_sources/interfaces/i_recipe_list_datasource.dart';
import 'package:chefio_recipe_app/modules/recipe/data/models/recipe_category.model.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/entities/recipe_category.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/entities/recipe.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/repositories/i_recipe_list_repository.dart';

class RecipeListRepository implements IRecipeListRepository {
  RecipeListRepository({required IRecipeListDataSource dataSource}) : _dataSource = dataSource;

  final IRecipeListDataSource _dataSource;

  @override
  Future<List<RecipeCategory>> getCategories() async {
    return await _dataSource.getAllCategories();
  }

  @override
  Future<List<Recipe>> getLikedRecipesByUser(User user) async {
    return await _dataSource.getLikedRecipesByUser(user);
  }

  @override
  Future<List<Recipe>> getRecipes({required RecipeCategory? category}) async {
    final categoryModel = category == null ? null : RecipeCategoryModel.fromEntity(category);
    return await _dataSource.getRecipes(category: categoryModel);
  }

  @override
  Future<List<Recipe>> getRecipesByUser(User user) async {
    return await _dataSource.getRecipesByUser(user);
  }
}
