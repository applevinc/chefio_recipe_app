import 'dart:io';

import 'package:chefio_recipe_app/common/models/upload_recipe.dart';
import 'package:chefio_recipe_app/common/services/file_service.dart';
import 'package:chefio_recipe_app/common/views/cooking_time/cooking_time.controller.dart';
import 'package:chefio_recipe_app/config/locator/locator.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/repositories/i_recipe_repository.dart';
import 'package:chefio_recipe_app/utils/functions.dart';
import 'package:flutter/material.dart';

class UploadRecipeController extends CookingTimeController {
  UploadRecipeController({required IRecipeRepository recipeRepository}) {
    recipeRepository = recipeRepository;
    foodNameController = TextEditingController();
    foodDescriptionController = TextEditingController();
    pageController = PageController();
  }

  late final IRecipeRepository _recipeRepository;

  late final TextEditingController foodNameController;

  late final TextEditingController foodDescriptionController;

  late final PageController pageController;

  final fileService = locator<FileService>();

  int _pageNo = 0;

  int get pageNo => _pageNo;

  File? _coverPhoto;

  File? get coverPhoto => _coverPhoto;

  final List<UploadRecipeIngredient> _ingredients = [
    UploadRecipeIngredient.create(),
  ];

  List<UploadRecipeIngredient> get ingredients => _ingredients;

  final List<UploadRecipeCookingStep> _cookingSteps = [
    UploadRecipeCookingStep.create(),
  ];
  
  List<UploadRecipeCookingStep> get cookingSteps => _cookingSteps;

  void setPageNo(int page) {
    _pageNo = page;
    notifyListeners();
  }

  void addIngredient() {
    _ingredients.add(UploadRecipeIngredient.create());
    notifyListeners();
  }

  void removeIngredient(int index) {
    if (index == 0) return;

    _ingredients.removeAt(index);
    notifyListeners();
  }

  void updateIngredient({
    required int index,
    required String ingredientName,
  }) {
    _ingredients[index].name = ingredientName;
    notifyListeners();
  }

  void addCookingStep() {
    _cookingSteps.add(UploadRecipeCookingStep.create());
    notifyListeners();
  }

  void removeCookingStep(int index) {
    if (index == 0) return;

    _cookingSteps.removeAt(index);
    notifyListeners();
  }

  void updateCookingStepDescription({
    required int index,
    required String description,
  }) {
    _cookingSteps[index].description = description;
    notifyListeners();
  }

  void addPhotoForCookingStep(int index) async {
    final image = await fileService.pickImageFromGallery();

    if (image == null) return;

    _cookingSteps[index].photo = image;
    notifyListeners();
  }

  void removePhotoForCookingStep(int index) {
    _cookingSteps[index].photo = null;
    notifyListeners();
  }

  void pickCoverPhoto() async {
    final image = await pickImageFromGallery();

    if (image == null) {
      return;
    }

    _coverPhoto = image;
    notifyListeners();
  }

  void removeCoverPhoto() {
    _coverPhoto = null;
    notifyListeners();
  }

  Future<void> execute() async {}

  @override
  void dispose() {
    pageController.dispose();
    foodNameController.dispose();
    foodDescriptionController.dispose();
    super.dispose();
  }
}
