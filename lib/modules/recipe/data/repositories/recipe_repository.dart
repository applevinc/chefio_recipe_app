import 'package:chefio_recipe_app/modules/recipe/data/data_sources/interfaces/i_recipe_datasource.dart';
import 'package:chefio_recipe_app/modules/recipe/data/models/requests/upload_recipe_request.model.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/entities/requests/upload_recipe.request.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/repositories/i_recipe_repository.dart';

class RecipeRepository implements IRecipeRepository {
  RecipeRepository({required IRecipeDataSource dataSource}) : _dataSource = dataSource;

  final IRecipeDataSource _dataSource;

  @override
  Future<void> upload(UploadRecipeRequest request) async {
    final requestModel = UploadRecipeRequestModel.fromEntity(request);
    return await _dataSource.upload(requestModel);
  }

  @override
  Future<void> updateLikeStatus(String recipeId, bool isLiked) async {
    await _dataSource.updateLikeStatus(recipeId, isLiked);
  }
}
