import 'package:chefio_recipe_app/common/models/category.dart';

abstract class ICategoryService {
  Future<List<Category>> getAll();
}
