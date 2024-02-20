import 'package:chefio_recipe_app/styles/colors.dart';
import 'package:chefio_recipe_app/styles/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTabbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeTabbar({
    super.key,
  });

  @override
  Size get preferredSize => Size.fromHeight(40.h);

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
          tabs: const [
            Tab(text: 'Left'),
            Tab(text: 'Right'),
          ],
        )
      ],
    );
  }
}
