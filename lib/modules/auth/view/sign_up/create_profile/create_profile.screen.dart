import 'package:chefio_recipe_app/modules/dashboard/dashboard.component.dart';
import 'package:chefio_recipe_app/core/widgets/image/edit_image.view.dart';
import 'package:chefio_recipe_app/core/widgets/inputs/close_keyboard_wrapper.dart';
import 'package:chefio_recipe_app/core/widgets/others/loading_overlay_view.dart';
import 'package:chefio_recipe_app/config/locator/locator.dart';
import 'package:chefio_recipe_app/modules/auth/domain/repositories/i_sign_up.repository.dart';
import 'package:chefio_recipe_app/modules/auth/view/sign_up/create_profile/create_profile.controller.dart';
import 'package:chefio_recipe_app/core/models/failure.dart';
import 'package:chefio_recipe_app/styles/colors.dart';
import 'package:chefio_recipe_app/styles/text.dart';

import 'package:chefio_recipe_app/core/widgets/buttons/custom_button.dart';
import 'package:chefio_recipe_app/core/widgets/inputs/custom_textfield.dart';
import 'package:chefio_recipe_app/utils/navigator.dart';
import 'package:chefio_recipe_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CreateProfileScreen extends StatelessWidget {
  const CreateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CreateProfileController(
        signUpRepository: locator<ISignUpRepository>(),
      ),
      child: const _CreateProfileScreen(),
    );
  }
}

class _CreateProfileScreen extends StatefulWidget {
  const _CreateProfileScreen();

  @override
  State<_CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<_CreateProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  void submit() async {
    if (_formKey.currentState!.validate()) {
      try {
        final controller = context.read<CreateProfileController>();
        await controller.execute();

        if (!mounted) {
          return;
        }

        Messenger.success(context: context, message: 'Account created successful');
        context.go(const DashBoardComponent());
      } on Failure catch (e) {
        Messenger.error(context: context, message: e.message);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<CreateProfileController>();

    return LoadingOverlayView(
      showOverLay: controller.isBusy,
      child: CloseKeyboardWrapper(
        child: Scaffold(
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Column(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Welcome!',
                              style: AppText.bold700(context).copyWith(
                                fontSize: 22.sp,
                              ),
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Please enter your account here',
                              style: AppText.bold500(context).copyWith(
                                fontSize: 15.sp,
                                color: AppColors.secondaryText,
                              ),
                            ),
                          ),
                          SizedBox(height: 32.h),
                          EditImageComponent(
                            imageFile: controller.image,
                            onTap: controller.pickImage,
                          ),
                          SizedBox(height: 24.h),
                          CustomTextField(
                            hintText: 'First Name',
                            controller: controller.firstNameController,
                            textCapitalization: TextCapitalization.words,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
                            ],
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your first name';
                              }

                              return null;
                            },
                          ),
                          SizedBox(height: 16.h),
                          CustomTextField(
                            hintText: 'Last Name',
                            controller: controller.lastNameController,
                            textCapitalization: TextCapitalization.words,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
                            ],
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your last name';
                              }

                              return null;
                            },
                          ),
                          SizedBox(height: 16.h),
                          CustomTextField(
                            hintText: 'Email',
                            readOnly: true,
                            controller: controller.emailController,
                            validator: Validator.validateEmail,
                          ),
                        ],
                      ),
                      SizedBox(height: 24.h),
                      AppButton(
                        label: 'Create Account',
                        onPressed: submit,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
