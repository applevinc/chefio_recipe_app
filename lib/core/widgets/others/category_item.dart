import 'package:chefio_recipe_app/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItemView extends StatelessWidget {
  const CategoryItemView({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 24.w),
        decoration: BoxDecoration(
          color: selected ? AppColors.primary : AppColors.form,
          borderRadius: BorderRadius.circular(32.r),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: AppText.bold700(context).copyWith(
            color: selected ? Colors.white : AppColors.secondaryText,
            fontSize: 15.sp,
            letterSpacing: 0.10,
          ),
        ),
      ),
    );
  }
}
