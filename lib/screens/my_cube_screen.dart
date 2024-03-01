import 'package:flutter/material.dart';
import 'package:movable_cube/utils/colors.dart';
import 'package:movable_cube/widgets/my_button.dart';
import 'package:movable_cube/widgets/my_cube_widget.dart';

class MyCubeScreen extends StatefulWidget {
  const MyCubeScreen({super.key});

  @override
  State<MyCubeScreen> createState() => _MyCubeScreenState();
}

class _MyCubeScreenState extends State<MyCubeScreen> {
  double currentPositionX = 1;
  double currentPositionY = 1;
  bool up = true;
  bool left = true;
  bool down = true;
  bool right = true;

  void upFun() {
    if (currentPositionY != 2) {
      currentPositionY += 1;
    }
    setState(() {
      down = true;
      if (currentPositionY == 2) {
        up = false;
      } else {
        up = true;
      }
    });
  }

  void leftFun() {
    if (currentPositionX != 0) {
      currentPositionX -= 1;
    }
    setState(() {
      right = true;
      if (currentPositionX == 0) {
        left = false;
      } else {
        left = true;
      }
    });
  }

  void rightFun() {
    if (currentPositionX != 2) {
      currentPositionX += 1;
    }
    setState(() {
      left = true;
      if (currentPositionX == 2) {
        right = false;
      } else {
        right = true;
      }
    });
  }

  void downFun() {
    if (currentPositionY != 0) {
      currentPositionY -= 1;
    }
    setState(() {
      up = true;
      if (currentPositionY == 0) {
        down = false;
      } else {
        down = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'My Cube Screen',
          style: theme.titleMedium,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 400,
            color: MyColors.grayColor,
            child: Stack(
              children: [
                MyCubeWidget(
                  x: currentPositionX,
                  y: currentPositionY,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          MyButton(
            fun: upFun,
            text: 'Выше',
            active: up,
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MyButton(
                fun: leftFun,
                text: 'Влево',
                active: left,
              ),
              MyButton(
                fun: rightFun,
                text: 'Вправо',
                active: right,
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          MyButton(
            fun: downFun,
            text: 'Ниже',
            active: down,
          ),
        ],
      ),
    );
  }
}
