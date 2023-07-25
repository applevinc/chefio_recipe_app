import 'package:chefio_recipe_app/modules/shared/category/models/category.dart';

abstract class ICategoryService {
  Future<List<Category>> getAll();
}
