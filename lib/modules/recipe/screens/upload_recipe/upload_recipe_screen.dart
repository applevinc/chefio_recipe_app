import 'package:chefio_recipe_app/modules/recipe/screens/upload_recipe/steps/upload_recipe_step_one_view.dart';
import 'package:chefio_recipe_app/modules/recipe/screens/upload_recipe/steps/upload_recipe_step_two_view.dart';
import 'package:chefio_recipe_app/modules/recipe/screens/upload_recipe/upload_recipe_viewmodel.dart';
import 'package:chefio_recipe_app/shared/styles/colors.dart';
import 'package:chefio_recipe_app/shared/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class UploadRecipeScreen extends StatelessWidget {
  const UploadRecipeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<UploadRecipeViewModel>();
    final pageController = viewModel.pageController;

    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          leadingWidth: 85.w,
          toolbarHeight: 40.h,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: EdgeInsets.only(top: 12.h, left: 24.w),
              child: Text(
                'Cancel',
                style: AppText.bold700(context).copyWith(
                  color: AppColors.secondary,
                  fontSize: 17.sp,
                ),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(top: 12.h, right: 24.w),
              child: RichText(
                text: TextSpan(
                  text: '1',
                  style: AppText.bold700(context).copyWith(
                    color: viewModel.pageNo == 0
                        ? AppColors.headlineText
                        : AppColors.secondaryText,
                    fontSize: 17.sp,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: '/',
                      style: AppText.bold700(context).copyWith(
                        fontSize: 17.sp,
                      ),
                    ),
                    TextSpan(
                      text: '2',
                      style: AppText.bold700(context).copyWith(
                        color: viewModel.pageNo == 1
                            ? AppColors.headlineText
                            : AppColors.secondaryText,
                        fontSize: 17.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        body: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: const <Widget>[
            UploadRecipeStepOneView(),
            UploadRecipeStepTwoView(),
          ],
        ),
      ),
    );
  }
}
