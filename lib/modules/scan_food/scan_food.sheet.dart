import 'package:chefio_recipe_app/assets/images.dart';
import 'package:chefio_recipe_app/styles/colors.dart';
import 'package:chefio_recipe_app/styles/text.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScanSheet extends StatelessWidget {
  const ScanSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 27.h, horizontal: 24.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30.r),
          topLeft: Radius.circular(20.r),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.close,
                  size: 24.sp,
                  color: const Color(0xFF3D5480),
                ),
              ),
              Text(
                'Choose one option',
                style: AppText.bold700(context).copyWith(
                  color: const Color(0xFF3D5480),
                  fontSize: 17.sp,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.close,
                  size: 24.sp,
                  color: Colors.transparent,
                ),
              ),
            ],
          ),
          SizedBox(height: 29.h),
          Row(
            children: [
              _Card(
                image: AppImages.food,
                title: 'Food',
                onTap: () {
                  //  AppNavigator.to(
                  //    context,
                  //    const ScanCameraScreen(scanOption: 'Food'),
                  //  );
                  //AppNavigator.to(context, const ScanFoodResultsScreen(type: 'Food'));
                },
              ),
              SizedBox(width: 16.w),
              _Card(
                image: AppImages.ingredients,
                title: 'Ingredient',
                onTap: () {
                  //  AppNavigator.to(
                  //    context,
                  //    const ScanCameraScreen(scanOption: 'Ingredient'),
                  //  );
                  //  AppNavigator.to(
                  //      context, const ScanFoodResultsScreen(type: 'Ingredient'));
                },
              ),
            ],
          ),
          SizedBox(height: 35.h),
        ],
      ),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({
    required this.image,
    required this.title,
    required this.onTap,
  });

  final String image;
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16.r),
        child: Container(
          width: 155.w,
          height: 186.h,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: AppColors.outline,
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(16.r),
          ),
          padding: EdgeInsets.only(
            top: 30.h,
            right: 30.w,
            left: 30.w,
            bottom: 20.h,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
                height: 96.h,
                width: 96.h,
              ),
              SizedBox(height: 14.h),
              Text(
                title,
                style: AppText.bold700(context).copyWith(
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
