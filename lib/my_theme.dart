import 'package:flutter/material.dart';

class MyTheme {
  static Color primaryLight = Color(0xff121312);
  static Color searchColor = Color(0xff514F4F);
  static Color whiteColor = Color(0xffFFFFFF);
  static Color yellowColor = Color(0xffFFBB3B);
  static Color greyColor = Color(0xff707070);
  static Color blackGrey = Color(0xff1D1E1D);

  static ThemeData lightTheme = ThemeData(
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          color: whiteColor,
        ),
        color: primaryLight,
        shape: StadiumBorder(
            side: BorderSide(width: 1, color: MyTheme.whiteColor)),
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(
            fontSize: 22, fontWeight: FontWeight.bold, color: whiteColor),
        titleMedium: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w500, color: whiteColor),
        titleSmall: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w400, color: greyColor),
      ),
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: yellowColor,
        unselectedItemColor: whiteColor,
      ));
}
