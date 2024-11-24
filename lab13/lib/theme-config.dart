import 'package:flutter/material.dart';

class AppTextStyles {
  static const TextStyle displayLarge = TextStyle(
    fontSize: 32.0,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16.0,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

}

class AppTheme {
  static ThemeData getTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Color.fromRGBO(212, 188, 253, 1.0),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
        bodyLarge: TextStyle(fontSize: 16.0, color: Colors.black),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: Color.fromRGBO(255, 255, 255, 1.0),
        hintStyle: TextStyle(fontSize: 14, color: Colors.black),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          shape: const RoundedRectangleBorder(
            side: BorderSide.none,
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromRGBO(103, 85, 140, 1.0),
          foregroundColor: Colors.white,
          textStyle: const TextStyle(fontSize: 16),
          shape: RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(
            color: Color.fromRGBO(200, 202, 203, 0.5),
          ),
          textStyle: const TextStyle(fontSize: 16),
          shape: const RoundedRectangleBorder(
            side: BorderSide.none,
          ),
        ),
      ),
    );
  }
}