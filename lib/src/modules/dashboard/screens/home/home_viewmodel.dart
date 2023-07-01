import 'package:chefio_recipe_app/src/modules/dashboard/models/category.dart';
import 'package:chefio_recipe_app/src/shared/utils/utils.dart';
import 'package:chefio_recipe_app/src/shared/viewmodels/base_viewmodel.dart';

class HomeViewModel extends BaseViewModel {
  final List<Category> _categories = [
    Category(id: 'all', name: 'All'),
    Category(id: Utils.getGuid(), name: 'Food'),
    Category(id: Utils.getGuid(), name: 'Drink'),
  ];
  List<Category> get categories => _categories;

  Category _selectedCategory = Category(id: 'all', name: 'All');
  Category get selectedCategory => _selectedCategory;

  void selectCategory(Category category) {
    _selectedCategory = category;
    notifyListeners();
  }
}
