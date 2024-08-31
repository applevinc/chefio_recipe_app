import 'package:chefio_recipe_app/core/widgets/others/custom_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecipeGridItemShimmer extends StatelessWidget {
  const RecipeGridItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomShimmer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ShimmerContainer(
                height: 31.h,
                width: 31.h,
                borderRadius: BorderRadius.circular(11.r),
              ),
              SizedBox(width: 8.w),
              TextShimmer(width: 78.w),
            ],
          ),
          SizedBox(height: 16.h),
          ShimmerContainer(
            height: 151.h,
            borderRadius: BorderRadius.circular(16.r),
          ),
          SizedBox(height: 16.h),
          TextShimmer(width: 74.w),
          SizedBox(height: 8.h),
          TextShimmer(width: 90.w),
        ],
      ),
    );
  }
}
