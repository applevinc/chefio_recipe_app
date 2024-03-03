import 'package:chefio_recipe_app/common/views/cooking_time/cooking_time.controller.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/entities/search_filter_request.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/entities/recipe_category.dart';

class SearchFilterController extends CookingTimeController {
  SearchFilterController({required List<RecipeCategory> categories}) {
    _categories = categories;
    init();
  }

  late final List<RecipeCategory> _categories;

  List<RecipeCategory> get categories => _categories;

  RecipeCategory? _selectedCategory;

  RecipeCategory? get selectedCategory => _selectedCategory;

  void init() {
    if (categories.isNotEmpty) {
      _selectedCategory = categories.first;
    }
  }

  void selectCategory(RecipeCategory category) {
    _selectedCategory = category;
    notifyListeners();
  }

  SearchFilterRequest? createSearchFilterRequest() {
    if (selectedCategory == null) {
      return null;
    }

    return SearchFilterRequest(
      category: selectedCategory!,
      duration: cookingTimeInMinutes,
    );
  }
}
