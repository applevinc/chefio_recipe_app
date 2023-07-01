import 'package:chefio_recipe_app/src/config/locator/locator.dart';
import 'package:chefio_recipe_app/src/modules/auth/screens/forgot_password/forget_password_viewmodel.dart';
import 'package:chefio_recipe_app/src/modules/auth/screens/sign_in/sign_in_viewmodel.dart';
import 'package:chefio_recipe_app/src/modules/auth/screens/forgot_password/forgot_password_screen.dart';
import 'package:chefio_recipe_app/src/modules/auth/screens/sign_up/sign_up_screen.dart';
import 'package:chefio_recipe_app/src/modules/auth/screens/sign_up/sign_up_viewmodel.dart';
import 'package:chefio_recipe_app/src/modules/auth/services/interfaces/i_auth_service.dart';
import 'package:chefio_recipe_app/src/modules/auth/widgets/auth_view.dart';
import 'package:chefio_recipe_app/src/shared/assets/icons.dart';
import 'package:chefio_recipe_app/src/shared/models/failure.dart';
import 'package:chefio_recipe_app/src/shared/styles/colors.dart';
import 'package:chefio_recipe_app/src/shared/styles/text.dart';
import 'package:chefio_recipe_app/src/shared/utils/messenger.dart';
import 'package:chefio_recipe_app/src/shared/utils/navigator.dart';
import 'package:chefio_recipe_app/src/shared/widgets/buttons/custom_button.dart';
import 'package:chefio_recipe_app/src/shared/widgets/inputs/custom_textfield.dart';
import 'package:chefio_recipe_app/src/modules/dashboard/screens/dashboard_view.dart';
import 'package:chefio_recipe_app/src/shared/widgets/inputs/password_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
      final viewModel = context.read<SignInViewModel>();

      try {
        await viewModel.execute(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        if (mounted) {
          Messenger.success(context: context, message: 'Login successful');
          AppNavigator.to(context, const DashBoardView());
        }
      } on Failure catch (e) {
        Messenger.error(context: context, message: e.message);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SignInViewModel>();

    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: AuthView(
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
                    return 'Please enter your email or phone number';
                  }

                  return null;
                },
              ),
              SizedBox(height: 16.h),
              PasswordTextField(
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }

                  return null;
                },
              ),
              SizedBox(height: 24.h),
              GestureDetector(
                onTap: () {
                  AppNavigator.to(
                    context,
                    ChangeNotifierProvider(
                      create: (context) => ForgotPasswordViewModel(authService: locator<IAuthService>()),
                      child: const ForgotPasswordScreen(),
                    ),
                  );
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
                isBusy: viewModel.isBusy,
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
                  AppNavigator.to(
                    context,
                    ChangeNotifierProvider(
                      create: (context) => SignUpViewModel(authService: locator<IAuthService>()),
                      child: const SignUpScreen(),
                    ),
                  );
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
      ),
    );
  }
}
