import 'package:flutter/material.dart';
import 'ui/ui.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Aplikasi Dzikir",
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
