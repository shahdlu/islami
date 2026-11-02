import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_routes.dart';
import 'package:islami/core/utils/app_theme.dart';
import 'package:islami/ui/screens/home/home_screen.dart';
import 'package:islami/ui/screens/on_boarding/on_boarding_screen.dart';
import 'package:islami/ui/screens/sura_details/sura_details_screen.dart';
import 'package:islami/ui/screens/sura_details1/sura_details_screen1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: AppTheme.darkMode,
      themeMode: ThemeMode.dark,
      initialRoute: AppRoutes.onBoarding,
      routes: {
        AppRoutes.home : (context) => HomeScreen(),
        AppRoutes.onBoarding : (context) => OnBoardingScreen(),
        AppRoutes.suraDetails : (context) => SuraDetailsScreen(),
        AppRoutes.suraDetails1 : (context) => SuraDetailsScreen1(),
      },
    );
  }
}
