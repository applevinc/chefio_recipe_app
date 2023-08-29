import 'package:chefio_recipe_app/modules/home/models/search_filter_request.dart';
import 'package:chefio_recipe_app/modules/shared/category/models/category.dart';
import 'package:chefio_recipe_app/shared/viewmodels/base_viewmodel.dart';

class SearchFilterViewModel extends BaseViewModel {
  final List<Category> _categories;

  SearchFilterViewModel({required List<Category> categories}) : _categories = categories;

  List<Category> get categories => _categories;

  Category _selectedCategory = Category(id: 'all', name: 'All');
  Category get selectedCategory => _selectedCategory;

  double _duration = 0.0;
  double get duration => _duration;

  void setDuration(double value) {
    _duration = value;
    notifyListeners();
  }

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
