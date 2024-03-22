import 'package:chefio_recipe_app/features/recipe/domain/entities/recipe_category.dart';

class SearchFilterRequest {
  final RecipeCategory category;
  final double duration;

  SearchFilterRequest({
    required this.category,
    required this.duration,
  });
}
