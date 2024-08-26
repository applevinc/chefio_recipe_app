import 'package:chefio_recipe_app/modules/recipe/domain/entities/recipe_category.dart';

class RecipeCategoryModel extends RecipeCategory {
  RecipeCategoryModel({required super.id, required super.name});

  static fromEntity(RecipeCategory category) {
    return RecipeCategoryModel(id: category.id, name: category.name);
  }

  static RecipeCategoryModel fromJson(Map<String, dynamic> json) {
    return RecipeCategoryModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
