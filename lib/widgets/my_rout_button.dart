import 'package:flutter/material.dart';


class MyButtonRoute extends StatefulWidget {
  final bool isActive;
  final Future<dynamic> onTapButton;
  final String text;
  const MyButtonRoute(
      {super.key,
      required this.onTapButton,
      required this.text,
      required this.isActive});

  @override
  State<MyButtonRoute> createState() => _MyButtonRouteState();
}

class _MyButtonRouteState extends State<MyButtonRoute> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color?>((states) {
          if (widget.isActive == true) {
            return const Color.fromARGB(255, 7, 106, 255);
          } else {
            return const  Color.fromARGB(255, 91, 129, 185);
          }
        }),
      ),
      onPressed:(){
        setState(() {
        widget.onTapButton;
          
        });
        
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
        child: Text(
          widget.text,
          style: widget.isActive == true ? theme.labelSmall : theme.labelMedium,
        ),
      ),
    );
  }
}
