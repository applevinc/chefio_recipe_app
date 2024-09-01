import 'package:chefio_recipe_app/assets/images.dart';
import 'package:chefio_recipe_app/modules/dashboard/dashboard.component.dart';
import 'package:chefio_recipe_app/styles/styles.dart';

import 'package:chefio_recipe_app/core/widgets/widgets.dart';
import 'package:chefio_recipe_app/utils/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UploadRecipeSuccessDialog extends StatelessWidget {
  const UploadRecipeSuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.only(
        top: 48.h,
      ),
      actionsPadding: EdgeInsets.only(
        left: 43.w,
        right: 43.w,
        bottom: 48.h,
        top: 24.h,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32.r),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            AppImages.uploadSuccess,
            width: 160.h,
            height: 160.h,
          ),
          SizedBox(height: 32.h),
          Text(
            'Upload Success',
            style: AppText.bold700(context).copyWith(
              fontSize: 22.sp,
            ),
          ),
          SizedBox(height: 8.h),
          SizedBox(
            width: 240.w,
            child: Text(
              'Your recipe has been uploaded, you can see it on your profile',
              textAlign: TextAlign.center,
              style: AppText.bold500(context).copyWith(
                fontSize: 15.sp,
              ),
            ),
          ),
        ],
      ),
      actions: [
        AppButton(
          label: 'Back to Home',
          onPressed: () {
            context.go(const DashBoardComponent());
          },
        ),
      ],
    );
  }
}
