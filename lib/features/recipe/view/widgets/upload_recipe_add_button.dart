import 'package:chefio_recipe_app/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UploadRecipeAddButton extends StatelessWidget {
  const UploadRecipeAddButton({
    super.key,
    required this.label,
    required this.onTap,
  });

  final String label;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 8.h,
        left: AppPadding.horizontal,
        right: AppPadding.horizontal,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(32.r),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 19.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32.r),
            color: Colors.white,
            border: Border.all(color: AppColors.outline, width: 1.h),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add,
                color: AppColors.headlineText,
                size: 24.sp,
              ),
              SizedBox(width: 5.w),
              Text(
                label,
                style: AppText.bold500(context).copyWith(
                  color: AppColors.headlineText,
                  fontSize: 15.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
