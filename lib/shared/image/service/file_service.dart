import 'dart:io';

import 'package:chefio_recipe_app/shared/image/service/i_file_service.dart';
import 'package:chefio_recipe_app/shared/models/failure.dart';
import 'package:image_picker/image_picker.dart';

const _errorMessage = 'An error occuried';

class FileService implements IFileService {
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