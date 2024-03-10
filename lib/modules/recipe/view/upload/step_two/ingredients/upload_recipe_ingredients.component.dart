import 'package:chefio_recipe_app/modules/recipe/view/upload/step_two/ingredients/item/upload_recipe_ingredient_item.component.dart';
import 'package:chefio_recipe_app/modules/recipe/view/upload/upload_recipe.controller.dart';
import 'package:chefio_recipe_app/modules/recipe/view/widgets/upload_recipe_add_button.dart';
import 'package:chefio_recipe_app/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class UploadRecipeIngredientsComponent extends StatelessWidget {
  const UploadRecipeIngredientsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<UploadRecipeController>();
    final ingredients = controller.ingredients;

    return Padding(
      padding: EdgeInsets.only(
        top: 47.h,
        left: AppPadding.horizontal,
        right: AppPadding.horizontal,
        bottom: 24.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ingredients',
            style: AppText.bold700(context).copyWith(
              fontSize: 17.sp,
            ),
          ),
          Builder(
            builder: (context) {
              if (ingredients.isEmpty) {
                return const SizedBox.shrink();
              }

              return ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(top: 26.h),
                shrinkWrap: true,
                itemCount: ingredients.length,
                itemBuilder: (context, index) {
                  final ingredient = ingredients[index];
                  return UploadRecipeIngredientItemComponent(
                    ingredient,
                    index: index,
                    key: UniqueKey(),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 24.h),
              );
            },
          ),
          UploadRecipeAddButton(
            label: 'Ingredient',
            onTap: controller.addIngredient,
          ),
        ],
      ),
    );
  }
}
