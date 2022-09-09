import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeHelperFunctions {
  DateTimeHelperFunctions._();

  static Future<String?> pickDate(BuildContext context) async {
    final initialDate = DateTime(DateTime.now().year - 14);
    final date = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(DateTime.now().year - 150),
      lastDate: initialDate,
    );

    if (date == null) return null;

    final formattedDate = DateFormat('yyyy-MM-dd').format(date);
    return formattedDate;
  }
}
