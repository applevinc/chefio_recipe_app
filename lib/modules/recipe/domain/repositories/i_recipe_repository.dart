import 'package:chefio_recipe_app/modules/recipe/domain/entities/requests/upload_recipe.request.dart';

abstract class IRecipeRepository {
  Future<void> upload(UploadRecipeRequest request);
  Future<void> updateLikeStatus(String recipeId, bool isLiked);
}
