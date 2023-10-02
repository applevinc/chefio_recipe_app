import 'package:chefio_recipe_app/common/models/category.dart';

class SearchFilterRequest {
  final Category category;
  final double duration;

  SearchFilterRequest({
    required this.category,
    required this.duration,
  });
}
