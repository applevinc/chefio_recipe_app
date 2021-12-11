import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  final String label;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        label,
        style: GoogleFonts.inter(
          fontSize: 15.0.sp,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.105.sp,
        ),
      ),
      onPressed: onPressed,
    );
  }
}