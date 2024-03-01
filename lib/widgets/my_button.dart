import 'package:flutter/material.dart';
import 'package:movable_cube/utils/colors.dart';

class MyButton extends StatefulWidget {
  final bool active;
  final Function fun;
  final String text;
  const MyButton(
      {super.key, required this.fun, required this.text, required this.active});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color?>((states) {
          if (widget.active == true) {
            return MyColors.amberActiveColor;
          } else {
            return MyColors.amberDisActiveColor;
          }
        }),
      ),
      onPressed: () {
        setState(() {
          widget.fun();
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 24),
        child: Text(
          widget.text,
          style: widget.active == true ? theme.labelSmall : theme.labelMedium,
        ),
      ),
    );
  }
}
