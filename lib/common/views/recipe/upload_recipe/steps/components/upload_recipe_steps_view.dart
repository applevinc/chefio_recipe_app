import 'dart:io';

import 'package:chefio_recipe_app/common/models/upload_recipe.dart';
import 'package:chefio_recipe_app/assets/assets.dart';
import 'package:chefio_recipe_app/common/views/recipe/upload_recipe/upload_recipe_viewmodel.dart';
import 'package:chefio_recipe_app/common/views/recipe/widgets/upload_recipe_add_button.dart';
import 'package:chefio_recipe_app/styles/styles.dart';
import 'package:chefio_recipe_app/common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class UploadRecipeStepsView extends StatelessWidget {
  const UploadRecipeStepsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<UploadRecipeViewModel>();
    final cookingSteps = viewModel.cookingSteps;

    return Padding(
      padding: EdgeInsets.only(
        top: 24.h,
        left: AppPadding.horizontal,
        right: AppPadding.horizontal,
        bottom: 40.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Steps',
            style: AppText.bold700(context).copyWith(
              fontSize: 17.sp,
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
                  return _CookingStepItemView(
                    cookingStep: cookingStep,
                    index: index,
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 24.h),
              );
            },
          ),
          UploadRecipeAddButton(
            label: 'Step',
            onTap: viewModel.addCookingStep,
          ),
        ],
      ),
    );
  }
}

class _CookingStepItemView extends StatefulWidget {
  const _CookingStepItemView({
    required this.index,
    required this.cookingStep,
  });

  final int index;
  final UploadRecipeCookingStep cookingStep;

  @override
  State<_CookingStepItemView> createState() => _CookingStepItemViewState();
}

class _CookingStepItemViewState extends State<_CookingStepItemView> {
  late final TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();
    descriptionController = TextEditingController(text: widget.cookingStep.description);
  }

  @override
  void dispose() {
    descriptionController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant _CookingStepItemView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.cookingStep.id != widget.cookingStep.id) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        descriptionController.text = widget.cookingStep.description;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<UploadRecipeViewModel>();

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
                  onPressed: (context) => viewModel.removeCookingStep(widget.index),
                ),
              ],
            ),
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
                  (widget.index + 1).toString(),
                  style: AppText.bold700(context).copyWith(
                    color: Colors.white,
                    fontSize: 12.sp,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Image.asset(
                AppImages.dragIcon,
                width: 24.h,
                height: 24.h,
              ),
            ],
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Column(
              children: [
                CustomTextField(
                  hintText: 'Tell a little about your food',
                  controller: descriptionController,
                  maxLines: 3,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: const BorderSide(
                      color: Color(0xffd0dbea),
                    ),
                  ),
                  onChanged: (value) => viewModel.updateCookingStepDescription(
                    index: widget.index,
                    description: value,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please tell us about your food';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 8.h),
                imageView(
                  photo: widget.cookingStep.photo,
                  onTap: () => viewModel.addPhotoForCookingStep(widget.index),
                  remove: () => viewModel.removePhotoForCookingStep(widget.index),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget imageView({
    required File? photo,
    required Function() onTap,
    required Function() remove,
  }) {
    if (photo == null) {
      return InkWell(
        onTap: onTap,
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

    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.r),
          child: Image.file(
            photo,
            height: 100.h,
            width: 250.w,
            fit: BoxFit.cover,
          ),
        ),
        IconButton(
          onPressed: remove,
          icon: const Icon(
            Icons.delete_outline_outlined,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
