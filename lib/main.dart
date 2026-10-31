import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_routes.dart';
import 'package:islami/core/utils/app_theme.dart';
import 'package:islami/ui/screens/home/home_screen.dart';
import 'package:islami/ui/screens/on_boarding/on_boarding_screen.dart';

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
      },
    );
  }
}
