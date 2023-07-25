import 'package:chefio_recipe_app/modules/home/screens/components/home_categories_component.dart';
import 'package:chefio_recipe_app/modules/home/screens/home_viewmodel.dart';
import 'package:chefio_recipe_app/modules/home/screens/search/search_screen.dart';
import 'package:chefio_recipe_app/modules/home/screens/search/search_viewmodel.dart';
import 'package:chefio_recipe_app/modules/shared/recipe/views/recipes_grid.dart';
import 'package:chefio_recipe_app/shared/assets/assets.dart';
import 'package:chefio_recipe_app/shared/styles/styles.dart';
import 'package:chefio_recipe_app/shared/utils/navigator.dart';
import 'package:chefio_recipe_app/shared/widgets/inputs/custom_textfield.dart';
import 'package:chefio_recipe_app/shared/widgets/others/error_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      init();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void init() async {
    context.read<HomeViewModel>().init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 16.h,
                left: AppPadding.horizontal,
                right: AppPadding.horizontal,
              ),
              child: CustomTextField(
                controller: searchController,
                prefixIcon: const TextFieldIcon(icon: AppIcons.search),
                hintText: 'Search',
                readOnly: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32.r),
                  borderSide: BorderSide.none,
                ),
                fillColor: AppColors.form,
                onTap: () {
                  //  showSearch(
                  //    context: context,
                  //    delegate: SearchScreen(),
                  //  );
                  AppNavigator.to(
                    context,
                    ChangeNotifierProvider(
                      create: (_) => SearchViewModel(),
                      child: const SearchScreen(),
                    ),
                  );
                },
              ),
            ),
            const HomeCategoriesComponent(),
            Container(
              height: 8.h,
              color: const Color(0xFFF4F5F7),
            ),
            Consumer<HomeViewModel>(
              builder: (context, viewmodel, _) {
                if (viewmodel.hasError) {
                  return ErrorView(error: viewmodel.modelError, refetch: init);
                }

                return RecipesGrid(
                  recipes: viewmodel.recipes,
                  isBusy: viewmodel.anyObjectsBusy,
                  onRefresh: viewmodel.refreshRecipes,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
