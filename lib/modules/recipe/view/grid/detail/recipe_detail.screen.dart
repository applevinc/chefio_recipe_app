import 'dart:io';

import 'package:chefio_recipe_app/config/locator/locator.dart';
import 'package:chefio_recipe_app/core/models/failure.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/repositories/i_recipe_repository.dart';
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
import 'package:chefio_recipe_app/utils/navigator.dart';
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
      create: (_) => RecipeDetailController(
        recipe,
        recipeRepository: locator<IRecipeRepository>(),
      ),
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
                    height: 40.h,
                    width: 40.h,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    alignment: Alignment.center,
                    child: Icon(
                      Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back,
                      size: 24.r,
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
            builder: (context, scrollController) => _Sheet(scrollController: scrollController),
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

class _Sheet extends StatefulWidget {
  const _Sheet({required this.scrollController});

  final ScrollController scrollController;

  @override
  State<_Sheet> createState() => _SheetState();
}

class _SheetState extends State<_Sheet> {
  void likeRecipe(Recipe recipe) async {
    try {
      await context.read<RecipeDetailController>().likeRecipe(recipe);

      if (!mounted) {
        return;
      }
    } on Failure catch (e) {
      Messenger.error(context: context, message: e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RecipeDetailController>(
      builder: (_, controller, __) {
        final recipe = controller.recipe;

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
                  controller: widget.scrollController,
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
                            context.push(ProfileScreen(user: recipe.user));
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
                            GestureDetector(
                              onTap: () => likeRecipe(recipe),
                              child: Container(
                                height: 32.h,
                                width: 32.h,
                                decoration: BoxDecoration(
                                  color: recipe.isLiked ? AppColors.outline : AppColors.primary,
                                  shape: BoxShape.circle,
                                ),
                                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 7.w),
                                child: SvgPicture.asset(
                                  AppIcons.heart,
                                  height: 18.h,
                                  width: 18.h,
                                  fit: BoxFit.cover,
                                  color: recipe.isLiked ? AppColors.secondary : Colors.white,
                                ),
                              ),
                            ),
                            if (recipe.likeCount > 0) ...[
                              SizedBox(width: 8.w),
                              Text(
                                controller.likeCount,
                                style: AppText.bold700(context).copyWith(
                                  fontSize: 15.sp,
                                ),
                              ),
                            ],
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
      },
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
