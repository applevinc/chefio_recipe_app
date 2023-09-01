import 'package:chefio_recipe_app/modules/home/models/search_filter_request.dart';
import 'package:chefio_recipe_app/modules/shared/category/models/category.dart';
import 'package:chefio_recipe_app/modules/shared/cooking_duration/cooking_duration_viewmodel.dart';

class SearchFilterViewModel extends CookingDurationViewModel {
  final List<Category> _categories;

  SearchFilterViewModel({required List<Category> categories}) : _categories = categories;

  List<Category> get categories => _categories;

  Category _selectedCategory = Category(id: 'all', name: 'All');
  Category get selectedCategory => _selectedCategory;

  void selectCategory(Category category) {
    _selectedCategory = category;
    notifyListeners();
  }

  SearchFilterRequest createSearchFilterRequest() {
    return SearchFilterRequest(
      category: selectedCategory,
      duration: duration,
    );
  }
}
