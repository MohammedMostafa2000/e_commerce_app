import 'package:e_commerce_app/core/colors_manager.dart';
import 'package:flutter/material.dart';

abstract class ThemeManager {
  static final ThemeData light = ThemeData(
    scaffoldBackgroundColor: ColorsManager.white,
    splashFactory: NoSplash.splashFactory,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: ColorsManager.lightBlue,
      unselectedItemColor: ColorsManager.white,
      type: BottomNavigationBarType.fixed,
      backgroundColor: ColorsManager.lightBlue,
    ),
  );
  static final ThemeData dark = ThemeData();
}
