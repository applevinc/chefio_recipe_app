import 'package:chefio_recipe_app/core/views/cooking_time.view.dart';
import 'package:chefio_recipe_app/modules/recipe/view/upload/step_one/components/upload_recipe_cover_photo.component.dart';
import 'package:chefio_recipe_app/modules/recipe/view/upload/upload_recipe.controller.dart';
import 'package:chefio_recipe_app/styles/colors.dart';
import 'package:chefio_recipe_app/core/widgets/buttons/custom_button.dart';
import 'package:chefio_recipe_app/core/widgets/inputs/custom_textfield.dart';
import 'package:chefio_recipe_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class UploadRecipeStepOneView extends StatefulWidget {
  const UploadRecipeStepOneView({super.key});

  @override
  State<UploadRecipeStepOneView> createState() => _UploadRecipeStepOneViewState();
}

class _UploadRecipeStepOneViewState extends State<UploadRecipeStepOneView> {
  final _formKey = GlobalKey<FormState>();

  void moveToNext() {
    if (_formKey.currentState!.validate()) {
      final controller = context.read<UploadRecipeController>();

      if (controller.coverPhoto == null) {
        Messenger.error(context: context, message: 'Cover photo is required');
        return;
      }

      controller.pageController.animateToPage(
        1,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      controller.setPageNo(1);
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.read<UploadRecipeController>();

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const UploadRecipeCoverPhotoComponent(),
            SizedBox(height: 24.h),
            CustomTextField(
              title: 'Food Name',
              hintText: 'Enter food name',
              controller: controller.foodNameController,
              textCapitalization: TextCapitalization.sentences,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your food name';
                }

                return null;
              },
            ),
            SizedBox(height: 24.h),
            CustomTextField(
              title: 'Description',
              hintText: 'Tell a little about your food',
              controller: controller.foodDescriptionController,
              textCapitalization: TextCapitalization.sentences,
              maxLines: 3,
              contentPadding: EdgeInsets.all(16.sp),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: const BorderSide(
                  color: AppColors.outline,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter tell us about your food';
                }

                return null;
              },
            ),
            SizedBox(height: 24.h),
            const CookingTimeView<UploadRecipeController>(),
            SizedBox(height: 30.h),
            AppButton(
              label: 'NEXT',
              onPressed: moveToNext,
            ),
          ],
        ),
      ),
    );
  }
}
