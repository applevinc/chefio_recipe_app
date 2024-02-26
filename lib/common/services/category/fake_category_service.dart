import 'package:chefio_recipe_app/modules/recipe/domain/entities/category.dart';
import 'package:chefio_recipe_app/common/services/category/i_category_service.dart';
import 'package:chefio_recipe_app/utils/functions.dart';

class FakeCategoryService implements ICategoryService {
  @override
  Future<List<RecipeCategory>> getAll() async {
    await fakeNetworkDelay();
    final List<RecipeCategory> items = [
      RecipeCategory(id: getGuid(), name: 'Food'),
      RecipeCategory(id: getGuid(), name: 'Drink'),
    ];
    return items;
  }
}
