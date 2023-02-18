import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(),
        primaryColor: Colors.white,
        hintColor: Colors.black,
        brightness: Brightness.light,
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.black87,
        ),
        appBarTheme: const AppBarTheme(
          elevation: 2.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
          iconTheme: IconThemeData(color: Color(0xFF4B9CD6)),
          titleTextStyle: TextStyle(
              color: Color(0xFF4B9CD6),
              fontSize: 18,
              fontWeight: FontWeight.w500,
              letterSpacing: -0.2),
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
        ),
        drawerTheme: const DrawerThemeData(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
        ),
      );
}
