import 'dart:ui';
import 'package:chefio_recipe_app/src/core/assets/images.dart';
import 'package:chefio_recipe_app/src/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridViewBody extends StatelessWidget {
  const GridViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      primary: false,
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        crossAxisSpacing: 25.w,
        mainAxisSpacing: 32.h,
        mainAxisExtent: 280.h,
      ),
      itemCount: 6,
      itemBuilder: (BuildContext context, index) {
        return const _Item();
      },
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset(AppImages.profileImg1),
            SizedBox(width: 8.w),
            Text(
              'Calum Lewis',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontSize: 12.sp, color: AppColors.mainText),
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
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: AppColors.headlineText, fontSize: 17.sp),
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          'Food • >60 mins',
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 12.sp),
        ),
      ],
    );
  }
}

class _GridViewImage extends StatelessWidget {
  const _GridViewImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(AppImages.pancake),
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
