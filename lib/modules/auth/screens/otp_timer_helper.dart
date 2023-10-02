import 'dart:async';

import 'package:chefio_recipe_app/utils/base_viewmodel.dart';

const OTP_EXPIRATION_SECONDS = 90;

class OtpTimerHelper extends BaseViewModel {
  late Timer timer;
  int _seconds = OTP_EXPIRATION_SECONDS;
  int get seconds => _seconds;

  String get timeLeft {
    return '$seconds s';
  }

  void initTimer() {
    startTimer();
  }

  void startTimer() {
    _seconds = OTP_EXPIRATION_SECONDS;
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
}
