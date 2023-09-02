import 'package:chefio_recipe_app/shared/utils/utils.dart';

class Ingredient {
  final String id;
  String name;

  Ingredient({required this.id, required this.name});

  factory Ingredient.create() {
    return Ingredient(id: Utils.getGuid(), name: '');
  }
}
