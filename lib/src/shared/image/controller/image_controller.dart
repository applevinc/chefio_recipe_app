import 'dart:io';

import 'package:chefio_recipe_app/src/shared/image/service/service.dart';
import 'package:chefio_recipe_app/src/shared/models/failure.dart';
import 'package:flutter/cupertino.dart';

class ImageController extends ChangeNotifier {
  final ImageService _imageService;

  ImageController({required ImageService imageService}) : _imageService = imageService;

  Future<File?> pickImageFromGallery() async {
    try {
      return await _imageService.pickImageFromGallery();
    } on Failure {
      rethrow;
    }
  }

  Future<File?> pickImageFromCamera() async {
    try {
      return await _imageService.pickImageFromCamera();
    } on Failure {
      rethrow;
    }
  }
}
