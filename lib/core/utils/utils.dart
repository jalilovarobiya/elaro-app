import 'package:elaro_app/core/secure_storage.dart/secure_storage.dart';
import 'package:intl/intl.dart';

class Utils {
  static bool isDioSuccess(int? statusCode) {
    if (statusCode == null) return false;
    return (statusCode > 199 && statusCode < 300);
  }

  static String cashFormat(String cash) {
    if (cash.contains('.')) {
      cash = cash.substring(0, cash.indexOf('.'));
    }

    final formatCurrency = NumberFormat.currency(name: '', locale: "uz");

    cash = formatCurrency.format(int.parse(cash)).toString();

    if (cash.contains(',')) {
      cash = cash.substring(0, cash.indexOf(','));
    }

    return cash;
  }

  static String generateGoogleMapsLink(double latitude, double longitude) {
    return "https://www.google.com/maps?q=$latitude,$longitude";
  }

  Future<bool> isLogin() async {
    final token = await SecureStorage().read(key: "token");
    return token != null;
  }
}
