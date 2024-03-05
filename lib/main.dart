import 'package:flutter/material.dart';
import 'package:movable_cube/screens/my_cube_bloc_screen.dart';
import 'package:movable_cube/screens/my_cube_notifare_screen.dart';
import 'package:movable_cube/screens/my_fields_screen.dart';

import 'package:movable_cube/screens/my_start_screen.dart';
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
      routes: {
        '/start': (context) => const MyStartScreen(),
        '/first': (context) => const MyCubeScreen(),
        '/second': (context) => const MyBlocCubeScreen(),
        '/fields': (context) => const MyFieldsScreen(),
      },
      initialRoute: '/start',
    );
  }
}
