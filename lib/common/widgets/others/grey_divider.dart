import 'package:chefio_recipe_app/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GreyDivider extends StatelessWidget {
  const GreyDivider({
    Key? key,
    this.height,
  }) : super(key: key);

  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: height ?? 8.h,
      color: AppColors.form,
    );
  }
}
