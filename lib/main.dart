import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobilis_poc_v1/views/screens/my_assessment_screen.dart';
import 'package:mobilis_poc_v1/views/screens/sign_in_screen.dart';
import 'core/theme/app_theme.dart';

import 'dart:io';

 //allow any certificates globally for local testing
 class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(AppTheme.getApp(const SignInScreen())); // Dynamically switch app
}
