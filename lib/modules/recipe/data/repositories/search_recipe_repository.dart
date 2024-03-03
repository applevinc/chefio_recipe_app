import 'package:chefio_recipe_app/modules/recipe/data/data_sources/search/i_search_recipe_data_source.dart';
import 'package:chefio_recipe_app/modules/recipe/data/models/search_filter_request.model.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/entities/recipe.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/entities/search_filter_request.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/entities/search_history.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/entities/search_suggestion.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/repositories/i_search_recipe_repository.dart';

class SearchRecipeRepository implements ISearchRecipeRepository {
  SearchRecipeRepository({required ISearchRecipeDataSource dataSource})
      : _dataSource = dataSource;

  final ISearchRecipeDataSource _dataSource;

  @override
  Future<List<SearchHistory>> getSearchHistory() async {
    return await _dataSource.getSearchHistory();
  }

  @override
  Future<List<SearchSuggestion>> getSearchSuggestion() async {
    return await _dataSource.getSearchSuggestion();
  }

  @override
  Future<List<Recipe>> search(String query) async {
    return await _dataSource.search(query);
  }

  @override
  Future<List<Recipe>> searchByFilter(SearchFilterRequest request) async {
    final requestModel = SearchFilterRequestModel.fromEntity(request);
    return await _dataSource.searchByFilter(requestModel);
  }
}