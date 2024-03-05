import 'package:flutter/material.dart';
import 'package:movable_cube/widgets/my_button.dart';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyButton(
                onTapButton: () {
                  Navigator.of(context).pushNamed('/fields');
                },
                text: 'Go Fields page',
                isActive: true),
            const SizedBox(
              height: 10,
            ),
            MyButton(
                onTapButton: () {
                  Navigator.of(context).pushNamed('/second');
                },
                text: 'Go Cube page',
                isActive: true),
          ],
        ),
      ),
    );
  }
}
