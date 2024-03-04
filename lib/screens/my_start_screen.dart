import 'package:flutter/material.dart';


import 'package:movable_cube/widgets/my_rout_button.dart';

class MyStartScreen extends StatefulWidget {
  const MyStartScreen({super.key});

  @override
  State<MyStartScreen> createState() => _MyStartScreenState();
}

class _MyStartScreenState extends State<MyStartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hi dude!')),
      body: Center(
        child: Row(
          children: [
            MyButtonRoute(onTapButton: Navigator.of(context).pushNamed('/first'), text: 'Go Bloc page', isActive: true),
            MyButtonRoute(onTapButton: Navigator.of(context).pushNamed('/second'), text: 'Go Change page', isActive: true),
          ],
        ),
      ),
    );
  }
}