import 'dart:io';

import 'package:chefio_recipe_app/modules/recipe/models/upload_recipe.dart';
import 'package:chefio_recipe_app/modules/shared/cooking_time/cooking_time_viewmodel.dart';
import 'package:chefio_recipe_app/shared/image/service/i_file_service.dart';
import 'package:flutter/material.dart';

class UploadRecipeViewModel extends CookingTimeViewModel {
  final IFileService fileService;

  UploadRecipeViewModel({required this.fileService});

  final pageController = PageController();

  int _pageNo = 0;
  int get pageNo => _pageNo;

  File? _coverPhoto;
  File? get coverPhoto => _coverPhoto;

  String _foodName = '';
  String get foodName => _foodName;

  String _foodDescription = '';
  String get foodDescription => _foodDescription;

  final List<UploadRecipeIngredient> _ingredients = [
    UploadRecipeIngredient.create(),
  ];
  List<UploadRecipeIngredient> get ingredients => _ingredients;

  final List<UploadRecipeCookingStep> _cookingSteps = [
    UploadRecipeCookingStep.create(),
  ];
  List<UploadRecipeCookingStep> get cookingSteps => _cookingSteps;

  void setFoodInfo({
    required String foodName,
    required String foodDescription,
  }) {
    _foodName = foodName;
    _foodDescription = foodDescription;
  }

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
    final image = await fileService.pickImageFromGallery();

    if (image == null) return;

    _coverPhoto = image;
    notifyListeners();
  }

  void removeCoverPhoto() {
    _coverPhoto = null;
    notifyListeners();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
