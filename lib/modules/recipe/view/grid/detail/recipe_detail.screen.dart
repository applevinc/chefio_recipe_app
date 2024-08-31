import 'package:chefio_recipe_app/modules/recipe/view/grid/detail/components/recipe_detail_ingredients.component.dart';
import 'package:chefio_recipe_app/modules/recipe/view/grid/detail/components/recipe_detail_steps.component.dart';
import 'package:chefio_recipe_app/modules/recipe/view/grid/detail/recipe_detail.controller.dart';
import 'package:chefio_recipe_app/modules/profile/screens/profile.screen.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/entities/recipe.dart';
import 'package:chefio_recipe_app/assets/assets.dart';
import 'package:chefio_recipe_app/styles/colors.dart';
import 'package:chefio_recipe_app/styles/text.dart';

import 'package:chefio_recipe_app/core/widgets/image/custom_cached_network_image.dart';
import 'package:chefio_recipe_app/core/widgets/widgets.dart';
import 'package:chefio_recipe_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class RecipeDetailScreen extends StatelessWidget {
  const RecipeDetailScreen(this.recipe, {super.key});

  static String route = '/recipe_detail';

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RecipeDetailController(recipe),
      child: const _RecipeDetailScreen(),
    );
  }
}

class _RecipeDetailScreen extends StatelessWidget {
  const _RecipeDetailScreen();

  @override
  Widget build(BuildContext context) {
    final controller = context.read<RecipeDetailController>();
    final recipe = controller.recipe;

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
                    imageUrl: recipe.coverPhotoUrl,
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
                    context.pop();
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
            builder: (context, scrollController) =>
                _Sheet(scrollController: scrollController),
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
    final controller = context.read<RecipeDetailController>();
    final Recipe recipe = controller.recipe;

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
                Text(
                  controller.subtitle,
                  style: AppText.bold500(context).copyWith(
                    color: const Color(0xFF9FA5C0),
                  ),
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.push(ProfileScreen.route, extra: recipe.user);
                      },
                      child: Row(
                        children: [
                          CustomCacheNetworkImage(
                            imageUrl: recipe.user.photoUrl,
                            height: 32.h,
                            width: 32.h,
                            shape: BoxShape.circle,
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            recipe.user.fullName.toTitleCase,
                            style: AppText.bold700(context).copyWith(
                              fontSize: 16.sp,
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
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  recipe.description,
                  style: AppText.bold500(context).copyWith(
                    color: AppColors.secondaryText,
                  ),
                ),
                SizedBox(height: 16.h),
                GreyDivider(height: 1.h),
                const RecipeDetailIngredientsComponent(),
                GreyDivider(height: 1.h),
                const RecipeDetailCookingStepsComponent(),
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
