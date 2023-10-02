import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextHelperFunctions {
  TextHelperFunctions._();

  /// Line height is multiple of fontsize
  ///
  /// For example, if want to have height 24.0, with font-size 20.0,
  /// we should have height property 1.2
  static double calcTextLineHeight({
    required double fontSize,
    required double designLineHeightValue,
  }) {
    return designLineHeightValue / fontSize;
  }

  static double calcLetterSpacing(double designSpacingValue) {
    return designSpacingValue * 16.sp;
  }


  static String? checkIfEmpty(String text) {
    if (text.isEmpty) {
      return null;
    } else {
      return text;
    }
  }
}
