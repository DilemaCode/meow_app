import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meow_app/core/themes/colors.dart';

class AppFonts {
  static TextStyle blackBold =
      TextStyle(fontWeight: FontWeight.bold, color: Colors.black);
  static TextStyle whiteBold =
      TextStyle(fontWeight: FontWeight.bold, color: Colors.white);

  static TextTheme darkTheme = TextTheme(
    headline1: GoogleFonts.raleway().copyWith(
      color: AppColors.whiteText,
    ),
    headline2: GoogleFonts.raleway().copyWith(
      color: AppColors.whiteText,
    ),
    headline3: GoogleFonts.raleway().copyWith(
      color: AppColors.whiteText,
    ),
    headline4: GoogleFonts.raleway().copyWith(
      color: AppColors.whiteText,
    ),
    headline5: GoogleFonts.raleway().copyWith(
      color: AppColors.whiteText,
    ),
    headline6: GoogleFonts.raleway().copyWith(
      color: AppColors.whiteText,
    ),
    subtitle1: GoogleFonts.raleway().copyWith(
      color: AppColors.whiteText,
    ),
    subtitle2: GoogleFonts.raleway().copyWith(
      color: AppColors.whiteText,
    ),
    bodyText1: GoogleFonts.nunito().copyWith(
      color: AppColors.whiteText,
    ),
    bodyText2: GoogleFonts.nunito().copyWith(
      color: AppColors.whiteText,
    ),
    caption: GoogleFonts.nunito().copyWith(
      color: AppColors.whiteText,
    ),
    button: GoogleFonts.nunito().copyWith(
      color: AppColors.whiteText,
    ),
    overline: GoogleFonts.nunito().copyWith(
      color: AppColors.whiteText,
    ),
  );
  static TextTheme lightTheme = TextTheme(
    headline1: GoogleFonts.raleway().copyWith(
      color: AppColors.blackText,
    ),
    headline2: GoogleFonts.raleway().copyWith(
      color: AppColors.blackText,
    ),
    headline3: GoogleFonts.raleway().copyWith(
      color: AppColors.blackText,
    ),
    headline4: GoogleFonts.raleway().copyWith(
      color: AppColors.blackText,
    ),
    headline5: GoogleFonts.raleway().copyWith(
      color: AppColors.blackText,
    ),
    headline6: GoogleFonts.raleway().copyWith(
      color: AppColors.blackText,
    ),
    subtitle1: GoogleFonts.raleway().copyWith(
      color: AppColors.blackText,
    ),
    subtitle2: GoogleFonts.raleway().copyWith(
      color: AppColors.blackText,
    ),
    bodyText1: GoogleFonts.nunito().copyWith(
      color: AppColors.blackText,
    ),
    bodyText2: GoogleFonts.nunito().copyWith(
      color: AppColors.blackText,
    ),
    caption: GoogleFonts.nunito().copyWith(
      color: AppColors.blackText,
    ),
    button: GoogleFonts.nunito().copyWith(
      color: AppColors.blackText,
    ),
    overline: GoogleFonts.nunito().copyWith(
      color: AppColors.blackText,
    ),
  );
}
