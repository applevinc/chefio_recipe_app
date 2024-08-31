import 'dart:io';

import 'package:chefio_recipe_app/core/models/failure.dart';
import 'package:chefio_recipe_app/config/app_session.dart';
import 'package:chefio_recipe_app/modules/auth/domain/entities/create_profile.request.dart';
import 'package:chefio_recipe_app/modules/auth/domain/repositories/i_sign_up.repository.dart';
import 'package:chefio_recipe_app/utils/functions.dart';
import 'package:chefio_recipe_app/utils/utils.dart';
import 'package:flutter/material.dart';

class CreateProfileController extends ViewController {
  CreateProfileController({required ISignUpRepository signUpRepository}) {
    _signUpRepository = signUpRepository;
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController(text: AppSession.authUser?.email);
  }

  late final ISignUpRepository _signUpRepository;

  late final TextEditingController firstNameController;

  late final TextEditingController lastNameController;

  late final TextEditingController emailController;

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
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    super.dispose();
  }
}
