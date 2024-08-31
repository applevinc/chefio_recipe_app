import 'package:chefio_recipe_app/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPField extends StatelessWidget {
  const OTPField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      controller: controller,
      appContext: context,
      length: 4,
      obscureText: false,
      animationType: AnimationType.fade,
      cursorColor: AppColors.primary,
      pinTheme: PinTheme(
        fieldHeight: 72.h,
        fieldWidth: 72.w,
        activeFillColor: Colors.white,
        inactiveColor: AppColors.outline,
        inactiveFillColor: Colors.white,
        selectedColor: AppColors.primary,
        selectedFillColor: Colors.white,
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(20.r),
      ),
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      onCompleted: (v) {
        //print("Completed");
      },
      onChanged: (value) {},
      beforeTextPaste: (text) {
        //print("Allowing to paste $text");
        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
        //but you can show anything you want here, like your pop up saying wrong paste format or etc
        return true;
      },
    );
  }
}
