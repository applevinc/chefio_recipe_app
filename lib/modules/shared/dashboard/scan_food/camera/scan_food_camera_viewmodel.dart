import 'dart:io';

import 'package:camera/camera.dart';
import 'package:chefio_recipe_app/shared/models/failure.dart';
import 'package:chefio_recipe_app/shared/viewmodels/base_viewmodel.dart';

enum ScanFoodCameraLoadingState { init, takePicture }

class ScanFoodCameraViewModel extends BaseViewModel {
  CameraController? _cameraController;
  CameraController? get cameraController => _cameraController;

  late String scanOption;

  ScanFoodCameraViewModel({required this.scanOption});

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
