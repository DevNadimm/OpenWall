import 'package:flutter/material.dart';
import 'package:open_wall/views/constants/app_colors.dart';
import 'package:open_wall/views/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OpenWall',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: backgroundColor
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
