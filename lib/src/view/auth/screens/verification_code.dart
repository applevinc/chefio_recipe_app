import 'package:chefio_recipe_app/src/core/theme/colors.dart';
import 'package:chefio_recipe_app/src/core/widgets/custom_button.dart';
import 'package:chefio_recipe_app/src/view/auth/screens/new_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeVerificationScreen extends StatelessWidget {
  const PinCodeVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Check your email',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    SizedBox(height: 8.0.h),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'We.ve sent the code to your email',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    SizedBox(height: 32.h),
                    const _InputFields(),
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
              ),
            ),
          ],
        ),
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
    return Align(
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "code expires in:",
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: AppColors.mainText),
            ),
            const TextSpan(text: " "),
            TextSpan(
              text: "03:12",
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: AppColors.secondary),
            ),
          ],
        ),
      ),
    );
  }
}

class _InputFields extends StatelessWidget {
  const _InputFields({
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
