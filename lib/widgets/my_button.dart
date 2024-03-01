import 'package:flutter/material.dart';
import 'package:movable_cube/utils/colors.dart';

class MyButton extends StatelessWidget {
  final bool active;
  final Function fun;
  final String text;
  const MyButton(
      {super.key, required this.fun, required this.text, required this.active});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color?>((states) {
          if (active == true) {
            return MyColors.amberActiveColor;
          } else {
            return MyColors.amberDisActiveColor;
          }
        }),
      ),
      onPressed: () {
        fun();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 24),
        child: Text(
          text,
          style: active == true ? theme.labelSmall : theme.labelMedium,
        ),
      ),
    );
  }
}
