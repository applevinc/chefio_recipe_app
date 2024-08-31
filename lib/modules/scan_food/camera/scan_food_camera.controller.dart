import 'dart:io';

import 'package:camera/camera.dart';
import 'package:chefio_recipe_app/core/models/failure.dart';
import 'package:chefio_recipe_app/utils/view.controller.dart';
import 'package:flutter/widgets.dart';

enum ScanFoodCameraLoadingState { init, takePicture }

class ScanFoodCameraController extends ViewController {
  CameraController? _cameraController;
  CameraController? get cameraController => _cameraController;

  late String scanOption;

  ScanFoodCameraController({required this.scanOption});

  double cameraAspectRate(BuildContext context) {
    if (cameraController == null) return 0.0;

    final mediaSize = MediaQuery.of(context).size;
    final scale = 1 / (cameraController!.value.aspectRatio * mediaSize.aspectRatio);
    return scale;
  }

  Future<void> init() async {
    try {
      setBusyForObject(ScanFoodCameraLoadingState.init, true);
      final cameras = await availableCameras();

      if (cameras.isEmpty) {
        setError(Failure('No available cameras'));
        return;
      }

      _cameraController = CameraController(
        cameras.first,
        ResolutionPreset.max,
        enableAudio: false,
      );
      await cameraController!.initialize();
    } catch (e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            setError(Failure(
                'Camera access denied, we will need access to your camera to continue'));
            break;
          default:
            setError(Failure('Camera failed to initialize'));
        }
      } else {
        setError(Failure('Camera failed to initialize'));
      }
    } finally {
      setBusyForObject(ScanFoodCameraLoadingState.init, false);
    }
  }

  Future<File?> takePicture() async {
    if (cameraController == null || !cameraController!.value.isInitialized) return null;

    try {
      setBusyForObject(ScanFoodCameraLoadingState.takePicture, true);
      final xFile = await cameraController!.takePicture();
      return File(xFile.path);
    } finally {
      setBusyForObject(ScanFoodCameraLoadingState.takePicture, false);
    }
  }

  @override
  void dispose() {
    cameraController?.dispose();
    super.dispose();
  }
}
