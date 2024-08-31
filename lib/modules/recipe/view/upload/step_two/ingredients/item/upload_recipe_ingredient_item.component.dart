import 'package:chefio_recipe_app/assets/assets.dart';
import 'package:chefio_recipe_app/core/widgets/inputs/custom_textfield.dart';
import 'package:chefio_recipe_app/modules/recipe/view/upload/step_two/ingredients/item/upload_recipe_ingredient_item.controller.dart';
import 'package:chefio_recipe_app/modules/recipe/view/upload/upload_recipe.controller.dart';
import 'package:chefio_recipe_app/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class UploadRecipeIngredientItemComponent extends StatelessWidget {
  const UploadRecipeIngredientItemComponent(
    this.ingredient, {
    super.key,
    required this.index,
  });

  final String ingredient;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UploadRecipeIngredientItemController(
        ingredient: ingredient,
        index: index,
      ),
      child: const _UploadRecipeIngredientItemComponent(),
    );
  }
}

class _UploadRecipeIngredientItemComponent extends StatefulWidget {
  const _UploadRecipeIngredientItemComponent();

  @override
  State<_UploadRecipeIngredientItemComponent> createState() =>
      __UploadRecipeIngredientItemComponentState();
}

class __UploadRecipeIngredientItemComponentState
    extends State<_UploadRecipeIngredientItemComponent> {
  void delete() {
    final index = context.read<UploadRecipeIngredientItemController>().index;
    context.read<UploadRecipeController>().deleteIngredient(index);
  }

  void update(String value) {
    final index = context.read<UploadRecipeIngredientItemController>().index;
    context
        .read<UploadRecipeController>()
        .updateIngredient(index: index, name: value.trim());
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.read<UploadRecipeIngredientItemController>();

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Slidable(
        key: ValueKey(controller.index),
        startActionPane: ActionPane(
          motion: const BehindMotion(),
          extentRatio: 0.15,
          children: [
            IconButton(
              onPressed: delete,
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.horizontal),
          child: Row(
            children: [
              ReorderableDragStartListener(
                index: controller.index,
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
                  controller: controller.textController,
                  textCapitalization: TextCapitalization.sentences,
                  onChanged: update,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the ingredient';
                    }

                    return null;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
