import 'package:chefio_recipe_app/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class Messenger {
  static success({
    required BuildContext context,
    required String message,
  }) {
    snackBar(
      context: context,
      message: message,
      backgroundColor: Colors.green,
    );
  }

  static error({
    required BuildContext context,
    required String message,
  }) {
    snackBar(
      context: context,
      message: message,
      backgroundColor: Colors.red,
    );
  }

  static info({
    required BuildContext context,
    required String message,
  }) {
    snackBar(
      context: context,
      message: message,
      backgroundColor: Colors.black,
    );
  }

  static snackBar({
    required BuildContext context,
    required String message,
    required Color backgroundColor,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
      ),
    );
  }
}

class ToastMessenger {
  static info({
    required String message,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
    );
  }

  static error({
    required String message,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      backgroundColor: Colors.red,
    );
  }

  static success({
    required String message,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
    );
  }
}
