import 'dart:ui';
import 'package:chefio_recipe_app/config/locator/locator.dart';
import 'package:chefio_recipe_app/core/models/failure.dart';
import 'package:chefio_recipe_app/modules/profile/screens/profile.screen.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/entities/recipe.dart';
import 'package:chefio_recipe_app/modules/recipe/domain/repositories/i_recipe_repository.dart';
import 'package:chefio_recipe_app/modules/recipe/view/grid/detail/recipe_detail.screen.dart';
import 'package:chefio_recipe_app/modules/recipe/view/grid/item/recipe_grid_item.controller.dart';
import 'package:chefio_recipe_app/styles/styles.dart';

import 'package:chefio_recipe_app/core/widgets/image/custom_cached_network_image.dart';
import 'package:chefio_recipe_app/utils/navigator.dart';
import 'package:chefio_recipe_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class RecipeGridItemComponent extends StatelessWidget {
  const RecipeGridItemComponent(this.recipe, {super.key});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RecipeGridItemController(
        recipe,
        recipeRepository: locator<IRecipeRepository>(),
      ),
      child: const _RecipeGridItem(),
    );
  }
}

class _RecipeGridItem extends StatefulWidget {
  const _RecipeGridItem();

  @override
  State<_RecipeGridItem> createState() => _RecipeGridItemState();
}

class _RecipeGridItemState extends State<_RecipeGridItem> {
  void likeRecipe(Recipe recipe) async {
    try {
      await context.read<RecipeGridItemController>().likeRecipe(recipe);

      if (!mounted) {
        return;
      }
    } on Failure catch (e) {
      Messenger.error(context: context, message: e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RecipeGridItemController>(
      builder: (_, controller, __) {
        final recipe = controller.recipe;
        final user = recipe.user;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    context.push(ProfileScreen(user: user));
                  },
                  child: CustomCacheNetworkImage(
                    imageUrl: user.photoUrl,
                    height: 30.h,
                    width: 30.h,
                    borderRadius: BorderRadius.circular(11.r),
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: Text(
                    user.fullName.toTitleCase,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppText.bold500(context).copyWith(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Stack(
              children: [
                GestureDetector(
                  onTap: () async {
                    await context.push(RecipeDetailScreen(recipe));
                    setState(() {});
                  },
                  child: Hero(
                    tag: recipe.id,
                    child: CustomCacheNetworkImage(
                      imageUrl: recipe.coverPhotoUrl,
                      height: 151.h,
                      width: 151.h,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                  ),
                ),
                _FavouriteButton(
                  recipe: recipe,
                  onLike: () => likeRecipe(recipe),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                recipe.title.toTitleCase,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppText.bold700(context).copyWith(
                  color: AppColors.headlineText,
                  fontSize: 14.sp,
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              controller.subtitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppText.bold500(context).copyWith(
                fontSize: 12.sp,
                color: AppColors.secondaryText,
              ),
            ),
          ],
        );
      },
    );
  }
}

class _FavouriteButton extends StatelessWidget {
  const _FavouriteButton({required this.recipe, required this.onLike});

  final Recipe recipe;
  final Function() onLike;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 16.h,
      right: 16.w,
      child: GestureDetector(
        onTap: onLike,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.r),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
            child: Container(
              width: 32.w,
              height: 32.h,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(
                recipe.isLiked ? Icons.favorite : Icons.favorite_border_rounded,
                size: 20.sp,
                color: recipe.isLiked ? AppColors.secondary : Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
