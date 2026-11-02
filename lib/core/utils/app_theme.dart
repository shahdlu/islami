import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/app_styles.dart';

class AppTheme {
  static final ThemeData darkMode = ThemeData(
    fontFamily: "JannaLT",
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.primaryColor,
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: false,
      selectedItemColor: AppColors.white,
      unselectedItemColor: AppColors.black,
      selectedLabelStyle: AppStyles.bold12White
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.black,
      iconTheme: IconThemeData(
        color: AppColors.primaryColor
      ),
      centerTitle: true,
    )
  );
}