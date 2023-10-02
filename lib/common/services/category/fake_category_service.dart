import 'package:chefio_recipe_app/common/models/category.dart';
import 'package:chefio_recipe_app/common/services/category/i_category_service.dart';
import 'package:chefio_recipe_app/utils/utils_functions.dart';

class FakeCategoryService implements ICategoryService {
  @override
  Future<List<Category>> getAll() async {
    await fakeNetworkDelay();
    final List<Category> items = [
      Category(id: Utils.getGuid(), name: 'Food'),
      Category(id: Utils.getGuid(), name: 'Drink'),
    ];
    return items;
  }
}
