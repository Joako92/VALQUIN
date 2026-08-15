import 'package:flutter/material.dart';
import 'screens/main_screen.dart';

class SoloTrainingApp extends StatelessWidget {
  const SoloTrainingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF080B12),
      ),
      home: const MainScreen(),
    );
  }
}