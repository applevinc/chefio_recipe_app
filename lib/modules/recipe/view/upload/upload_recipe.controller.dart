import 'dart:io';

import 'package:chefio_recipe_app/core/models/failure.dart';
import 'package:chefio_recipe_app/core/controllers/cooking_time.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/entities/requests/cooking_step.request.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/entities/requests/upload_recipe.request.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/repositories/i_recipe_repository.dart';
import 'package:chefio_recipe_app/utils/functions.dart';
import 'package:flutter/material.dart';

class UploadRecipeController extends CookingTimeController {
  UploadRecipeController({required IRecipeRepository recipeRepository}) {
    _recipeRepository = recipeRepository;
    foodNameController = TextEditingController();
    foodDescriptionController = TextEditingController();
    pageController = PageController();
    _ingredients = [''];
    _cookingSteps = [CookingStepRequest(step: 1, description: '')];
  }

  late final IRecipeRepository _recipeRepository;

  late final TextEditingController foodNameController;

  late final TextEditingController foodDescriptionController;

  late final PageController pageController;

  int _pageNo = 0;

  int get pageNo => _pageNo;

  File? _coverPhoto;

  File? get coverPhoto => _coverPhoto;

  late List<String> _ingredients;

  List<String> get ingredients => _ingredients;

  List<CookingStepRequest> _cookingSteps = [];

  List<CookingStepRequest> get cookingSteps => _cookingSteps;

  void setPageNo(int page) {
    _pageNo = page;
    notifyListeners();
  }

  void addIngredient() {
    _ingredients.add('');
    notifyListeners();
  }

  void deleteIngredient(int index) {
    _ingredients.removeAt(index);
    notifyListeners();
  }

  void updateIngredient({
    required int index,
    required String name,
  }) {
    _ingredients[index] = name;
  }

  void onIngredientsReorder(int oldIndex, int newIndex) {
    // dragging from top to bottom
    if (oldIndex < newIndex) {
      // removing the item at oldIndex will shorten the list by 1.
      newIndex -= 1;
    }

    final item = _ingredients.removeAt(oldIndex);
    _ingredients.insert(newIndex, item);
    notifyListeners();
  }

  void onCookingStepsReorder(int oldIndex, int newIndex) {
    // dragging from top to bottom
    if (oldIndex < newIndex) {
      // removing the item at oldIndex will shorten the list by 1.
      newIndex -= 1;
    }

    final item = _cookingSteps.removeAt(oldIndex);
    _cookingSteps.insert(newIndex, item);
    _reOrderCookingSteps();
    notifyListeners();
  }

  void addCookingStep() {
    final nextStep = _cookingSteps.length + 1;
    _cookingSteps.add(CookingStepRequest(step: nextStep, description: ''));
    _reOrderCookingSteps();
    notifyListeners();
  }

  void _reOrderCookingSteps() {
    for (var i = 0; i < _cookingSteps.length; i++) {
      _cookingSteps[i].step = i + 1;
    }
  }

  void deleteCookingStep(int index) {
    _cookingSteps.removeAt(index);
    _reOrderCookingSteps();
    notifyListeners();
  }

  void uploadCoverPhoto() async {
    final image = await pickImageFromGallery();

    if (image == null) {
      return;
    }

    _coverPhoto = image;
    notifyListeners();
  }

  void deleteCoverPhoto() {
    _coverPhoto = null;
    notifyListeners();
  }

  Future<void> execute() async {
    if (coverPhoto == null) {
      throw Failure('Cover photo is required');
    }

    if (ingredients.isEmpty) {
      throw Failure('Ingredients are required');
    }

    if (cookingSteps.isEmpty) {
      throw Failure('Cooking steps are required');
    }

    final duration = Duration(minutes: cookingTimeInMinutes.toInt());

    final request = UploadRecipeRequest(
      foodName: foodNameController.text,
      description: foodDescriptionController.text,
      ingredients: ingredients,
      cookingSteps: cookingSteps,
      coverPhoto: coverPhoto!,
      duration: duration,
    );

    try {
      setBusy(true);
      await _recipeRepository.upload(request);
    } finally {
      setBusy(false);
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    foodNameController.dispose();
    foodDescriptionController.dispose();
    super.dispose();
  }
}
