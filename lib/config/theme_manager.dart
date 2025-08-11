import 'package:e_commerce_app/core/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class ThemeManager {
  static final ThemeData light = ThemeData(
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        size: 30.sp,
        color: ColorsManager.lightBlue,
      ),
      backgroundColor: ColorsManager.white,
      elevation: 0,
      foregroundColor: ColorsManager.lightBlue,
      centerTitle: true,
    ),
    textTheme: TextTheme(
      displaySmall: GoogleFonts.poppins(
        fontSize: 14.sp,
        fontWeight: FontWeight.w300,
        color: ColorsManager.lightBlue,
      ),
      labelSmall: GoogleFonts.poppins(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: ColorsManager.darkBlue,
      ),
      labelMedium: GoogleFonts.poppins(
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
        color: ColorsManager.darkBlue,
      ),
      titleMedium: GoogleFonts.poppins(
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
        color: ColorsManager.darkBlue,
      ),
    ),
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
