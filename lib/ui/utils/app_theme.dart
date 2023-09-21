import 'package:flutter/material.dart';
import 'package:todo_mon_c9/ui/utils/app_colors.dart';


abstract class AppTheme{
  static const TextStyle appBarTextStyle = TextStyle(fontWeight: FontWeight.bold,
   fontSize: 22, color: AppColors.white);
  static const TextStyle taskTitleTextStyle = TextStyle(fontWeight: FontWeight.bold,
      fontSize: 18, color: AppColors.primiary);
  static const TextStyle taskDescriptionTextStyle = TextStyle(fontWeight: FontWeight.normal,
      fontSize: 12, color: AppColors.lightBlack);
  static const TextStyle bottomSheetTitleTextStyle = TextStyle(fontWeight: FontWeight.normal,
      fontSize: 20, color: AppColors.black);

  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primiary,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primiary,
      elevation: 0,
      titleTextStyle: appBarTextStyle,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedIconTheme: IconThemeData(size: 32),
        unselectedIconTheme: IconThemeData(size: 32),
      selectedItemColor: AppColors.primiary,
      unselectedItemColor: AppColors.grey
    ),
    scaffoldBackgroundColor: AppColors.accent,
  );
  static ThemeData darkTheme =  ThemeData(
  );
}