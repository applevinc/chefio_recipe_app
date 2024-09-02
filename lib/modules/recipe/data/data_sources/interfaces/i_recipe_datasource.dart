import 'package:chefio_recipe_app/modules/recipe/data/models/requests/upload_recipe_request.model.dart';

abstract class IRecipeDataSource {
  Future<void> upload(UploadRecipeRequestModel request);
  Future<void> updateLikeStatus(String recipeId, bool isLiked);
}
