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
  bool isUpMovingPossible = true;
  bool isLeftMovingPossible = true;
  bool isDownMovingPossible = true;
  bool isRightMovingPossible = true;

  void isUpMoving() {
    if (currentPositionY != 2) {
      currentPositionY += 1;
    }
    setState(() {
      isDownMovingPossible = true;
      if (currentPositionY == 2) {
        isUpMovingPossible = false;
      } else {
        isUpMovingPossible = true;
      }
    });
  }

  void isLeftMoving() {
    if (currentPositionX != 0) {
      currentPositionX -= 1;
    }
    setState(() {
      isRightMovingPossible = true;
      if (currentPositionX == 0) {
        isLeftMovingPossible = false;
      } else {
        isLeftMovingPossible = true;
      }
    });
  }

  void isRightMoving() {
    if (currentPositionX != 2) {
      currentPositionX += 1;
    }
    setState(() {
      isLeftMovingPossible = true;
      if (currentPositionX == 2) {
        isRightMovingPossible = false;
      } else {
        isRightMovingPossible = true;
      }
    });
  }

  void isDownMoving() {
    if (currentPositionY != 0) {
      currentPositionY -= 1;
    }
    setState(() {
      isUpMovingPossible = true;
      if (currentPositionY == 0) {
        isDownMovingPossible = false;
      } else {
        isDownMovingPossible = true;
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
            height: 200,
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
            height: 20,
          ),
          MyButton(
            onTapButton: isUpMoving,
            text: 'Выше',
            isActive: isUpMovingPossible,
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MyButton(
                onTapButton: isLeftMoving,
                text: 'Влево',
                isActive: isLeftMovingPossible,
              ),
              MyButton(
                onTapButton: isRightMoving,
                text: 'Вправо',
                isActive: isRightMovingPossible,
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          MyButton(
            onTapButton: isDownMoving,
            text: 'Ниже',
            isActive: isDownMovingPossible,
          ),
        ],
      ),
    );
  }
}
