import 'dart:io';

abstract class ImageService {
  Future<File?> pickImageFromGallery();
  Future<File?> pickImageFromCamera();
}
