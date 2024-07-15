import 'package:flutter/material.dart';
import 'package:try_fit/theme/app_theme.dart';
import 'package:try_fit/views/start_up/startup_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: buildCustomTheme(),
      home: const SplashScreen(),
    );
  }
}

