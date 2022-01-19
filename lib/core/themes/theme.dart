import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meow_app/core/themes/colors.dart';
import 'package:meow_app/core/themes/fonts.dart';

final ThemeData darkTheme = ThemeData.dark().copyWith(
  textTheme: AppFonts.darkTheme,
  colorScheme: ThemeData.dark().colorScheme.copyWith(
        primary: AppColors.primaryColor,
        background: AppColors.backgroundDark,
      ),
  primaryColor: AppColors.primaryColor,
  toggleableActiveColor: AppColors.primaryColor,
  backgroundColor: AppColors.backgroundDark,
  scaffoldBackgroundColor: AppColors.backgroundDark,
  appBarTheme: AppBarTheme(backgroundColor: AppColors.backgroundDark),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderSide: BorderSide(
        color: Get.theme.primaryColor,
      ),
    ),
  ),
);

final ThemeData lightTheme = ThemeData.light().copyWith(
  textTheme: AppFonts.lightTheme,
  colorScheme: ThemeData.dark().colorScheme.copyWith(
        primary: AppColors.primaryColor,
        background: AppColors.backgroundDark,
      ),
  primaryColor: AppColors.primaryColor,
  toggleableActiveColor: AppColors.primaryColor,
  backgroundColor: AppColors.backgroundLight,
  scaffoldBackgroundColor: AppColors.backgroundLight,
  appBarTheme: AppBarTheme(backgroundColor: AppColors.backgroundLight),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderSide: BorderSide(
        color: Get.theme.primaryColor,
      ),
    ),
  ),
);
