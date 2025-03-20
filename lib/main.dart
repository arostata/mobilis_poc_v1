import 'package:flutter/cupertino.dart';
import 'core/theme/app_theme.dart';
import 'views/auth/sign_in_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const SignInScreen(),
    );
  }
}
