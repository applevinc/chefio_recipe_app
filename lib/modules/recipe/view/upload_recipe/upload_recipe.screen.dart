import 'package:chefio_recipe_app/modules/recipe/view/upload_recipe/steps/upload_recipe_step_one_view.dart';
import 'package:chefio_recipe_app/modules/recipe/view/upload_recipe/steps/upload_recipe_step_two_view.dart';
import 'package:chefio_recipe_app/modules/recipe/view/upload_recipe/upload_recipe.controller.dart';
import 'package:chefio_recipe_app/styles/colors.dart';
import 'package:chefio_recipe_app/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class UploadRecipeScreen extends StatelessWidget {
  const UploadRecipeScreen({super.key});

  static String route = '/upload-recipe';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UploadRecipeController(),
      child: const _UploadRecipeScreen(),
    );
  }
}

class _UploadRecipeScreen extends StatelessWidget {
  const _UploadRecipeScreen();

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<UploadRecipeController>();
    final pageController = controller.pageController;

    return PopScope(
      canPop: true,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          leadingWidth: 85.w,
          toolbarHeight: 40.h,
          leading: TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              'Cancel',
              style: AppText.bold700(context).copyWith(
                color: AppColors.secondary,
                fontSize: 17.sp,
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
                    color: controller.pageNo == 0
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
                        color: controller.pageNo == 1
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
