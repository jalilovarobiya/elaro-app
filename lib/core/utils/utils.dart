import 'package:flutter/material.dart';

class Utils {
  static bool isDioSuccess(int? statusCode) {
    if (statusCode == null) return false;
    return (statusCode > 199 && statusCode < 300);
  }
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
