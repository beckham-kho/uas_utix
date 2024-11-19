import 'package:flutter/material.dart';
import 'package:uas_utix/screens/home_screen.dart';
import 'package:uas_utix/screens/login_screen.dart';
import 'package:uas_utix/screens/register_screen.dart';
import 'package:uas_utix/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UTix',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromRGBO(22, 22, 33, 1),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}