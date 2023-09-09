import 'dart:io';

import 'package:chefio_recipe_app/modules/shared/dashboard/scan_food/results/scan_food_results_viewmodel.dart';
import 'package:chefio_recipe_app/shared/assets/assets.dart';
import 'package:chefio_recipe_app/shared/styles/styles.dart';
import 'package:chefio_recipe_app/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ScanFoodResultsScreen extends StatelessWidget {
  const ScanFoodResultsScreen({super.key, required this.image});

  final File image;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ScanFoodResultsViewModel(image: image),
      child: const _ScanFoodResultsScreen(),
    );
  }
}

class _ScanFoodResultsScreen extends StatelessWidget {
  const _ScanFoodResultsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            centerTitle: true,
            expandedHeight: 368.h,
            pinned: true,
            backgroundColor: Colors.white,
            elevation: 0.0,
            title: const Text('Food'),
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.light,
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(AppImages.capturedFood),
                  SizedBox(height: 32.h),
                  Text(
                    'Pancakes',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: AppColors.headlineText),
                  ),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: const [
                GreyDivider(),
                //RecipesGrid(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
