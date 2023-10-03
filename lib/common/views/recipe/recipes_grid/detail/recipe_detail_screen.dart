import 'package:chefio_recipe_app/common/views/recipe/recipes_grid/detail/components/recipe_detail_ingredients_view.dart';
import 'package:chefio_recipe_app/common/views/recipe/recipes_grid/detail/components/recipe_detail_steps_view.dart';
import 'package:chefio_recipe_app/common/views/recipe/recipes_grid/detail/recipe_detail_viewmodel.dart';
import 'package:chefio_recipe_app/modules/profile/screens/profile_screen.dart';
import 'package:chefio_recipe_app/common/models/recipe.dart';
import 'package:chefio_recipe_app/assets/assets.dart';
import 'package:chefio_recipe_app/styles/colors.dart';
import 'package:chefio_recipe_app/styles/text.dart';

import 'package:chefio_recipe_app/common/widgets/others/custom_cached_network_image.dart';
import 'package:chefio_recipe_app/common/widgets/widgets.dart';
import 'package:chefio_recipe_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class RecipeDetailScreen extends StatelessWidget {
  const RecipeDetailScreen(this.recipe, {super.key});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RecipeDetailViewModel(recipe),
      child: const _RecipeDetailScreen(),
    );
  }
}

class _RecipeDetailScreen extends StatelessWidget {
  const _RecipeDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewmodel = context.read<RecipeDetailViewModel>();
    final recipe = viewmodel.recipe;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Stack(
            children: [
              Hero(
                tag: recipe.id,
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.3),
                    BlendMode.darken,
                  ),
                  child: CustomCacheNetworkImage(
                    image: recipe.coverPhotoUrl,
                    height: 375.h,
                    width: 375.h,
                  ),
                ),
              ),
              Positioned(
                top: 60.h,
                left: 24.w,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 56.h,
                    width: 56.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.20000000298023224),
                    ),
                    child: Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                      size: 24.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.6,
            minChildSize: 0.6,
            maxChildSize: 0.93,
            expand: false,
            builder: (context, scrollController) => _Sheet(
              scrollController: scrollController,
            ),
          ).animate(delay: Duration.zero).slide(
                begin: const Offset(0, 1),
                end: const Offset(0, 0),
                duration: const Duration(milliseconds: 600),
              ),
        ],
      ),
    );
  }
}

class _Sheet extends StatelessWidget {
  const _Sheet({required this.scrollController});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    final viewmodel = context.read<RecipeDetailViewModel>();
    final Recipe recipe = viewmodel.recipe;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32.r),
          topRight: Radius.circular(32.r),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: Colors.white.withOpacity(.200),
            padding: EdgeInsets.only(top: 16.h, bottom: 23.h),
            child: Container(
              width: 40.w,
              height: 5.h,
              decoration: BoxDecoration(
                color: const Color(0xFFD0DAE9),
                borderRadius: BorderRadius.circular(100.r),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              controller: scrollController,
              padding: EdgeInsets.zero,
              children: [
                Text(
                  recipe.title.toTitleCase,
                  style: AppText.bold700(context).copyWith(
                    color: const Color(0xFF3D5480),
                    fontSize: 17.sp,
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Text(
                      'Food',
                      style: AppText.bold500(context).copyWith(
                        color: const Color(0xFF9FA5C0),
                        fontSize: 15.sp,
                      ),
                    ),
                    SizedBox(width: 7.w),
                    const Dot(),
                    SizedBox(width: 7.w),
                    Text(
                      '60 mins',
                      style: AppText.bold500(context).copyWith(
                        color: const Color(0xFF9FA5C0),
                        fontSize: 15.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        AppNavigator.to(context, ProfileScreen(user: recipe.user));
                      },
                      child: Row(
                        children: [
                          CustomCacheNetworkImage(
                            image: recipe.user.photoUrl,
                            height: 32.h,
                            width: 32.h,
                            shape: BoxShape.circle,
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            recipe.user.fullName.toTitleCase,
                            style: AppText.bold700(context).copyWith(
                              fontSize: 15.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Container(
                          height: 32.h,
                          width: 32.h,
                          decoration: const BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                          ),
                          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 7.w),
                          child: SvgPicture.asset(
                            AppIcons.heart,
                            height: 18.h,
                            width: 18.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          recipe.likeCount.toString(),
                          style: AppText.bold700(context).copyWith(
                            fontSize: 15.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                GreyDivider(height: 1.h),
                SizedBox(height: 16.h),
                Text(
                  'Description',
                  style: AppText.bold700(context).copyWith(
                    color: const Color(0xFF3D5480),
                    fontSize: 17.sp,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  recipe.description,
                  style: AppText.bold500(context).copyWith(
                    color: AppColors.secondaryText,
                    fontSize: 15.sp,
                  ),
                ),
                SizedBox(height: 16.h),
                GreyDivider(height: 1.h),
                const RecipeDetailIngredientsView(),
                GreyDivider(height: 1.h),
                const RecipeDetailStepsView(),
                SizedBox(height: 40.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Dot extends StatelessWidget {
  const Dot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 5.h,
      height: 5.h,
      decoration: const ShapeDecoration(
        color: AppColors.secondaryText,
        shape: OvalBorder(),
      ),
    );
  }
}
