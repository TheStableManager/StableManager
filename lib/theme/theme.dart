import 'package:stablemanager/theme/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme();

  static ThemeData light() => ThemeData(
        primarySwatch: MaterialColor(AppColors.darkRed.value, {
          50: Color(0xffffe5e8),
          100: Color(0xffffccd2),
          200: Color(0xffff99a5),
          300: Color(0xffff6678),
          400: Color(0xffff334b),
          500: Color(0xffff001e),
          600: Color(0xffcc0018),
          700: Color(0xff990012),
          800: Color(0xff66000c),
          900: Color(0xff330006)
        }),
        brightness: Brightness.light,
        primaryColor: AppColors.darkRed,
        primaryColorLight: AppColors.lightRed,
        scaffoldBackgroundColor: AppColors.white,
        disabledColor: AppColors.darkGrey,
        cardTheme: CardTheme().copyWith(
          color: AppColors.semiGrey,
          shape: ContinuousRectangleBorder(),
        ),
        iconTheme: IconThemeData(color: AppColors.darkRed),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.darkRed,
          selectedItemColor: AppColors.white,
          unselectedItemColor: AppColors.white,
          unselectedIconTheme: IconThemeData(opacity: 0.3),
          selectedIconTheme: IconThemeData(opacity: 1.0),
        ),
        dividerTheme: DividerThemeData(
          color: AppColors.lightRed,
          thickness: 2,
        ),
      );

  static ThemeData dark() => ThemeData(
        primarySwatch: MaterialColor(AppColors.darkRed.value, {
          50: Color(0xffffe5e8),
          100: Color(0xffffccd2),
          200: Color(0xffff99a5),
          300: Color(0xffff6678),
          400: Color(0xffff334b),
          500: Color(0xffff001e),
          600: Color(0xffcc0018),
          700: Color(0xff990012),
          800: Color(0xff66000c),
          900: Color(0xff330006)
        }),
        brightness: Brightness.light,
        primaryColor: AppColors.darkRed,
        cardTheme: CardTheme().copyWith(
          color: AppColors.semiGrey,
          shape: ContinuousRectangleBorder(),
        ),
        iconTheme: IconThemeData(color: AppColors.darkRed),
        bottomNavigationBarTheme:
            BottomNavigationBarThemeData(backgroundColor: AppColors.darkRed),
      );
}
