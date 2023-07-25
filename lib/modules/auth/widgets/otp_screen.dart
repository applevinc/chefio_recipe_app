import 'package:chefio_recipe_app/modules/auth/widgets/auth_view.dart';
import 'package:chefio_recipe_app/shared/styles/colors.dart';
import 'package:chefio_recipe_app/shared/styles/text.dart';
import 'package:chefio_recipe_app/shared/widgets/buttons/custom_button.dart';
import 'package:chefio_recipe_app/shared/widgets/inputs/otp_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({
    Key? key,
    required this.controller,
    required this.time,
    required this.isVerifying,
    required this.verify,
    required this.isResending,
    required this.resend,
  }) : super(key: key);

  final TextEditingController controller;
  final String time;
  final bool isVerifying;
  final Function() verify;
  final bool isResending;
  final Function() resend;

  @override
  Widget build(BuildContext context) {
    return AuthView(
      title: 'Check your email',
      subtitle: 'We.ve sent the code to your email',
      body: Column(
        children: [
          OTPField(controller: controller),
          SizedBox(height: 48.h),
          _CodeExpiration(time: time),
          SizedBox(height: 24.h),
          AppButton(
            label: 'Verify',
            isBusy: isVerifying,
            disabled: isResending,
            onPressed: verify,
          ),
          SizedBox(height: 16.h),
          AppButton(
            label: 'Send again',
            labelColor: isVerifying ? Colors.white : AppColors.secondaryText,
            showBorder: true,
            backgroundColor: Colors.transparent,
            loadingIndicatorColor: AppColors.primary,
            disabled: isVerifying,
            isBusy: isResending,
            onPressed: resend,
          ),
        ],
      ),
    );
  }
}

class _CodeExpiration extends StatelessWidget {
  const _CodeExpiration({
    Key? key,
    required this.time,
  }) : super(key: key);

  final String time;

  @override
  Widget build(BuildContext context) {
    final style = AppText.bold500(context).copyWith(
      fontSize: 15.sp,
    );

    return Align(
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "code expires in:",
              style: style,
            ),
            const TextSpan(text: " "),
            TextSpan(
              text: time,
              style: style.copyWith(color: AppColors.secondary),
            ),
          ],
        ),
      ),
    );
  }
}
