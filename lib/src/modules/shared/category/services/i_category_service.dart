import 'package:chefio_recipe_app/src/modules/shared/category/models/category.dart';

abstract class ICategoryService {
  Future<List<Category>> getAll();
}
