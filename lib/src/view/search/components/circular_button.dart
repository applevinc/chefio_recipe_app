import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CirclularButton extends StatelessWidget {
  const CirclularButton({
    Key? key,
    required this.label,
    required this.bgColor,
    required this.textColor,
    required this.onPressed,
  }) : super(key: key);

  final String label;
  final Color bgColor;
  final Color textColor;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 19.h),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(32.r),
          ),
          child: Text(
            label,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: textColor, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
