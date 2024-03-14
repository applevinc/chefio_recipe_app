import 'package:chefio_recipe_app/features/recipe/domain/entities/recipe_category.dart';

class RecipeCategoryModel extends RecipeCategory {
  RecipeCategoryModel({required super.id, required super.name});

  static fromEntity(RecipeCategory category) {
    return RecipeCategoryModel(id: category.id, name: category.name);
  }
}
