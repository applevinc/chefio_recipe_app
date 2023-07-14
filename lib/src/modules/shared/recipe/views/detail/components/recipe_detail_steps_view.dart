import 'package:chefio_recipe_app/src/modules/shared/recipe/models/recipe.dart';
import 'package:chefio_recipe_app/src/modules/shared/recipe/views/detail/recipe_detail_viewmodel.dart';
import 'package:chefio_recipe_app/src/shared/styles/styles.dart';
import 'package:chefio_recipe_app/src/shared/widgets/others/custom_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class RecipeDetailStepsView extends StatelessWidget {
  const RecipeDetailStepsView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CookingStep> steps = context.read<RecipeDetailViewModel>().recipe.steps;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Steps',
            style: AppText.bold700(context).copyWith(
              color: const Color(0xFF3D5480),
              fontSize: 17.sp,
            ),
          ),
          SizedBox(height: 18.h),
          ListView.separated(
            shrinkWrap: true,
            itemCount: steps.length,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => _CookingStepItem(steps[index]),
            separatorBuilder: (context, index) => SizedBox(height: 16.h),
          ),
        ],
      ),
    );
  }
}

class _CookingStepItem extends StatelessWidget {
  const _CookingStepItem(this.cookingStep);

  final CookingStep cookingStep;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 4.5.h, horizontal: 9.w),
          decoration: const BoxDecoration(
            color: AppColors.mainText,
            shape: BoxShape.circle,
          ),
          child: Text(
            cookingStep.step.toString(),
            style: AppText.bold500(context).copyWith(
              color: Colors.white,
              fontSize: 15.sp,
            ),
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cookingStep.description,
                style: AppText.bold500(context).copyWith(
                  color: const Color(0xFF3D5480),
                  fontSize: 15.sp,
                ),
              ),
              SizedBox(height: 16.h),
              CustomCacheNetworkImage(
                image: cookingStep.photoUrl,
                width: 271.w,
                height: 155.h,
                borderRadius: BorderRadius.circular(12.r),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
