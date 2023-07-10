import 'package:chefio_recipe_app/src/modules/shared/category/models/category.dart';
import 'package:chefio_recipe_app/src/modules/shared/category/services/i_category_service.dart';
import 'package:chefio_recipe_app/src/shared/utils/utils.dart';

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
