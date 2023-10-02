import 'package:chefio_recipe_app/modules/recipe/models/upload_recipe.dart';
import 'package:chefio_recipe_app/modules/recipe/screens/upload_recipe/upload_recipe_viewmodel.dart';
import 'package:chefio_recipe_app/modules/recipe/screens/widgets/upload_recipe_add_button.dart';
import 'package:chefio_recipe_app/assets/assets.dart';
import 'package:chefio_recipe_app/styles/styles.dart';
import 'package:chefio_recipe_app/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class UploadRecipeIngredientsView extends StatelessWidget {
  const UploadRecipeIngredientsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<UploadRecipeViewModel>();
    final ingredients = viewModel.ingredients;

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
                  return _IngredientItemView(
                    ingredient: ingredient,
                    index: index,
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 24.h),
              );
            },
          ),
          UploadRecipeAddButton(
            label: 'Ingredient',
            onTap: viewModel.addIngredient,
          ),
        ],
      ),
    );
  }
}

class _IngredientItemView extends StatefulWidget {
  const _IngredientItemView({
    Key? key,
    required this.ingredient,
    required this.index,
  }) : super(key: key);

  final UploadRecipeIngredient ingredient;
  final int index;

  @override
  State<_IngredientItemView> createState() => _IngredientItemViewState();
}

class _IngredientItemViewState extends State<_IngredientItemView> {
  late final TextEditingController ingredientController;

  @override
  void initState() {
    super.initState();
    ingredientController = TextEditingController(text: widget.ingredient.name);
  }

  @override
  void dispose() {
    ingredientController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant _IngredientItemView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.ingredient.name != widget.ingredient.name) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ingredientController.text = widget.ingredient.name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<UploadRecipeViewModel>();

    return Slidable(
      key: ValueKey(widget.index),
      endActionPane: widget.index == 0
          ? null
          : ActionPane(
              motion: const BehindMotion(),
              extentRatio: 0.15,
              children: [
                CustomSlidableAction(
                  padding: EdgeInsets.only(bottom: 5.h),
                  child: const Icon(
                    Icons.delete_outline_outlined,
                    color: Colors.red,
                  ),
                  onPressed: (context) => viewModel.removeIngredient(widget.index),
                ),
              ],
            ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: Image.asset(
              AppImages.dragIcon,
              width: 24.h,
              height: 24.h,
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: CustomTextField(
              hintText: 'Enter ingredient',
              controller: ingredientController,
              onChanged: (value) => viewModel.updateIngredient(
                index: widget.index,
                ingredientName: value,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the ingredient name';
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}
