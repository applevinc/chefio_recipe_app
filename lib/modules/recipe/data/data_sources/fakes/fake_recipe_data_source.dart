import 'package:chefio_recipe_app/modules/recipe/data/data_sources/interfaces/i_recipe_datasource.dart';
import 'package:chefio_recipe_app/modules/recipe/data/models/requests/upload_recipe_request.model.dart';
import 'package:chefio_recipe_app/utils/functions.dart';

class FakeRecipeDataSource implements IRecipeDataSource {
  @override
  Future<void> upload(UploadRecipeRequestModel request) async {
    await fakeNetworkDelay();
  }

  @override
  Future<void> updateLikeStatus(String recipeId, bool isLiked) async {
    await fakeNetworkDelay();
  }
}
