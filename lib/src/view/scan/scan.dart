import 'dart:io';
import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:chefio_recipe_app/src/core/assets/images.dart';
import 'package:chefio_recipe_app/src/core/theme/colors.dart';
import 'package:chefio_recipe_app/src/core/widgets/grey_divider.dart';
import 'package:chefio_recipe_app/src/view/home/screens/gridview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class _ScanOption {
  final String label;
  final String img;

  _ScanOption({required this.label, required this.img});
}

class ScanScreen extends StatelessWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final options = <_ScanOption>[
      _ScanOption(label: 'Food', img: AppImages.food),
      _ScanOption(label: 'Ingredient', img: AppImages.ingredients)
    ];

    return Container(
      padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 24.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30.r),
          topLeft: Radius.circular(20.r),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Choose one option',
            style: Theme.of(context).textTheme.bodyText2,
          ),
          SizedBox(height: 29.h),
          Wrap(
            spacing: 16.w,
            children: List.generate(
              options.length,
              (index) => InkWell(
                onTap: () async {
                  // Obtain a list of the available cameras on the device.
                  final cameras = await availableCameras();

                  // Get a specific camera from the list of available cameras.
                  final firstCamera = cameras.first;

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ScanCameraScreen(camera: firstCamera),
                    ),
                  );
                },
                child: Container(
                  width: 155.w,
                  height: 186.h,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 38.h, bottom: 19.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: AppColors.outline,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(options[index].img),
                      const Spacer(),
                      Text(
                        options[index].label,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontSize: 15.sp),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// A screen that allows users to take a picture using a given camera.
class ScanCameraScreen extends StatefulWidget {
  const ScanCameraScreen({
    Key? key,
    required this.camera,
  }) : super(key: key);

  final CameraDescription camera;

  @override
  ScanCameraScreenState createState() => ScanCameraScreenState();
}

class ScanCameraScreenState extends State<ScanCameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
        toolbarHeight: 100.h,
        leadingWidth: 85.w,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: EdgeInsets.only(left: 24.w),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(28.r),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                child: Container(
                  width: 56.w,
                  height: 56.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.arrow_back_ios, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 24.w),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(28.r),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                child: Container(
                  width: 56.w,
                  height: 56.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    //borderRadius: BorderRadius.circular(8.r),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.light_mode, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      // You must wait until the controller is initialized before displaying the
      // camera preview. Use a FutureBuilder to display a loading spinner until the
      // controller has finished initializing.
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.

            return CameraPreview(_controller);
          } else {
            // Otherwise, display a loading indicator.
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        // Provide an onPressed callback.
        onPressed: () async {
          // Take the Picture in a try / catch block. If anything goes wrong,
          // catch the error.
          try {
            // // Ensure that the camera is initialized.
            // await _initializeControllerFuture;

            // // Attempt to take a picture and get the file `image`
            // // where it was saved.
            // final image = await _controller.takePicture();

            // // If the picture was taken, display it on a new screen.
            // await Navigator.of(context).push(
            //   MaterialPageRoute(
            //     builder: (context) => DisplayPictureScreen(
            //       // Pass the automatically generated path to
            //       // the DisplayPictureScreen widget.
            //       imagePath: image.path,
            //     ),
            //   ),
            // );

            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ScannedFoodScreen(),
              ),
            );
          } catch (e) {
            // If an error occurs, log the error to the console.
            print(e);
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}

// A widget that displays the picture taken by the user.
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Image.file(File(imagePath)),
    );
  }
}

class ScannedFoodScreen extends StatelessWidget {
  const ScannedFoodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            centerTitle: true,
            expandedHeight: 368.h,
            pinned: true,
            backgroundColor: Colors.white,
            elevation: 0.0,
            title: const Text('Food'),
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.light,
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(AppImages.capturedFood),
                  SizedBox(height: 32.h),
                  Text(
                    'Pancakes',
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: AppColors.headlineText),
                  ),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: const [
                GreyDivider(),
                GridViewBody(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
