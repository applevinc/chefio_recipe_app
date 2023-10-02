import 'package:all_validations_br/all_validations_br.dart';

class Validator {
  static bool isNotValidEmail(String? value) {
    if (AllValidations.isEmail(value!)) {
      return false;
    } else {
      return true;
    }
  }

  static bool isNumericOnly(String? value) {
    if (value != null && AllValidations.isNumericOnly(value)) {
      return true;
    } else {
      return false;
    }
  }
}

class PhoneNumberValidator {
  static bool isCorrectLength(String? value) {
    if (value != null && value.length == 11) {
      return true;
    } else {
      return false;
    }
  }

  static bool isNumericOnly(String? value) {
    if (value != null && AllValidations.isNumericOnly(value)) {
      return true;
    } else {
      return false;
    }
  }
}

class PasswordValidator {
  static bool isNotCorrectLength(String? value) {
    if (value != null && value.length > 7) {
      return false;
    } else {
      return true;
    }
  }

  static bool isNotTheSame({
    required String text1,
    required String text2,
  }) {
    if (text1 == text2) {
      return false;
    } else {
      return true;
    }
  }
}
