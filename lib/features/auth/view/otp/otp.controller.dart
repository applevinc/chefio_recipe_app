import 'dart:async';

import 'package:chefio_recipe_app/utils/view.controller.dart';
import 'package:flutter/material.dart';

const _OTP_EXPIRATION_SECONDS = 90;

enum OtpLoadingState { verify, resendOtp }

abstract class OtpController extends ViewController {
  OtpController({required this.email}) {
    textController = TextEditingController();
  }

  late final TextEditingController textController;

  late final String email;

  late Timer timer;

  int _seconds = _OTP_EXPIRATION_SECONDS;

  int get seconds => _seconds;

  String get timeLeft {
    return '$seconds s';
  }

  void startTimer() {
    _seconds = _OTP_EXPIRATION_SECONDS;
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (seconds == 0) {
          timer.cancel();
          return;
        }

        _seconds = seconds - 1;
        notifyListeners();
      },
    );
  }

  Future<void> verify();

  Future<void> resendOtp();

  @override
  void dispose() {
    timer.cancel();
    textController.dispose();
    super.dispose();
  }
}
