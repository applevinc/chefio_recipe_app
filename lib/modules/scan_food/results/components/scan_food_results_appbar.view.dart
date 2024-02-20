import 'package:chefio_recipe_app/modules/scan_food/results/scan_food_results_viewmodel.dart';
import 'package:chefio_recipe_app/styles/styles.dart';
import 'package:chefio_recipe_app/common/widgets/others/custom_cached_network_image.dart';
import 'package:chefio_recipe_app/utils/constants.dart';
import 'package:chefio_recipe_app/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ScanFoodResultsAppBarView extends StatelessWidget {
  const ScanFoodResultsAppBarView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ScanFoodResultsViewModel>();

    return SliverAppBar(
      expandedHeight: 350.h,
      leading: const BackButton(),
      centerTitle: true,
      pinned: true,
      stretch: true,
      title: Text(
        viewModel.type,
        style: AppText.bold700(context).copyWith(
          fontSize: 22.sp,
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        background: Padding(
          padding: EdgeInsets.only(top: 100.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (viewModel.image == null)
                Align(
                  alignment: Alignment.center,
                  child: CustomCacheNetworkImage(
                    image: getOneMealPhoto(),
                    width: 200.h,
                    height: 200.h,
                    shape: BoxShape.circle,
                  ),
                ),
              if (viewModel.image != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(100.r),
                  child: Image.file(
                    viewModel.image!,
                    width: 200.h,
                    height: 200.h,
                    fit: BoxFit.cover,
                  ),
                ),
              SizedBox(height: 32.h),
              Text(
                'Pancakes',
                style: AppText.bold700(context).copyWith(
                  color: AppColors.headlineText,
                  fontSize: 22.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
