import 'dart:convert';
import 'dart:ui';
import 'package:elaro_app/core/secure_storage.dart/secure_storage.dart';
import 'package:elaro_app/feature/profile/data/model/profile_model.dart';
import 'package:flutter/material.dart';
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

  static Future<ProfileModel> getUser() async {
    final user = await SecureStorage().read(key: "user") ?? "";
    try {
      return ProfileModel.fromJson(json.decode(user));
    } catch (e) {
      return const ProfileModel();
    }
  }

  static validator(String? text, int len, [String? val]) {
    if (text == null) return val ?? "";
    if (text.length < len) return val ?? "";
    return null;
  }

  static Color hexToColor(String hexColor) {
    try {
      hexColor = hexColor.replaceAll('#', '');
      if (hexColor.length == 6) {
        hexColor = 'FF$hexColor';
      }
      return Color(int.parse(hexColor, radix: 16));
    } catch (e) {
      return Colors.transparent;
    }
  }
}
