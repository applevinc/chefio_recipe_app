import 'package:chefio_recipe_app/modules/recipe/view/grid/detail/recipe_detail.controller.dart';
import 'package:chefio_recipe_app/styles/styles.dart';
import 'package:chefio_recipe_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class RecipeDetailIngredientsComponent extends StatelessWidget {
  const RecipeDetailIngredientsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final ingredients = context.read<RecipeDetailController>().recipe.ingredients;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ingredients',
            style: AppText.bold700(context).copyWith(
              fontSize: 16.sp,
            ),
          ),
          SizedBox(height: 16.h),
          ListView.separated(
            shrinkWrap: true,
            itemCount: ingredients.length,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => _IngredientItem(ingredients[index]),
            separatorBuilder: (context, index) => SizedBox(height: 16.h),
          ),
        ],
      ),
    );
  }
}

class _IngredientItem extends StatelessWidget {
  const _IngredientItem(this.ingredient);

  final String ingredient;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(6.sp),
          decoration: const BoxDecoration(
            color: Color(0xffE3FFF8),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.check,
            color: AppColors.primary,
            size: 12.sp,
          ),
        ),
        SizedBox(width: 8.w),
        Text(
          ingredient.capitalize,
          style: AppText.bold500(context),
        ),
      ],
    );
  }
}
