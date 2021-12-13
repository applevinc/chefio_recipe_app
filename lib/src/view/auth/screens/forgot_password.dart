import 'package:chefio_recipe_app/src/core/assets/icons.dart';
import 'package:chefio_recipe_app/src/core/widgets/custom_button.dart';
import 'package:chefio_recipe_app/src/view/auth/widgets/textfield.dart';
import 'package:chefio_recipe_app/src/view/auth/screens/verification_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

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
                        'Password recovery',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    SizedBox(height: 8.0.h),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Enter your email to recover your password',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    SizedBox(height: 32.h),
                    const AuthTextField(
                      hintText: 'Email or phone number',
                      prefixIcon: AppIcons.email,
                    ),
                    SizedBox(height: 24.h),
                    CustomButton(
                      label: 'Submit',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const PinCodeVerificationScreen(),
                          ),
                        );
                      },
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
