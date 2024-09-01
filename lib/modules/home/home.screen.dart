import 'package:chefio_recipe_app/core/widgets/others/sliver_appbar_delegate.dart';
import 'package:chefio_recipe_app/modules/recipe/view/grid/recipes_grid.component.dart';
import 'package:chefio_recipe_app/modules/home/components/home_categories_component.dart';
import 'package:chefio_recipe_app/modules/home/home.controller.dart';
import 'package:chefio_recipe_app/modules/recipe/view/search/search_recipe.screen.dart';

import 'package:chefio_recipe_app/assets/assets.dart';
import 'package:chefio_recipe_app/styles/styles.dart';

import 'package:chefio_recipe_app/core/widgets/inputs/custom_textfield.dart';
import 'package:chefio_recipe_app/core/widgets/others/error_view.dart';
import 'package:chefio_recipe_app/utils/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      init();
    });
  }

  void init() async {
    final controller = context.read<HomeController>();

    if (controller.recipes.isEmpty) {
      controller.init();
    } else {
      controller.refreshRecipes();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 16.h,
                    left: AppPadding.horizontal,
                    right: AppPadding.horizontal,
                  ),
                  child: Hero(
                    tag: 'search',
                    child: Material(
                      type: MaterialType.transparency,
                      child: CustomTextField(
                        prefixIcon: const TextFieldIcon(icon: AppIcons.search),
                        hintText: 'Search',
                        readOnly: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.r),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: AppColors.form,
                        onTap: () {
                          context.push(const SearchRecipeScreen());
                        },
                      ),
                    ),
                  ),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: SliverAppBarDelegate(
                  maxHeight: 144.5.h,
                  minHeight: 144.5.h,
                  child: const HomeCategoriesComponent(),
                ),
              ),
            ];
          },
          body: Consumer<HomeController>(
            builder: (context, controller, _) {
              if (controller.hasError) {
                return ErrorView(
                  error: controller.modelError,
                  refetch: init,
                );
              }

              return RecipesGridComponent(
                isExpanded: false,
                recipes: controller.recipes,
                isBusy: controller.busy(HomeLoadingState.recipes),
                onRefresh: controller.refreshRecipes,
              );
            },
          ),
        ),
      ),
    );
  }
}
