import 'dart:io';

import 'package:chefio_recipe_app/src/shared/image/service/service.dart';
import 'package:chefio_recipe_app/src/shared/models/failure.dart';
import 'package:image_picker/image_picker.dart';

const _errorMessage = 'An error occuried';

class ImageServiceImpl implements ImageService {
  final ImagePicker _imagePicker = ImagePicker();

  @override
  Future<File?> pickImageFromCamera() async {
    try {
      final image = await _imagePicker.pickImage(source: ImageSource.camera);
      if (image == null) {
        return null;
      }
      return File(image.path);
    } on Exception {
      throw Failure(_errorMessage);
    }
  }

  @override
  Future<File?> pickImageFromGallery() async {
    try {
      final image = await _imagePicker.pickImage(source: ImageSource.gallery);
      if (image == null) {
        return null;
      }
      return File(image.path);
    } on Exception {
      throw Failure(_errorMessage);
    }
  }
}
