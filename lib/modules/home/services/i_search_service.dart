import 'package:chefio_recipe_app/modules/shared/recipe/models/recipe.dart';

abstract class ISearchService {
  Future<List<Recipe>> search(String query);
}
