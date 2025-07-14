import 'package:clean_arxitekture/core/app/main_app.dart';
import 'package:clean_arxitekture/core/utils/di.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await serviceLocator();
  runApp(const MainApp());
}
