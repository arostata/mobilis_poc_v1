import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform; // Import for platform check

class AppTheme {
  static bool get isIOS => Platform.isIOS;

  static ThemeData get materialTheme => ThemeData(
    primarySwatch: Colors.deepPurple,
    scaffoldBackgroundColor: Color(0xFFFAFAFA),
  );

  static CupertinoThemeData get cupertinoTheme =>
      CupertinoThemeData(primaryColor: Color(0xFF685EC5));

  // Unified method to get the correct theme
  static Widget getApp(Widget home) {
    return isIOS
        ? CupertinoApp(
          debugShowCheckedModeBanner: false,
          theme: cupertinoTheme,
          home: home,
        )
        : MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: materialTheme,
          home: home,
        );
  }
}
