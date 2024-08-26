import 'package:chefio_recipe_app/utils/utils.dart';
import 'package:flutter/material.dart';

class UploadRecipeIngredientItemController extends ViewController {
  UploadRecipeIngredientItemController({required this.ingredient, required this.index}) {
    textController = TextEditingController(text: ingredient);
  }

  late String ingredient;

  late int index;

  late TextEditingController textController;

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }
}
