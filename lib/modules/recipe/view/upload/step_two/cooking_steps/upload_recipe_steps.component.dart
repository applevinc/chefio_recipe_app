import 'package:chefio_recipe_app/modules/recipe/view/upload/step_two/cooking_steps/item/upload_recipe_cooking_step_item.component.dart';
import 'package:chefio_recipe_app/modules/recipe/view/upload/upload_recipe.controller.dart';
import 'package:chefio_recipe_app/modules/recipe/view/widgets/upload_recipe_add_button.dart';
import 'package:chefio_recipe_app/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class UploadRecipeCookingStepsComponent extends StatelessWidget {
  const UploadRecipeCookingStepsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<UploadRecipeController>();
    final cookingSteps = controller.cookingSteps;

    return Padding(
      padding: EdgeInsets.only(
        top: 24.h,
        bottom: 40.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: AppPadding.horizontal),
            child: Text(
              'Steps',
              style: AppText.bold700(context).copyWith(
                fontSize: 17.sp,
              ),
            ),
          ),
          Builder(
            builder: (context) {
              if (cookingSteps.isEmpty) {
                return const SizedBox.shrink();
              }

              return ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(top: 24.h),
                shrinkWrap: true,
                itemCount: cookingSteps.length,
                itemBuilder: (context, index) {
                  final cookingStep = cookingSteps[index];
                  return UploadRecipeCookingStepItemComponent(
                    cookingStep,
                    index: index,
                    key: UniqueKey(),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 24.h),
              );
            },
          ),
          UploadRecipeAddButton(
            label: 'Step',
            onTap: controller.addCookingStep,
          ),
        ],
      ),
    );
  }
}
