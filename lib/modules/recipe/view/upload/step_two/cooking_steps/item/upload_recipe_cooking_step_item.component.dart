import 'package:chefio_recipe_app/core/widgets/inputs/custom_textfield.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/entities/requests/cooking_step.request.dart';
import 'package:chefio_recipe_app/modules/recipe/view/upload/step_two/cooking_steps/item/upload_recipe_cooking_step_item.controller.dart';
import 'package:chefio_recipe_app/modules/recipe/view/upload/upload_recipe.controller.dart';
import 'package:chefio_recipe_app/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../../../../../assets/assets.dart';

class UploadRecipeCookingStepItemComponent extends StatelessWidget {
  const UploadRecipeCookingStepItemComponent(
    this.cookingStep, {
    super.key,
    required this.index,
  });

  final CookingStepRequest cookingStep;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UploadRecipeCookingStepItemController(
        cookingStep: cookingStep,
        index: index,
      ),
      child: const _UploadRecipeCookingStepItemComponent(),
    );
  }
}

class _UploadRecipeCookingStepItemComponent extends StatefulWidget {
  const _UploadRecipeCookingStepItemComponent();

  @override
  State<_UploadRecipeCookingStepItemComponent> createState() =>
      __UploadRecipeCookingStepItemComponentState();
}

class __UploadRecipeCookingStepItemComponentState
    extends State<_UploadRecipeCookingStepItemComponent> {
  void delete() {
    final index = context.read<UploadRecipeCookingStepItemController>().index;
    context.read<UploadRecipeController>().deleteCookingStep(index);
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<UploadRecipeCookingStepItemController>();

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
          padding: AppPadding.symetricHorizontalOnly,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10.sp),
                    decoration: const BoxDecoration(
                      color: AppColors.headlineText,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      (controller.cookingStep.step).toString(),
                      style: AppText.bold700(context).copyWith(
                        color: Colors.white,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  ReorderableDragStartListener(
                    index: controller.index,
                    child: Image.asset(
                      AppImages.dragIcon,
                      width: 24.h,
                      height: 24.h,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Column(
                  children: [
                    CustomTextField(
                      hintText: 'Tell a little about your food',
                      controller: controller.textController,
                      maxLines: 3,
                      textCapitalization: TextCapitalization.sentences,
                      contentPadding: EdgeInsets.all(16.sp),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: const BorderSide(
                          color: AppColors.outline,
                        ),
                      ),
                      onChanged: controller.updateDescription,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please tell us about your food';
                        }

                        return null;
                      },
                    ),
                    SizedBox(height: 8.h),
                    const _ImageComponent(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ImageComponent extends StatefulWidget {
  const _ImageComponent();

  @override
  State<_ImageComponent> createState() => _ImageComponentState();
}

class _ImageComponentState extends State<_ImageComponent> {
  void upload() {
    context.read<UploadRecipeCookingStepItemController>().uploadPhoto();
  }

  void delete() {
    context.read<UploadRecipeCookingStepItemController>().deletePhoto();
  }

  @override
  Widget build(BuildContext context) {
    final photo =
        context.watch<UploadRecipeCookingStepItemController>().cookingStep.photo;

    if (photo == null) {
      return InkWell(
        onTap: upload,
        child: Container(
          height: 44.h,
          width: 295.w,
          decoration: BoxDecoration(
            color: AppColors.form,
            borderRadius: BorderRadius.circular(8.r),
          ),
          alignment: Alignment.center,
          child: SvgPicture.asset(AppIcons.camera),
        ),
      );
    }

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topRight,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.r),
          child: Image.file(
            photo,
            height: 100.h,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.sp),
          child: GestureDetector(
            onTap: delete,
            child: Container(
              padding: EdgeInsets.all(4.sp),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x07000000),
                    blurRadius: 26.79,
                    offset: Offset(0, 0),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Icon(
                Icons.close,
                color: Colors.white,
                size: 14.sp,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
