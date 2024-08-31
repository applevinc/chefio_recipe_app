import 'package:chefio_recipe_app/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key, required this.tabs});

  final List<Tab> tabs;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.outline,
                  width: 1.h,
                ),
              ),
            ),
          ),
        ),
        TabBar(
          labelColor: AppColors.mainText,
          labelStyle: AppText.bold600(context).copyWith(
            fontSize: 15.sp,
          ),
          unselectedLabelColor: AppColors.secondaryText,
          unselectedLabelStyle: AppText.bold600(context).copyWith(
            fontSize: 15.sp,
          ),
          indicatorColor: AppColors.primary,
          indicatorWeight: 3.h,
          indicatorSize: TabBarIndicatorSize.tab,
          tabs: tabs,
        ),
      ],
    );
  }
}
