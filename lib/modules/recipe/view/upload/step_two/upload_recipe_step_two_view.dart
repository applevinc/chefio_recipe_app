import 'package:chefio_recipe_app/core/models/failure.dart';
import 'package:chefio_recipe_app/modules/recipe/view/upload/dialogs/upload_recipe_success_dialog.dart';
import 'package:chefio_recipe_app/modules/recipe/view/upload/step_two/ingredients/upload_recipe_ingredients.component.dart';
import 'package:chefio_recipe_app/modules/recipe/view/upload/step_two/cooking_steps/upload_recipe_steps.component.dart';
import 'package:chefio_recipe_app/modules/recipe/view/upload/upload_recipe.controller.dart';
import 'package:chefio_recipe_app/styles/styles.dart';
import 'package:chefio_recipe_app/core/widgets/buttons/custom_button.dart';
import 'package:chefio_recipe_app/core/widgets/others/grey_divider.dart';
import 'package:chefio_recipe_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class UploadRecipeStepTwoView extends StatefulWidget {
  const UploadRecipeStepTwoView({super.key});

  @override
  State<UploadRecipeStepTwoView> createState() => _UploadRecipeStepTwoViewState();
}

class _UploadRecipeStepTwoViewState extends State<UploadRecipeStepTwoView> {
  final _formKey = GlobalKey<FormState>();

  void onBackPressed() {
    final controller = context.read<UploadRecipeController>();
    controller.pageController.animateToPage(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
    controller.setPageNo(0);
  }

  void submit() async {
    if (_formKey.currentState!.validate()) {
      try {
        await context.read<UploadRecipeController>().execute();

        if (!mounted) {
          return;
        }

        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return const UploadRecipeSuccessDialog();
          },
        );
      } on Failure catch (e) {
        Messenger.error(context: context, message: e.message);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const UploadRecipeIngredientsComponent(),
            const GreyDivider(),
            const UploadRecipeCookingStepsComponent(),
            Padding(
              padding: EdgeInsets.only(
                top: 5.h,
                right: 24.w,
                left: 24.w,
                bottom: 30.h,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: AppButton(
                      label: 'Back',
                      backgroundColor: AppColors.form,
                      labelColor: AppColors.mainText,
                      onPressed: onBackPressed,
                    ),
                  ),
                  SizedBox(width: 15.w),
                  Expanded(
                    child: AppButton(
                      label: 'Submit',
                      onPressed: submit,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
