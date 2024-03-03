import 'package:flutter/material.dart';
import 'package:movable_cube/utils/colors.dart';

class MyButton extends StatefulWidget {
  // isActive
  final bool active;
  // onPress или onTap
  // И функция должны быть описана полностью,
  // что должна возвращать и что должна принимать
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
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
        child: Text(
          widget.text,
          style: widget.active == true ? theme.labelSmall : theme.labelMedium,
        ),
      ),
    );
  }
}
