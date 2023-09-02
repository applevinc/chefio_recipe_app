
import 'package:chefio_recipe_app/modules/recipe/screens/upload_recipe/upload_recipe_viewmodel.dart';
import 'package:chefio_recipe_app/shared/assets/icons.dart';
import 'package:chefio_recipe_app/shared/assets/images.dart';
import 'package:chefio_recipe_app/shared/styles/colors.dart';
import 'package:chefio_recipe_app/shared/widgets/buttons/custom_button.dart';
import 'package:chefio_recipe_app/shared/widgets/others/grey_divider.dart';
import 'package:chefio_recipe_app/modules/shared/dashboard/dashboard_view.dart';
import 'package:chefio_recipe_app/modules/recipe/screens/widgets/add_ingredient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class UploadRecipeStepTwoView extends StatelessWidget {
  const UploadRecipeStepTwoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: const [
          _Ingredients(),
          GreyDivider(),
          _Steps(),
          _Actions(),
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
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              TextButton.icon(
                icon: const Icon(Icons.add, color: AppColors.headlineText),
                label: Text(
                  'Group',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
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
              hintStyle: Theme.of(context).textTheme.bodyLarge,
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
  const _Actions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<UploadRecipeViewModel>();
    final pageController = viewModel.pageController;

    return Padding(
      padding: EdgeInsets.only(right: 24.w, left: 24.w, bottom: 24.h),
      child: Row(
        children: [
          Expanded(
            child: AppButton(
              label: 'Back',
              backgroundColor: AppColors.form,
              labelColor: AppColors.mainText,
              onPressed: () {
                pageController.jumpToPage(0);
                viewModel.setPageNo(0);
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
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            'Your recipe has been uploaded, you can see it on your profile',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
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