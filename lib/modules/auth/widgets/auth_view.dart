import 'package:chefio_recipe_app/styles/colors.dart';
import 'package:chefio_recipe_app/styles/text.dart';
import 'package:chefio_recipe_app/core/widgets/inputs/close_keyboard_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthView extends StatelessWidget {
  const AuthView({
    super.key,
    required this.title,
    required this.subtitle,
    required this.body,
  });

  final String title;
  final String subtitle;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return CloseKeyboardWrapper(
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      title,
                      style: AppText.bold700(context).copyWith(
                        fontSize: 22.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0.h),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      subtitle,
                      textAlign: TextAlign.center,
                      style: AppText.bold500(context).copyWith(
                        fontSize: 15.sp,
                        color: AppColors.secondaryText,
                      ),
                    ),
                  ),
                  SizedBox(height: 32.h),
                  body,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
