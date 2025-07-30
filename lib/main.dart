import 'package:easy_localization/easy_localization.dart';
import 'package:elaro_app/core/app/main_app.dart';
import 'package:elaro_app/core/utils/di.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await serviceLocator();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale("en"), Locale("ru"), Locale("uz")],
      path: "assets/translations",
      fallbackLocale: Locale("en"),
      child: MainApp(),
    ),
  );
}
