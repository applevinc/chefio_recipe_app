import 'package:chefio_recipe_app/modules/recipe/screens/upload_recipe/layouts/upload_recipe_success_dialog.dart';
import 'package:chefio_recipe_app/modules/recipe/screens/upload_recipe/steps/components/upload_recipe_ingredients_view.dart';
import 'package:chefio_recipe_app/modules/recipe/screens/upload_recipe/steps/components/upload_recipe_steps_view.dart';
import 'package:chefio_recipe_app/modules/recipe/screens/upload_recipe/upload_recipe_viewmodel.dart';
import 'package:chefio_recipe_app/styles/styles.dart';
import 'package:chefio_recipe_app/common/widgets/buttons/custom_button.dart';
import 'package:chefio_recipe_app/common/widgets/inputs/close_keyboard_wrapper.dart';
import 'package:chefio_recipe_app/common/widgets/others/grey_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class UploadRecipeStepTwoView extends StatefulWidget {
  const UploadRecipeStepTwoView({Key? key}) : super(key: key);

  @override
  State<UploadRecipeStepTwoView> createState() => _UploadRecipeStepTwoViewState();
}

class _UploadRecipeStepTwoViewState extends State<UploadRecipeStepTwoView> {
  final _formKey = GlobalKey<FormState>();

  void submit() async {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const UploadRecipeSuccessDialog();
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<UploadRecipeViewModel>();

    return CloseKeyboardWrapper(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                UploadRecipeIngredientsView(),
                GreyDivider(),
                UploadRecipeStepsView(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(
            top: 5.h,
            right: 24.w,
            left: 24.w,
            bottom: 30.h,
          ),
          decoration: BoxDecoration(
            boxShadow: AppColors.boxshadow,
            color: Colors.white,
          ),
          child: Row(
            children: [
              Expanded(
                child: AppButton(
                  label: 'Back',
                  backgroundColor: AppColors.form,
                  labelColor: AppColors.mainText,
                  onPressed: viewModel.isBusy
                      ? () {}
                      : () {
                          viewModel.pageController.animateToPage(
                            0,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                          viewModel.setPageNo(0);
                        },
                ),
              ),
              SizedBox(width: 15.w),
              Expanded(
                child: AppButton(
                  label: 'Submit',
                  isBusy: viewModel.isBusy,
                  onPressed: submit,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
