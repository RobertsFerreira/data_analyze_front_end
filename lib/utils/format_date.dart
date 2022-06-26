String formatDate(DateTime dateTime, bool withHours) {
  String date =
      '${lpad(dateTime.day, '0', 2)}/${lpad(dateTime.month, '0', 2)}/${dateTime.year}';

  if (withHours) {
    date = '$date - ${dateTime.hour}:${dateTime.minute}:${dateTime.second}';
  }

  return date;
}

String lpad(dynamic value, String pattern, int length) {
  return value.toString().padLeft(length, pattern);
}
