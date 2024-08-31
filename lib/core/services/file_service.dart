import 'dart:developer';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class FileService {
  final _imagePicker = ImagePicker();

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
