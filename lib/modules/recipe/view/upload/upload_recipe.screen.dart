import 'package:chefio_recipe_app/core/widgets/inputs/close_keyboard_wrapper.dart';
import 'package:chefio_recipe_app/core/widgets/others/loading_overlay_view.dart';
import 'package:chefio_recipe_app/config/locator/locator.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/repositories/i_recipe_repository.dart';
import 'package:chefio_recipe_app/modules/recipe/view/upload/step_one/upload_recipe_step_one.view.dart';
import 'package:chefio_recipe_app/modules/recipe/view/upload/step_two/upload_recipe_step_two_view.dart';
import 'package:chefio_recipe_app/modules/recipe/view/upload/upload_recipe.controller.dart';
import 'package:chefio_recipe_app/styles/colors.dart';
import 'package:chefio_recipe_app/styles/text.dart';
import 'package:chefio_recipe_app/utils/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class UploadRecipeScreen extends StatelessWidget {
  const UploadRecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UploadRecipeController(
        recipeRepository: locator<IRecipeRepository>(),
      ),
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
    final titleStyle = AppText.bold700(context).copyWith(
      fontSize: 17.sp,
    );

    return PopScope(
      canPop: controller.isBusy == false && controller.pageNo == 0,
      child: LoadingOverlayView(
        showOverLay: controller.isBusy,
        child: CloseKeyboardWrapper(
          child: Scaffold(
            appBar: AppBar(
              leadingWidth: 110.w,
              leading: TextButton(
                onPressed: () {
                  context.pop();
                },
                child: Text(
                  'Cancel',
                  style: titleStyle.copyWith(
                    color: AppColors.secondary,
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.only(top: 12.h, right: 24.w),
                  child: RichText(
                    text: TextSpan(
                      text: '1',
                      style: titleStyle.copyWith(
                        color: controller.pageNo == 0
                            ? AppColors.headlineText
                            : AppColors.secondaryText,
                        fontSize: 17.sp,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '/',
                          style: titleStyle,
                        ),
                        TextSpan(
                          text: '2',
                          style: titleStyle.copyWith(
                            color: controller.pageNo == 1
                                ? AppColors.headlineText
                                : AppColors.secondaryText,
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
        ),
      ),
    );
  }
}
