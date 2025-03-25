import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobilis_poc_v1/views/screens/my_assessment_screen.dart';
import 'package:mobilis_poc_v1/views/screens/sign_in_screen.dart';
import 'core/theme/app_theme.dart';

void main() {
  runApp(AppTheme.getApp(const MyAssessmentScreen())); // Dynamically switch app
}
