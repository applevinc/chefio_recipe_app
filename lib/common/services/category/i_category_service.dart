import 'package:chefio_recipe_app/modules/recipe/domain/entities/category.dart';

abstract class ICategoryService {
  Future<List<RecipeCategory>> getAll();
}
