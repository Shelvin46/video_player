import 'package:flutter/material.dart';
import 'package:video_player_app/core/constants/color_constants.dart';
import 'package:video_player_app/core/constants/text_style_constants.dart';
import 'package:video_player_app/features/onboard/view/splash_screen.dart';

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key});

  ColorScheme lightColorScheme = const ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.black,
    onPrimary: AppColors.black,
    secondary: AppColors.white,
    onSecondary: AppColors.white,
    error: AppColors.red,
    onError: AppColors.red,
    surface: AppColors.black,
    onSurface: AppColors.black,
  );

  ColorScheme darkColorScheme = const ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.white,
    onPrimary: AppColors.white,
    secondary: AppColors.black,
    onSecondary: AppColors.black,
    error: AppColors.red,
    onError: AppColors.red,
    surface: AppColors.white,
    onSurface: AppColors.white,
  );

  // ButtonThemeData buttonThemeData = const ButtonThemeData(
  //   colorScheme: ColorScheme(
  //     brightness: Brightness.light,
  //     primary: AppColors.white,
  //     onPrimary: AppColors.white,
  //     secondary: AppColors.white,
  //     onSecondary: AppColors.white,
  //     error: AppColors.white,
  //     onError: AppColors.white,
  //     surface: AppColors.white,
  //     onSurface: AppColors.white,
  //   ),
  // );

  TextTheme textTheme = TextTheme(
    displayLarge: TextStyleConstants.displayLargeTextStyle,
    displaySmall: TextStyleConstants.displaySmallTextStyle,
    labelSmall: TextStyleConstants.labelSmallTextStyle,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'InnoNet',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.white,
        fontFamily: TextStyleConstants.fontFamily,
        useMaterial3: true,
        colorScheme: lightColorScheme,
        textTheme: textTheme,
      ),
      darkTheme: ThemeData(
        fontFamily: TextStyleConstants.fontFamily,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color.fromRGBO(0, 0, 0, 0),
        useMaterial3: true,
        colorScheme: darkColorScheme,
        textTheme: textTheme,
      ),
      themeMode: MediaQuery.platformBrightnessOf(context) == Brightness.dark
          ? ThemeMode.dark
          : ThemeMode.light,
      home: const SplashScreen(),
    );
  }
}
