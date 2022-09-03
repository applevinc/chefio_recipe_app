import 'package:chefio_recipe_app/src/modules/auth/widgets/auth_view.dart';
import 'package:chefio_recipe_app/src/shared/assets/icons.dart';
import 'package:chefio_recipe_app/src/shared/styles/colors.dart';
import 'package:chefio_recipe_app/src/shared/utils/navigator.dart';
import 'package:chefio_recipe_app/src/shared/widgets/buttons/custom_button.dart';
import 'package:chefio_recipe_app/src/modules/auth/screens/sign_in.dart';
import 'package:chefio_recipe_app/src/modules/auth/widgets/password_strength_view.dart';
import 'package:chefio_recipe_app/src/shared/widgets/inputs/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return AuthView(
      title: 'Reset your password',
      subtitle: 'Please enter your new password',
      body: Column(
        children: [
          const CustomTextField(
            hintText: 'Password',
            prefixIcon: AppIcons.lock,
            obscureText: true,
          ),
          SizedBox(height: 24.h),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Your Password must contain:',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: AppColors.mainText, fontSize: 17.sp),
            ),
          ),
          SizedBox(height: 16.h),
          const PasswordStrengthView(),
          SizedBox(height: 24.h),
          CustomButton(
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
