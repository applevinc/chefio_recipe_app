import 'package:chefio_recipe_app/shared/assets/assets.dart';
import 'package:chefio_recipe_app/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UploadRecipeStepsView extends StatelessWidget {
  const UploadRecipeStepsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 24.h,
        left: AppPadding.horizontal,
        right: AppPadding.horizontal,
        bottom: 40.h,
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Steps',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          SizedBox(height: 24.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10.sp),
                    decoration: const BoxDecoration(
                      color: AppColors.headlineText,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '1',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.white, fontSize: 12.sp),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Image.asset(
                    AppImages.dragIcon,
                    width: 24.h,
                    height: 24.h,
                  ),
                ],
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Column(
                  children: [
                    TextFormField(
                      maxLines: 4,
                      decoration: InputDecoration(
                        hintText: 'Tell a little about your food',
                        hintStyle: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontSize: 12.sp),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: const BorderSide(
                            //color: AppColors.outline,
                            width: 1.0,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      height: 44.h,
                      width: MediaQuery.of(context).size.width * 0.786,
                      decoration: BoxDecoration(
                        color: AppColors.form,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      alignment: Alignment.center,
                      child: SvgPicture.asset(AppIcons.camera),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
