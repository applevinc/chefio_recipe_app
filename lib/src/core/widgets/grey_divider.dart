import 'package:chefio_recipe_app/src/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GreyDivider extends StatelessWidget {
  const GreyDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 8.h,
      color: AppColors.form,
    );
  }
}
