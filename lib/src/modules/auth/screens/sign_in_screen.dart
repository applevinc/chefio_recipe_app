import 'package:chefio_recipe_app/src/modules/auth/auth.dart';
import 'package:chefio_recipe_app/src/modules/auth/controllers/auth_controller.dart';
import 'package:chefio_recipe_app/src/shared/assets/icons.dart';
import 'package:chefio_recipe_app/src/shared/helper_functions/helper_functions.dart';
import 'package:chefio_recipe_app/src/shared/models/failure.dart';
import 'package:chefio_recipe_app/src/shared/styles/colors.dart';
import 'package:chefio_recipe_app/src/shared/styles/text.dart';
import 'package:chefio_recipe_app/src/shared/utils/utils.dart';
import 'package:chefio_recipe_app/src/shared/widgets/buttons/custom_button.dart';
import 'package:chefio_recipe_app/src/shared/widgets/inputs/custom_textfield.dart';
import 'package:chefio_recipe_app/src/modules/dashboard/screens/dashboard_view.dart';
import 'package:chefio_recipe_app/src/shared/widgets/inputs/password_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void signIn() async {
    if (_formKey.currentState!.validate()) {
      final controller = ref.read(authProvider.notifier);

      try {
        await controller.signIn(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
        NotificationMessage.showSucess(context, message: 'Login successful');
        AppNavigator.pushAndRemoveUntil(context, const DashBoardView());
      } on Failure {
        NotificationMessage.showError(context, message: 'Failed to create an account');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);

    return AuthView(
      title: 'Welcome Back!',
      subtitle: 'Please enter your account here',
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            CustomTextField(
              hintText: 'Email or phone number',
              prefixIcon: const TextFieldIcon(icon: AppIcons.email),
              controller: emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                if (Validator.isNotValidEmail(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            SizedBox(height: 16.h),
            PasswordTextField(controller: passwordController),
            SizedBox(height: 24.h),
            GestureDetector(
              onTap: () {
                AppNavigator.to(context, const ForgotPasswordScreen());
              },
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Forgot password?',
                  style: AppText.bold500(context).copyWith(
                    fontSize: 15.sp,
                  ),
                ),
              ),
            ),
            SizedBox(height: 72.h),
            AppButton(
              label: 'Login',
              isLoading: authState == AuthState.loading,
              onPressed: signIn,
            ),
            SizedBox(height: 24.h),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Or continue with',
                style: AppText.bold500(context).copyWith(
                  fontSize: 15.sp,
                  color: AppColors.secondaryText,
                ),
              ),
            ),
            SizedBox(height: 24.h),
            AppButtonWithIcon(
              label: 'Google',
              onPressed: () {},
            ),
            SizedBox(height: 24.h),
            GestureDetector(
              onTap: () {
                AppNavigator.to(context, const SignUpScreen());
              },
              child: Align(
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(
                    text: 'Don’t have any account? ',
                    style: AppText.bold500(context).copyWith(
                      fontSize: 16.sp,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Sign Up',
                        style: AppText.bold700(context).copyWith(
                          fontSize: 16.sp,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 41.h),
          ],
        ),
      ),
    );
  }
}
