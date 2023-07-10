extension DateTimeExt on DateTime {
  String get formatTimeInAMPM {
    int hour = this.hour;
    int minute = this.minute;

    String ampm = hour >= 12 ? 'PM' : 'AM';

    hour = hour % 12;
    hour = hour == 0 ? 12 : hour;

    String hr = hour < 10 ? '0$hour' : hour.toString();
    String mn = minute < 10 ? '0$minute' : minute.toString();

    return '$hr:$mn $ampm';
  }
}