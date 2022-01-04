import 'package:chefio_recipe_app/src/core/assets/icons.dart';
import 'package:chefio_recipe_app/src/core/theme/colors.dart';
import 'package:chefio_recipe_app/src/core/widgets/custom_button.dart';
import 'package:chefio_recipe_app/src/view/search/layouts/filter_bottomsheet.dart';
import 'package:chefio_recipe_app/src/view/upload/screens/upload.dart';
import 'package:chefio_recipe_app/src/view/upload/widgets/textformfield.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class StepOneView extends StatelessWidget {
  const StepOneView({Key? key, required this.pageController}) : super(key: key);

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    var pageNotifier = context.watch<UploadPageViewController>();

    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
            child: Column(
              children: [
                const _UploadImage(),
                SizedBox(height: 24.h),
                const UploadFormField(
                  label: 'Food Name',
                  hintText: 'Enter food name',
                ),
                SizedBox(height: 24.h),
                const UploadFormField(
                  label: 'Description',
                  hintText: 'Tell a little about your food',
                  maxLines: 3,
                ),
                SizedBox(height: 24.h),
                const CookingDuration(),
                const Spacer(),
                CustomButton(
                  label: 'NEXT',
                  onPressed: () {
                    pageController.jumpToPage(1);
                    pageNotifier.setPageNo(1);
                  },
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}



class _UploadImage extends StatelessWidget {
  const _UploadImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DottedBorder(
        borderType: BorderType.RRect,
        dashPattern: [8.w, 4.w],
        color: AppColors.outline,
        radius: Radius.circular(16.r),
        padding: EdgeInsets.symmetric(vertical: 17.h),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(16.r)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppIcons.uploadImage),
              SizedBox(height: 16.h),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Add Cover Photo',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: AppColors.headlineText,
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ),
              SizedBox(height: 8.h),
              Align(
                alignment: Alignment.center,
                child: Text(
                  '(up to 12 Mb)',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 12.sp,
                        color: AppColors.secondaryText,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
