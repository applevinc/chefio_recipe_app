import 'package:chefio_recipe_app/common/views/cooking_time/cooking_time_viewmodel.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/entities/search_filter_request.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/entities/recipe_category.dart';

class SearchFilterViewModel extends CookingTimeViewModel {
  final List<RecipeCategory> _categories;

  SearchFilterViewModel({required List<RecipeCategory> categories})
      : _categories = categories;

  List<RecipeCategory> get categories => _categories;

  RecipeCategory _selectedCategory = RecipeCategory(id: 'all', name: 'All');
  RecipeCategory get selectedCategory => _selectedCategory;

  void selectCategory(RecipeCategory category) {
    _selectedCategory = category;
    notifyListeners();
  }

  SearchFilterRequest createSearchFilterRequest() {
    return SearchFilterRequest(
      category: selectedCategory,
      duration: cookingTimeInMinutes,
    );
  }
}
