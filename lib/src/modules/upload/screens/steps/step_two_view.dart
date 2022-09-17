import 'package:chefio_recipe_app/src/shared/assets/icons.dart';
import 'package:chefio_recipe_app/src/shared/assets/images.dart';
import 'package:chefio_recipe_app/src/shared/styles/colors.dart';
import 'package:chefio_recipe_app/src/shared/widgets/buttons/custom_button.dart';
import 'package:chefio_recipe_app/src/shared/widgets/others/grey_divider.dart';
import 'package:chefio_recipe_app/src/modules/dashboard/screens/dashboard_view.dart';
import 'package:chefio_recipe_app/src/modules/upload/screens/upload.dart';
import 'package:chefio_recipe_app/src/modules/upload/widgets/add_ingredient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class StepTwoView extends StatelessWidget {
  const StepTwoView({Key? key, required this.pageController}) : super(key: key);

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const _Ingredients(),
          const GreyDivider(),
          const _Steps(),
          _Actions(pageController: pageController),
        ],
      ),
    );
  }
}

class _Ingredients extends StatelessWidget {
  const _Ingredients({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Ingredients',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              TextButton.icon(
                icon: const Icon(Icons.add, color: AppColors.headlineText),
                label: Text(
                  'Group',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: AppColors.headlineText),
                ),
                onPressed: () {},
              ),
            ],
          ),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(bottom: 32.h, top: 26.h),
            shrinkWrap: true,
            itemCount: 2,
            itemBuilder: (BuildContext context, int index) {
              return const _IngredientItem();
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: 24.h);
            },
          ),
          const AddIngredient(),
        ],
      ),
    );
  }
}

class _IngredientItem extends StatelessWidget {
  const _IngredientItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(AppIcons.dragIcon),
        SizedBox(width: 8.w),
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              hintText: 'Enter ingredient',
              hintStyle: Theme.of(context).textTheme.bodyText1,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32.r),
                borderSide: const BorderSide(
                  //color: AppColors.outline,
                  width: 1.0,
                  style: BorderStyle.solid,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _Steps extends StatelessWidget {
  const _Steps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Steps',
              style: Theme.of(context).textTheme.bodyText2,
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
                          .bodyText2!
                          .copyWith(color: Colors.white, fontSize: 12.sp),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  SvgPicture.asset(AppIcons.dragIcon),
                ],
              ),
              SizedBox(width: 8.w),
              Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.786,
                    child: TextFormField(
                      maxLines: 4,
                      decoration: InputDecoration(
                        hintText: 'Tell a little about your food',
                        hintStyle: Theme.of(context)
                            .textTheme
                            .bodyText1!
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
            ],
          ),
        ],
      ),
    );
  }
}

class _Actions extends StatelessWidget {
  const _Actions({Key? key, required this.pageController}) : super(key: key);

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    var pageNotifier = context.watch<UploadPageViewController>();

    return Padding(
      padding: EdgeInsets.only(right: 24.w, left: 24.w, bottom: 24.h),
      child: Row(
        children: [
          Expanded(
            child: AppButton(
              label: 'Back',
              bgColor: AppColors.form,
              labelColor: AppColors.mainText,
              onPressed: () {
                pageController.jumpToPage(0);
                pageNotifier.setPageNo(0);
              },
            ),
          ),
          SizedBox(width: 15.w),
          Expanded(
            child: AppButton(
              label: 'Next',
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      contentPadding: EdgeInsets.only(
                        left: 43.w,
                        right: 43.w,
                        top: 48.h,
                      ),
                      actionsPadding: EdgeInsets.only(
                        left: 43.w,
                        right: 43.w,
                        bottom: 48.h,
                        top: 24.h,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.r),
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(AppImages.uploadSuccess),
                          SizedBox(height: 32.h),
                          Text(
                            'Upload Success',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            'Your recipe has been uploaded, you can see it on your profile',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: AppColors.mainText),
                          ),
                        ],
                      ),
                      actions: [
                        AppButton(
                          label: 'Back to Home',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const DashBoardView(),
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
