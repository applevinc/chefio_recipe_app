import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class Utils {
  Utils._();

  static String getGuid() {
    const uuid = Uuid();
    return uuid.v4();
  }

  static String getNairaCurrencyFormat(double amount) {
    final formattedAmount = getCurrencyFormat(amount);
    return '\u{20A6}$formattedAmount';
  }

  static String getUSDCurrencyFormat(double amount) {
    final formattedAmount = getCurrencyFormat(amount);
    return '\$$formattedAmount';
  }

  static String getCurrencyFormat(double amount, {int decimalDigits = 2}) {
    final formatter = NumberFormat.currency(
      symbol: '',
      decimalDigits: decimalDigits,
    );
    return formatter.format(amount);
  }

  static String getNumberFromFormattedAmount(String s) {
    return NumberFormat.currency().parse(s).toInt().toString();
  }
}

Future<void> fakeNetworkDelay({int seconds = 2}) async {
  await Future.delayed(Duration(seconds: seconds));
}
