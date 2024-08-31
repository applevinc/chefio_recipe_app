import 'dart:io';

import 'package:chefio_recipe_app/core/widgets/image/custom_cached_network_image.dart';
import 'package:chefio_recipe_app/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditImageComponent extends StatelessWidget {
  const EditImageComponent({
    super.key,
    this.imageFile,
    this.imageUrl,
    this.onTap,
  });

  final File? imageFile;
  final String? imageUrl;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final size = 114.h;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Builder(builder: (context) {
          final decoration = BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(color: AppColors.primary),
          );

          if (imageFile != null) {
            return Container(
              decoration: decoration,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100.r),
                child: Image.file(
                  imageFile!,
                  height: size,
                  width: size,
                  fit: BoxFit.cover,
                ),
              ),
            );
          }

          if (imageUrl != null) {
            return CustomCacheNetworkImage(
              imageUrl: imageUrl!,
              height: size,
              width: size,
              shape: BoxShape.circle,
            );
          }

          return Container(
            height: size,
            width: size,
            decoration: decoration,
            child: Icon(
              Icons.person_outline,
              color: AppColors.primary,
              size: 70.sp,
            ),
          );
        }),
        Positioned(
          bottom: 0,
          right: 5.w,
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.all(4.sp),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: Icon(
                Icons.edit,
                color: Colors.white,
                size: 15.sp,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
