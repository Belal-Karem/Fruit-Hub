import 'package:intl/intl.dart';

String formatDateTime(String dateTime) {
  Intl.defaultLocale = 'en';
  final date = DateTime.parse(dateTime);

  return DateFormat('dd/MM/yyyy - HH:mm', 'en').format(date);
}
