import 'package:elaro_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  static TextStyle w600s15h20DarkBluePrimary = GoogleFonts.roboto(
    fontWeight: FontWeight.w600,
    fontSize: 15,
    height: 20 / 15,
    color: AppColor.primaryDark,
  );
  static TextStyle w600s17h22DarkBluePrimary = GoogleFonts.roboto(
    fontWeight: FontWeight.w600,
    fontSize: 17,
    height: 22 / 17,
    color: AppColor.primaryDark,
  );

  static TextStyle w500s15h20DarkBlue500 = GoogleFonts.roboto(
    fontWeight: FontWeight.w500,
    fontSize: 15,
    height: 20 / 15,
    color: AppColor.darkBlue500,
  );

  static TextStyle w500s17h20DarkBlue500 = GoogleFonts.roboto(
    fontWeight: FontWeight.w500,
    fontSize: 17,
    height: 20 / 17,
    color: AppColor.darkBlue500,
  );
}
