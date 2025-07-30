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
  static BoxDecoration get white16r => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(16),
  );

  static TextStyle w400s15h20DarkBlue300 = GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 15,
    height: 20 / 15,
    color: AppColor.darkBlue300,
  );
  static TextStyle w400s15h20DarkBlue700 = GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 15,
    height: 20 / 15,
    // color: AppColor.darkBlue700,
  );
  static TextStyle w600s20h24DarkBluePrimary = GoogleFonts.roboto(
    fontWeight: FontWeight.w600,
    fontSize: 20,
    height: 24 / 20,
    color: AppColor.primaryDark,
  );
  static TextStyle w600s17h22DarkBluePrimary = GoogleFonts.roboto(
    fontWeight: FontWeight.w600,
    fontSize: 17,
    height: 22 / 17,
    color: AppColor.primaryDark,
  );
  static TextStyle w500s13h18DarkBlue500 = GoogleFonts.roboto(
    fontWeight: FontWeight.w500,
    fontSize: 13,
    height: 18 / 13,
    color: AppColor.darkBlue500,
  );

  static TextStyle w400s15h20DarkBlue500 = GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 15,
    height: 20 / 15,
    color: AppColor.darkBlue500,
  );

  static TextStyle w700s18h28DarkBluePrimary = GoogleFonts.roboto(
    fontWeight: FontWeight.w700,
    fontSize: 18,
    height: 28 / 18,
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
  static TextStyle w500s15h20DarkBlue300 = GoogleFonts.roboto(
    fontWeight: FontWeight.w500,
    fontSize: 15,
    height: 20 / 15,
    color: AppColor.darkBlue500,
  );

  static TextStyle w500s15h20Primary = GoogleFonts.roboto(
    fontWeight: FontWeight.w500,
    fontSize: 15,
    height: 20 / 15,
    color: AppColor.primaryDark,
  );
  static TextStyle w400s13h18DarkBlue300 = GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 13,
    height: 18 / 13,
    // color: AppColor.darkBlue300,
  );

  static BoxDecoration get lightGray400R16NoBorder => BoxDecoration(
    color: AppColor.lightGray400,
    borderRadius: BorderRadius.circular(16),
  );

  static TextStyle w600s18h22DarkBluePrimary = GoogleFonts.roboto(
    fontWeight: FontWeight.w600,
    fontSize: 18,
    height: 22 / 18,
    color: AppColor.primaryDark,
  );

  static BoxDecoration get cyan75 => BoxDecoration(
    color: AppColor.cyan75,
    borderRadius: BorderRadius.circular(8),
  );
}
