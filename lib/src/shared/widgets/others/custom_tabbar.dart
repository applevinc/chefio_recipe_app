import 'package:chefio_recipe_app/src/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTabBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomTabBar({super.key, required this.tabs});

  final List<Tab> tabs;

  @override
  Size get preferredSize => Size.fromHeight(40.h);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 14.h),
      child: Stack(
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
            labelColor: const Color(0xff3e5481),
            labelStyle: AppText.bold600(context).copyWith(
              fontSize: 15.sp,
            ),
            unselectedLabelColor: AppColors.secondaryText,
            unselectedLabelStyle: AppText.bold600(context).copyWith(
              fontSize: 15.sp,
            ),
            indicatorColor: AppColors.primary,
            indicatorWeight: 3.h,
            tabs: tabs,
          )
        ],
      ),
    );
  }
}
