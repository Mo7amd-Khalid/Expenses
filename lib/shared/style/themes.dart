import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var myColorScheme = ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 1,122,234));
ThemeData lightMode = ThemeData(
    colorScheme: myColorScheme,
    appBarTheme: AppBarTheme(
      backgroundColor: myColorScheme.onPrimaryContainer,
      foregroundColor: myColorScheme.primaryContainer,
      titleTextStyle: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 24.0,
          color: Colors.white
      ),
      elevation: 0.0,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark
      ),
    ),
    cardTheme: CardTheme().copyWith(color: myColorScheme.secondaryContainer),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize: 32,
          color: Colors.black,
          fontWeight: FontWeight.bold

        ),
      displayMedium: TextStyle(
            fontSize: 26,
            color: Colors.black,
            fontWeight: FontWeight.bold
        ),
      displaySmall: TextStyle(
            fontSize: 22,
            color: Colors.black,
            fontWeight: FontWeight.bold
        ),
      bodyLarge: TextStyle(
          fontSize: 18
      ),
      bodyMedium: TextStyle(
          fontSize: 16
        ),
      bodySmall: TextStyle(
            fontSize: 14,
          color: Colors.grey
        ),
    ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: myColorScheme.primary,
    )
  )
);

ThemeData darkMode = ThemeData(
    primarySwatch: Colors.deepOrange,
    scaffoldBackgroundColor: Colors.grey[900],
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      titleTextStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 22.0
      ),
      elevation: 0.0,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Colors.black
      ),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize: 32,
          color: Colors.black,
          fontWeight: FontWeight.bold

      ),
      displayMedium: TextStyle(
          fontSize: 26,
          color: Colors.black,
          fontWeight: FontWeight.bold
      ),
      displaySmall: TextStyle(
          fontSize: 22,
          color: Colors.black,
          fontWeight: FontWeight.bold
      ),
      bodyLarge: TextStyle(
          fontSize: 18
      ),
      bodyMedium: TextStyle(
          fontSize: 16
      ),
      bodySmall: TextStyle(
          fontSize: 14,
          color: Colors.grey
      ),
    )
);