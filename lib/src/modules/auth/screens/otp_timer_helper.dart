import 'dart:async';

import 'package:chefio_recipe_app/src/shared/utils/messenger.dart';
import 'package:chefio_recipe_app/src/shared/viewmodels/base_viewmodel.dart';

class OtpTimerHelper extends BaseViewModel {
  late Timer timer;
  int _seconds = 60;
  int get seconds => _seconds;

  String get timeLeft {
    return '$seconds s';
  }

  void initTimer() {
    startTimer();
  }

  void startTimer() {
    _seconds = 30;
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (seconds == 0) {
          timer.cancel();
          ToastMessenger.info(message: 'Token has expired');
          return;
        }

        _seconds = seconds - 1;
        notifyListeners();
      },
    );
  }
}
