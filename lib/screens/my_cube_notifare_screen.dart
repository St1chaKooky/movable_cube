import 'package:flutter/material.dart';
import 'package:movable_cube/changeNotifare/changeNotifare.dart';
import 'package:movable_cube/utils/colors.dart';
import 'package:movable_cube/widgets/my_button.dart';
import 'package:movable_cube/widgets/my_cube_widget.dart';

class MyCubeScreen extends StatefulWidget {
  const MyCubeScreen({super.key});

  @override
  State<MyCubeScreen> createState() => _MyCubeScreenState();
}

class _MyCubeScreenState extends State<MyCubeScreen> {

 final stateCubeNotifare = CurrentPositionState(1, 1, true, true, true, true);

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
                  listenable: stateCubeNotifare, 
                  builder: (context, child) =>MyCubeWidget(x: stateCubeNotifare.currentPositionX,y: stateCubeNotifare.currentPositionY,)
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ListenableBuilder(
                  listenable: stateCubeNotifare, 
                  builder: (context, child) =>MyButton(
            onTapButton: stateCubeNotifare.isUpMoving,
            text: 'Выше',
            isActive: stateCubeNotifare.isUpMovingPossible,
          ),
                ),
          
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ListenableBuilder(
                  listenable: stateCubeNotifare, 
                  builder: (context, child) =>MyButton(
                onTapButton: stateCubeNotifare.isLeftMoving,
                text: 'Влево',
                isActive: stateCubeNotifare.isLeftMovingPossible,
              ),
                ),
              ListenableBuilder(
                  listenable: stateCubeNotifare, 
                  builder: (context, child) =>MyButton(
                onTapButton: stateCubeNotifare.isRightMoving,
                text: 'Вправо',
                isActive: stateCubeNotifare.isRightMovingPossible,
              ),
                ),
              
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          ListenableBuilder(
                  listenable: stateCubeNotifare, 
                  builder: (context, child) =>MyButton(
            onTapButton: stateCubeNotifare.isDownMoving,
            text: 'Ниже',
            isActive: stateCubeNotifare.isDownMovingPossible,
          ),
                ),
          
        ],
      ),
    );
  }
}
