import 'dart:ui';
import 'package:chefio_recipe_app/src/shared/assets/images.dart';
import 'package:chefio_recipe_app/src/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecipesGrid extends StatelessWidget {
  const RecipesGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      primary: false,
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 25.w,
        mainAxisSpacing: 32.h,
        childAspectRatio: 151.w / 264.h,
      ),
      itemCount: 10,
      itemBuilder: (BuildContext context, index) => const RecipeGridItem(),
    );
  }
}

class RecipeGridItem extends StatelessWidget {
  const RecipeGridItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                AppImages.profileImg1,
                height: 31.h,
                width: 31.h,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 8.w),
              Text(
                'Calum Lewis',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppText.bold500(context).copyWith(
                  fontSize: 12.sp,
                ),
              )
            ],
          ),
          SizedBox(height: 16.h),
          const _GridViewImage(),
          SizedBox(height: 16.h),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Pancake',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppText.bold700(context).copyWith(
                color: AppColors.headlineText,
                fontSize: 17.sp,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Food • >60 mins',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppText.bold500(context).copyWith(
              fontSize: 12.sp,
              color: AppColors.secondaryText,
            ),
          ),
        ],
      ),
    );
  }
}

class _GridViewImage extends StatelessWidget {
  const _GridViewImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: Image.asset(
            AppImages.pancake,
            height: 151.h,
            width: 151.h,
            fit: BoxFit.cover,
          ),
        ),
        const _Favourite(),
      ],
    );
  }
}

class _Favourite extends StatelessWidget {
  const _Favourite({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 16.h,
      right: 16.w,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.r),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
          child: Container(
            width: 32.w,
            height: 32.h,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(
              Icons.favorite_border_rounded,
              size: 20.sp,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
