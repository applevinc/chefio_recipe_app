import 'package:chefio_recipe_app/modules/recipe/domain/entities/requests/cooking_step.request.dart';
import 'package:chefio_recipe_app/utils/functions.dart';
import 'package:chefio_recipe_app/utils/utils.dart';
import 'package:flutter/material.dart';

class UploadRecipeCookingStepItemController extends ViewController {
  UploadRecipeCookingStepItemController({
    required this.index,
    required this.cookingStep,
  }) {
    textController = TextEditingController(text: cookingStep.description);
  }

  late final int index;

  late final CookingStepRequest cookingStep;

  late final TextEditingController textController;

  void updateDescription(String value) {
    cookingStep.description = value;
  }

  void uploadPhoto() async {
    final image = await pickImageFromGallery();

    if (image == null) {
      return;
    }

    cookingStep.photo = image;
    notifyListeners();
  }

  void deletePhoto() {
    cookingStep.photo = null;
    notifyListeners();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }
}
