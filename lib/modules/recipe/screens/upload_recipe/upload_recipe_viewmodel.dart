import 'dart:developer';
import 'dart:io';

import 'package:chefio_recipe_app/modules/recipe/models/ingredient.dart';
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
  String _foodDescription = '';

  final List<Ingredient> _ingredients = [
    Ingredient.create(),
  ];
  List<Ingredient> get ingredients => _ingredients;

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

  void addIngredients() {
    _ingredients.add(Ingredient.create());
    notifyListeners();
  }

  void removeIngredient(int index) {
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

  void pickCoverPhoto() async {
    try {
      final image = await fileService.pickImageFromGallery();

      if (image == null) return;

      _coverPhoto = image;
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
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
