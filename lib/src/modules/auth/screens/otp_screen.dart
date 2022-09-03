import 'package:chefio_recipe_app/src/modules/auth/widgets/auth_view.dart';
import 'package:chefio_recipe_app/src/shared/styles/colors.dart';
import 'package:chefio_recipe_app/src/shared/styles/text.dart';
import 'package:chefio_recipe_app/src/shared/widgets/buttons/custom_button.dart';
import 'package:chefio_recipe_app/src/modules/auth/screens/new_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  Widget build(BuildContext context) {
    return AuthView(
      title: 'Check your email',
      subtitle: 'We.ve sent the code to your email',
      body: Column(
        children: [
          const _OTPField(),
          SizedBox(height: 48.h),
          const _CodeExpiration(),
          SizedBox(height: 24.h),
          CustomButton(
            label: 'Verify',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const NewPasswordScreen(),
                ),
              );
            },
          ),
          SizedBox(height: 16.h),
          CustomButton(
            label: 'Send again',
            labelColor: AppColors.secondaryText,
            showBorder: true,
            bgColor: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class _CodeExpiration extends StatelessWidget {
  const _CodeExpiration({
    Key? key,
  }) : super(key: key);

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
              text: "03:12",
              style: style.copyWith(color: AppColors.secondary),
            ),
          ],
        ),
      ),
    );
  }
}

class _OTPField extends StatelessWidget {
  const _OTPField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
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
