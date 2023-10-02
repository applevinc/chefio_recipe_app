// A screen that allows users to take a picture using a given camera.

import 'package:camera/camera.dart';
import 'package:chefio_recipe_app/common/views/dashboard/scan_food/camera/scan_food_camera_viewmodel.dart';
import 'package:chefio_recipe_app/common/views/dashboard/scan_food/results/scan_food_results_screen.dart';

import 'package:chefio_recipe_app/common/widgets/others/error_view.dart';
import 'package:chefio_recipe_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScanCameraScreen extends StatelessWidget {
  const ScanCameraScreen({super.key, required this.scanOption});

  final String scanOption;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ScanFoodCameraViewModel(scanOption: scanOption),
      child: const _ScanCameraScreen(),
    );
  }
}

class _ScanCameraScreen extends StatefulWidget {
  const _ScanCameraScreen({Key? key}) : super(key: key);

  @override
  _ScanCameraScreenState createState() => _ScanCameraScreenState();
}

class _ScanCameraScreenState extends State<_ScanCameraScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      init();
    });
  }

  void init() async {
    await context.read<ScanFoodCameraViewModel>().init();
  }

  void takePicture() async {
    try {
      final viewModel = context.read<ScanFoodCameraViewModel>();
      final image = await viewModel.takePicture();

      if (!mounted) return;

      if (image == null) return;

      Navigator.pop(context);
      AppNavigator.to(
        context,
        ScanFoodResultsScreen(
          image: image,
          type: viewModel.scanOption,
        ),
      );
    } catch (e) {
      Messenger.error(context: context, message: 'Failed to take picture');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ScanFoodCameraViewModel>(
      builder: (context, viewModel, _) {
        if (viewModel.isBusy) {
          return Scaffold(
            appBar: AppBar(),
            extendBodyBehindAppBar: true,
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (viewModel.hasError) {
          return Scaffold(
            appBar: AppBar(),
            extendBodyBehindAppBar: true,
            body: ErrorView(
              error: viewModel.modelError,
              refetch: init,
            ),
          );
        }

        final cameraController = viewModel.cameraController;
        if (cameraController == null) {
          return const SizedBox.shrink();
        }

        if (cameraController.value.isInitialized) {
          return Scaffold(
            appBar: AppBar(),
            extendBodyBehindAppBar: true,
            extendBody: true,
            body: Transform.scale(
              scale: viewModel.cameraAspectRate(context),
              child: CameraPreview(cameraController),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: takePicture,
              child: const Icon(Icons.camera_alt),
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
