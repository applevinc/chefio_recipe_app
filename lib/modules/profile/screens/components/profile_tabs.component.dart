import 'package:chefio_recipe_app/common/widgets/others/custom_tabbar.dart';
import 'package:chefio_recipe_app/common/widgets/others/sliver_appbar_delegate.dart';
import 'package:chefio_recipe_app/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileTabsComponent extends StatelessWidget {
  const ProfileTabsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final height = 40.h;

    return SliverPadding(
      padding: EdgeInsets.only(top: 14.h),
      sliver: SliverPersistentHeader(
        pinned: true,
        delegate: SliverAppBarDelegate(
          maxHeight: height,
          minHeight: height,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(bottom: BorderSide(color: AppColors.outline)),
            ),
            child: const CustomTabBar(
              tabs: [
                Tab(text: 'Recipes'),
                Tab(text: 'Liked'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
