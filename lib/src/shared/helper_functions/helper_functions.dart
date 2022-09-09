import 'package:uuid/uuid.dart';

class HelperFunctions {
  HelperFunctions._();

  static String generateUniqueId() {
    const uuid = Uuid();
    return uuid.v4();
  }
}
