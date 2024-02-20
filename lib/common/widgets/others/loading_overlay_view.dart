import 'package:chefio_recipe_app/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingOverlayView extends StatelessWidget {
  const LoadingOverlayView({
    super.key,
    required this.showOverLay,
    required this.child,
  });

  final bool showOverLay;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (showOverLay)
          Container(
            alignment: Alignment.center,
            color: Colors.black54,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150.h,
                  height: 150.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Transform.scale(
                    scale: 0.3,
                    child: CircularProgressIndicator(
                      valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
                      strokeWidth: 20.sp,
                      backgroundColor: const Color(0xffe2f7fc),
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
