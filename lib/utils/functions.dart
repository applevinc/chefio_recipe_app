import 'dart:developer';
import 'dart:io';
import 'dart:math' as math;

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

String getGuid() {
  const uuid = Uuid();
  return uuid.v4();
}

String getNairaCurrencyFormat(double amount) {
  final formattedAmount = getCurrencyFormat(amount);
  return '\u{20A6}$formattedAmount';
}

String getUSDCurrencyFormat(double amount) {
  final formattedAmount = getCurrencyFormat(amount);
  return '\$$formattedAmount';
}

String getCurrencyFormat(double amount, {int decimalDigits = 2}) {
  final formatter = NumberFormat.currency(
    symbol: '',
    decimalDigits: decimalDigits,
  );
  return formatter.format(amount);
}

String getNumberFromFormattedAmount(String s) {
  return NumberFormat.currency().parse(s).toInt().toString();
}

final random = math.Random();
final faker = Faker();

Future<void> fakeNetworkDelay({int seconds = 2}) async {
  await Future.delayed(Duration(seconds: seconds));
}

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

const _imageQuality = 30;

Future<File?> pickImageFromCamera() async {
  try {
    final image = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: _imageQuality,
    );

    if (image == null) {
      return null;
    }

    return File(image.path);
  } catch (e) {
    debugPrint(e.toString());
  }

  return null;
}

Future<File?> pickImageFromGallery() async {
  try {
    final image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: _imageQuality,
    );

    if (image == null) {
      return null;
    }

    return File(image.path);
  } catch (e) {
    debugPrint(e.toString());
  }

  return null;
}

final List<String> profilePhotos = [
  'https://images.unsplash.com/photo-1603415526960-f7e0328c63b1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2370&q=80',
  'https://images.unsplash.com/photo-1607990281513-2c110a25bd8c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1834&q=80',
  'https://images.unsplash.com/photo-1639747280929-e84ef392c69a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=987&q=80',
  'https://images.unsplash.com/photo-1584673392125-f91e13c6a3cb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2370&q=80',
  'https://images.unsplash.com/photo-1610388565477-5b9a3528c776?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=987&q=80',
];

String getOneProfilePhoto() {
  return profilePhotos[random.nextInt(profilePhotos.length)];
}

final List<String> mealPhotos = [
  'https://images.unsplash.com/photo-1621510525914-2ae331b4111f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2381&q=80',
  'https://images.unsplash.com/photo-1564436872-f6d81182df12?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=987&q=80',
  'https://images.unsplash.com/photo-1592417817098-8fd3d9eb14a5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=987&q=80',
  'https://images.unsplash.com/photo-1576021182211-9ea8dced3690?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=987&q=80',
  'https://images.unsplash.com/photo-1594998893017-36147cbcae05?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2386&q=80',
];

String getOneMealPhoto() {
  return mealPhotos[random.nextInt(mealPhotos.length)];
}

void logError(Object error, StackTrace stackTrace, {String? source}) {
  log(
    '''
Error occurred: $error
Stack trace: $stackTrace
    ''',
    name: source ?? 'Unknown source',
  );
}
