import 'dart:developer';
import 'dart:io';

import 'package:chefio_recipe_app/modules/shared/cooking_duration/cooking_duration_viewmodel.dart';
import 'package:chefio_recipe_app/shared/image/service/i_file_service.dart';
import 'package:flutter/material.dart';

class UploadRecipeViewModel extends CookingDurationViewModel {
  final IFileService fileService;

  UploadRecipeViewModel({required this.fileService});

  final pageController = PageController();

  int _pageNo = 0;
  int get pageNo => _pageNo;

  File? _coverPhoto;
  File? get coverPhoto => _coverPhoto;

  setPageNo(int page) {
    _pageNo = page;
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
