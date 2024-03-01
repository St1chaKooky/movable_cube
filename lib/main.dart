import 'package:flutter/material.dart';
import 'package:movable_cube/screens/my_cube_screen.dart';
import 'package:movable_cube/utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const MyCubeScreen(),
    );
  }
}
