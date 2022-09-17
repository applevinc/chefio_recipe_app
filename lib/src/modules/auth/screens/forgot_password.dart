import 'package:chefio_recipe_app/src/modules/auth/widgets/auth_view.dart';
import 'package:chefio_recipe_app/src/shared/assets/icons.dart';
import 'package:chefio_recipe_app/src/shared/utils/navigator.dart';
import 'package:chefio_recipe_app/src/shared/widgets/buttons/custom_button.dart';
import 'package:chefio_recipe_app/src/shared/widgets/inputs/custom_textfield.dart';
import 'package:chefio_recipe_app/src/modules/auth/screens/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return AuthView(
      title: 'Password recovery',
      subtitle: 'Enter your email to recover your password',
      body: Column(
        children: [
          CustomTextField(
            hintText: 'Email or phone number',
            prefixIcon: const TextFieldIcon(icon: AppIcons.email),
            controller: emailController,
          ),
          SizedBox(height: 24.h),
          AppButton(
            label: 'Submit',
            onPressed: () {
              AppNavigator.to(context, const OTPScreen());
            },
          ),
        ],
      ),
    );
  }
}
