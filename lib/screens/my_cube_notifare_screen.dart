import 'package:flutter/material.dart';
import 'package:movable_cube/changeNotifare/notifare_cube_current_position.dart';
import 'package:movable_cube/utils/colors.dart';
import 'package:movable_cube/widgets/my_button.dart';
import 'package:movable_cube/widgets/my_cube_widget.dart';

class MyNotifierCubeScreen extends StatefulWidget {
  const MyNotifierCubeScreen({super.key});

  @override
  State<MyNotifierCubeScreen> createState() => _MyNotifierCubeScreenState();
}

class _MyNotifierCubeScreenState extends State<MyNotifierCubeScreen> {
  final stateCubeNotifier =
      CubeCurrentPositionState(1, 1, true, true, true, true);

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
                ListenableBuilder(
                    listenable: stateCubeNotifier,
                    builder: (context, child) => MyCubeWidget(
                          x: stateCubeNotifier.currentPositionX,
                          y: stateCubeNotifier.currentPositionY,
                        )),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ListenableBuilder(
            listenable: stateCubeNotifier,
            builder: (context, child) => MyButton(
              onTapButton: stateCubeNotifier.isUpMoving,
              text: 'Выше',
              isActive: stateCubeNotifier.isUpMovingPossible,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ListenableBuilder(
                listenable: stateCubeNotifier,
                builder: (context, child) => MyButton(
                  onTapButton: stateCubeNotifier.isLeftMoving,
                  text: 'Влево',
                  isActive: stateCubeNotifier.isLeftMovingPossible,
                ),
              ),
              ListenableBuilder(
                listenable: stateCubeNotifier,
                builder: (context, child) => MyButton(
                  onTapButton: stateCubeNotifier.isRightMoving,
                  text: 'Вправо',
                  isActive: stateCubeNotifier.isRightMovingPossible,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          ListenableBuilder(
            listenable: stateCubeNotifier,
            builder: (context, child) => MyButton(
              onTapButton: stateCubeNotifier.isDownMoving,
              text: 'Ниже',
              isActive: stateCubeNotifier.isDownMovingPossible,
            ),
          ),
        ],
      ),
    );
  }
}
