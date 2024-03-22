import 'package:chefio_recipe_app/common/models/user.dart';
import 'package:chefio_recipe_app/features/recipe/data/data_sources/i_recipe_datasource.dart';
import 'package:chefio_recipe_app/features/recipe/data/models/recipe_category.model.dart';
import 'package:chefio_recipe_app/features/recipe/data/models/requests/upload_recipe_request.model.dart';
import 'package:chefio_recipe_app/features/recipe/domain/entities/recipe_category.dart';
import 'package:chefio_recipe_app/features/recipe/domain/entities/recipe.dart';
import 'package:chefio_recipe_app/features/recipe/domain/entities/requests/upload_recipe.request.dart';
import 'package:chefio_recipe_app/features/recipe/domain/repositories/i_recipe_repository.dart';

class RecipeRepository implements IRecipeRepository {
  RecipeRepository({required IRecipeDataSource dataSource}) : _dataSource = dataSource;

  final IRecipeDataSource _dataSource;

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
    final categoryModel =
        category == null ? null : RecipeCategoryModel.fromEntity(category);
    return await _dataSource.getRecipes(category: categoryModel);
  }

  @override
  Future<List<Recipe>> getRecipesByUser(User user) async {
    return await _dataSource.getRecipesByUser(user);
  }

  @override
  Future<void> upload(UploadRecipeRequest request) async {
    final requestModel = UploadRecipeRequestModel.fromEntity(request);
    return await _dataSource.upload(requestModel);
  }
}
