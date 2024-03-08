import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movable_cube/bloc/cube_position_bloc.dart';
import 'package:movable_cube/screens/my_cube_bloc_screen.dart';
import 'package:movable_cube/screens/my_cube_notifare_screen.dart';
import 'package:movable_cube/screens/my_fields_screen.dart';

import 'package:movable_cube/screens/my_start_screen.dart';
import 'package:movable_cube/utils/theme.dart';

void main() {
  runApp(MultiRepositoryProvider(
      providers: [BlocProvider(create: (context) => CubePositionBloc())],
      child: const MyApp()));
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
        '/start/cubeNotifier': (context) => const MyNotifierCubeScreen(),
        '/start/cubeBloc': (context) => const MyBlocCubeScreen(),
        '/start/cubeForms': (context) => const MyFormScreen(),
      },
      initialRoute: '/start',
    );
  }
}
