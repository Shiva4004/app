import 'package:intl/intl.dart';

String formatCurrency(double amount) {
  final formatter = NumberFormat.currency(symbol: '\$');
  return formatter.format(amount);
}

String formatDate(DateTime date) {
  return DateFormat.yMMMd().format(date);
}

String formatDateTime(DateTime dateTime) {
  return DateFormat.yMMMd().add_Hm().format(dateTime);
}

String truncateString(String text, int maxLength) {
  if (text.length <= maxLength) {
    return text;
  }
  return '${text.substring(0, maxLength)}...';
}
