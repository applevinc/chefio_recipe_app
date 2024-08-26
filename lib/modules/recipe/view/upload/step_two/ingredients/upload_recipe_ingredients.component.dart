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
      padding: EdgeInsets.symmetric(vertical: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: AppPadding.horizontal),
            child: Text(
              'Ingredients',
              style: AppText.bold700(context).copyWith(
                fontSize: 17.sp,
              ),
            ),
          ),
          ReorderableListView(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(top: 10.h),
            shrinkWrap: true,
            buildDefaultDragHandles: false,
            proxyDecorator: (child, index, animation) {
              return Material(
                color: AppColors.primary.withOpacity(.1),
                elevation: 0,
                child: child,
              );
            },
            onReorder: controller.onIngredientsReorder,
            children: [
              for (var i = 0; i < ingredients.length; i++)
                UploadRecipeIngredientItemComponent(
                  ingredients[i],
                  index: i,
                  key: UniqueKey(),
                ),
            ],
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
