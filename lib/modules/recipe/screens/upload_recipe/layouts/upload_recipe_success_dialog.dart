import 'package:chefio_recipe_app/modules/shared/dashboard/dashboard_view.dart';
import 'package:chefio_recipe_app/shared/assets/images.dart';
import 'package:chefio_recipe_app/shared/styles/styles.dart';
import 'package:chefio_recipe_app/shared/utils/navigator.dart';
import 'package:chefio_recipe_app/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UploadRecipeSuccessDialog extends StatelessWidget {
  const UploadRecipeSuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.only(
        left: 43.w,
        right: 43.w,
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
          Image.asset(AppImages.uploadSuccess),
          SizedBox(height: 32.h),
          Text(
            'Upload Success',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(height: 8.h),
          Text(
            'Your recipe has been uploaded, you can see it on your profile',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: AppColors.mainText),
          ),
        ],
      ),
      actions: [
        AppButton(
          label: 'Back to Home',
          onPressed: () {
            AppNavigator.pushAndRemoveUntil(context, const DashBoardView());
          },
        ),
      ],
    );
  }
}
