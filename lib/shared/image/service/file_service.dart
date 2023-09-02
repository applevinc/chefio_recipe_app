import 'dart:developer';
import 'dart:io';

import 'package:chefio_recipe_app/shared/image/service/i_file_service.dart';
import 'package:image_picker/image_picker.dart';

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
    } on Exception catch (e) {
      log(e.toString());
    }
    return null;
  }

  @override
  Future<File?> pickImageFromGallery() async {
    try {
      final image = await _imagePicker.pickImage(source: ImageSource.gallery);

      if (image == null) {
        return null;
      }

      return File(image.path);
    } on Exception catch (e) {
      log(e.toString());
    }
    return null;
  }
}
