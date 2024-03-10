import 'package:chefio_recipe_app/assets/assets.dart';
import 'package:chefio_recipe_app/modules/recipe/view/upload/upload_recipe.controller.dart';
import 'package:chefio_recipe_app/styles/styles.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class UploadRecipeCoverPhotoComponent extends StatelessWidget {
  const UploadRecipeCoverPhotoComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<UploadRecipeController>();
    final coverPhoto = controller.coverPhoto;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        GestureDetector(
          onTap: coverPhoto == null ? controller.uploadCoverPhoto : null,
          child: DottedBorder(
            borderType: BorderType.RRect,
            dashPattern: [8.w, 4.w],
            color: AppColors.outline,
            radius: Radius.circular(16.r),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(16.r)),
              child: Builder(
                builder: (context) {
                  if (coverPhoto == null) {
                    return addCoverPhotoView(context);
                  }

                  return Image.file(
                    coverPhoto,
                    width: 327.w,
                    height: 161.h,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ),
        ),
        if (coverPhoto != null)
          Positioned(
            top: -5.h,
            right: -4.w,
            child: GestureDetector(
              onTap: controller.deleteCoverPhoto,
              child: Container(
                padding: EdgeInsets.all(8.sp),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x07000000),
                      blurRadius: 26.79,
                      offset: Offset(0, 0),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Icon(
                  Icons.close,
                  size: 14.sp,
                  color: Colors.white,
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget addCoverPhotoView(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 17.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: SvgPicture.asset(
              AppIcons.uploadImage,
              width: 64.h,
              height: 64.h,
            ),
          ),
          SizedBox(height: 16.h),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Add Cover Photo',
              style: AppText.bold700(context).copyWith(
                color: AppColors.headlineText,
                fontWeight: FontWeight.w700,
                fontSize: 15.sp,
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            '(up to 12 Mb)',
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
