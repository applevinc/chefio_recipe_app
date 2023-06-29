import 'package:chefio_recipe_app/src/modules/auth/widgets/auth_view.dart';
import 'package:chefio_recipe_app/src/shared/styles/colors.dart';
import 'package:chefio_recipe_app/src/shared/utils/navigator.dart';
import 'package:chefio_recipe_app/src/shared/widgets/buttons/custom_button.dart';
import 'package:chefio_recipe_app/src/modules/auth/screens/sign_in/sign_in_screen.dart';
import 'package:chefio_recipe_app/src/modules/auth/widgets/password_strength_view.dart';
import 'package:chefio_recipe_app/src/shared/widgets/inputs/password_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  late final TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return AuthView(
      title: 'Reset your password',
      subtitle: 'Please enter your new password',
      body: Column(
        children: [
          PasswordTextField(controller: passwordController),
          SizedBox(height: 24.h),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Your Password must contain:',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: AppColors.mainText, fontSize: 17.sp),
            ),
          ),
          SizedBox(height: 16.h),
          const PasswordStrengthView(),
          SizedBox(height: 24.h),
          AppButton(
            label: 'Done',
            onPressed: () {
              AppNavigator.pushAndRemoveUntil(context, const SignInScreen());
            },
          ),
        ],
      ),
    );
  }
}
