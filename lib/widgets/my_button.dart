import 'package:flutter/material.dart';
import 'package:movable_cube/utils/colors.dart';

class MyButton extends StatefulWidget {
  final bool isActive;
  final Function onTapButton;
  final String text;
  const MyButton(
      {super.key,
      required this.onTapButton,
      required this.text,
      required this.isActive});

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
          if (widget.isActive == true) {
            return MyColors.amberActiveColor;
          } else {
            return MyColors.amberDisActiveColor;
          }
        }),
      ),
      onPressed: () {
        setState(() {
          widget.onTapButton();
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
