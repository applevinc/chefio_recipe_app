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
      child: CustomMessenger.success(
        message: message,
      ),
    );
  }

  static error({
    required BuildContext context,
    required String message,
  }) {
    snackBar(
      context: context,
      child: CustomMessenger.error(
        message: message,
      ),
    );
  }

  static info({
    required BuildContext context,
    required String message,
  }) {
    snackBar(
      context: context,
      child: CustomMessenger.info(
        message: message,
      ),
    );
  }

  static snackBar({required BuildContext context, required Widget child}) {
    showTopSnackBar(
      Overlay.of(context),
      child,
      padding: EdgeInsets.zero,
    );
  }
}

class CustomMessenger extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String message;

  const CustomMessenger.success({
    super.key,
    required this.message,
    this.icon = Icons.check_circle,
    this.iconColor = Colors.green,
  });

  const CustomMessenger.error({
    super.key,
    required this.message,
    this.icon = Icons.error,
    this.iconColor = Colors.red,
  });

  const CustomMessenger.info({
    super.key,
    required this.message,
    this.icon = Icons.info,
    this.iconColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        margin: EdgeInsets.only(top: 22.h, left: 20.w, right: 20.w),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50.r),
          boxShadow: const [
            BoxShadow(
              color: Color(0x07000000),
              blurRadius: 13,
              offset: Offset(0, 4),
              spreadRadius: 4,
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 20.sp,
              color: iconColor,
            ),
            SizedBox(width: 12.w),
            Text(
              message,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppText.bold400(context).copyWith(
                color: Colors.black54,
              ),
            ),
          ],
        ),
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
