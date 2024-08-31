import 'package:chefio_recipe_app/core/widgets/others/custom_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchRecipeShimmer extends StatelessWidget {
  const SearchRecipeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomShimmer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerContainer(height: 8.h),
          ListView.separated(
            itemCount: 4,
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 24.w),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => ShimmerContainer(height: 27.h),
            separatorBuilder: (context, index) => SizedBox(height: 24.h),
          ),
          ShimmerContainer(height: 8.h),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerContainer(height: 27.h, width: 147.w),
                SizedBox(height: 24.h),
                Wrap(
                  spacing: 8.w,
                  runSpacing: 16.h,
                  children: List.generate(
                    8,
                    (index) => ShimmerContainer(
                      height: 48.h,
                      width: 118.w,
                      borderRadius: BorderRadius.circular(32.r),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}