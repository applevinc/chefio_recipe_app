import 'package:chefio_recipe_app/modules/recipe/domain/entities/requests/search_filter.request.dart';

class SearchFilterRequestModel extends SearchFilterRequest {
  SearchFilterRequestModel({required super.category, required super.duration});

  static fromEntity(SearchFilterRequest request) {
    return SearchFilterRequestModel(
      category: request.category,
      duration: request.duration,
    );
  }
}
