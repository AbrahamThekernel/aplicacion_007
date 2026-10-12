import 'package:flutter/material.dart';

import 'screens/splash_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const WarhammerArsenalApp());
}

class WarhammerArsenalApp extends StatelessWidget {
  const WarhammerArsenalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Warhammer 40K Arsenal',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const SplashScreen(),
    );
  }
}
