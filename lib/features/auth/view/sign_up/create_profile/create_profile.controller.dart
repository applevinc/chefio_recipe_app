import 'dart:io';

import 'package:chefio_recipe_app/common/models/failure.dart';
import 'package:chefio_recipe_app/features/auth/domain/entities/create_profile.request.dart';
import 'package:chefio_recipe_app/features/auth/domain/repositories/i_sign_up.repository.dart';
import 'package:chefio_recipe_app/features/auth/view/password_strength/password_strength.controller.dart';
import 'package:chefio_recipe_app/utils/functions.dart';
import 'package:flutter/material.dart';

class CreateProfileController extends PasswordStrengthController {
  CreateProfileController({required ISignUpRepository signUpRepository}) {
    _signUpRepository = signUpRepository;
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  late final ISignUpRepository _signUpRepository;

  late final TextEditingController firstNameController;

  late final TextEditingController lastNameController;

  late final TextEditingController emailController;

  late final TextEditingController passwordController;

  File? _image;

  File? get image => _image;

  void pickImage() async {
    final image = await pickImageFromGallery();

    if (image == null) {
      return;
    }

    _image = image;
    notifyListeners();
  }

  Future<void> execute() async {
    if (image == null) {
      throw Failure('Profile image is required');
    }

    final request = CreateProfileRequest(
      firstName: firstNameController.text.trim(),
      lastName: lastNameController.text.trim(),
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
      image: image!,
    );

    try {
      setBusy(true);
      await _signUpRepository.createProfile(request);
    } finally {
      setBusy(false);
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
