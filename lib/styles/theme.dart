import 'package:chefio_recipe_app/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      primaryColor: AppColors.primary,
      splashFactory: NoSplash.splashFactory,
      scaffoldBackgroundColor: Colors.white,
      buttonTheme: ButtonThemeData(
        buttonColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.r),
        ),
        height: 56.h,
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        shadowColor: Colors.red,
        scrolledUnderElevation: 4,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          elevation: 0.0,
          minimumSize: Size(327.w, 56.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.r),
          ),
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32.r),
            topRight: Radius.circular(32.r),
          ),
        ),
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: AppColors.primary,
        inactiveTrackColor: AppColors.form,
        thumbColor: AppColors.primary,
        trackShape: _CustomTrackShape(),
      ),
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.light,
        primarySwatch: const MaterialColor(
          0xff7bed8d, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
          <int, Color>{
            50: Color(0xffE9FAEC), //10%
            100: Color(0xffDDF9E1), //20%
            200: Color(0xffD1F7D7), //30%
            300: Color(0xffC4F6CC), //40%
            400: Color(0xffB8F4C2), //50%
            500: Color(0xffACF3B7), //60%
            600: Color(0xffA0F1AD), //70%
            700: Color(0xff93F0A2), //80%
            800: Color(0xff87EE98), //90%
            900: Color(0xff7BED8D), //100%
          },
        ),
      ),
    );
  }
}

class _CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double? trackHeight = sliderTheme.trackHeight;
    final double trackLeft = offset.dx;
    final double trackTop = offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
