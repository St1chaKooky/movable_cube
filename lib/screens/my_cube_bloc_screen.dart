import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movable_cube/bloc/cube_position_bloc.dart';
import 'package:movable_cube/utils/colors.dart';
import 'package:movable_cube/widgets/my_button.dart';
import 'package:movable_cube/widgets/my_cube_widget.dart';

class MyBlocCubeScreen extends StatefulWidget {
  const MyBlocCubeScreen({super.key});

  @override
  State<MyBlocCubeScreen> createState() => _MyBlocCubeScreenState();
}

class _MyBlocCubeScreenState extends State<MyBlocCubeScreen> {
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CubePositionBloc>();
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'My Cube BloC Screen',
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
                BlocBuilder<CubePositionBloc, CubePositionState>(
                    bloc: bloc,
                    builder: (context, state) {
                      return MyCubeWidget(
                        x: bloc.currentPositionX,
                        y: bloc.currentPositionY,
                      );
                    })
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<CubePositionBloc, CubePositionState>(
            bloc: bloc,
            builder: (context, state) => MyButton(
              onTapButton: () => bloc.add(IsUpMovingCubeEvent()),
              text: 'Выше',
              isActive: bloc.isUpMovingPossible,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BlocBuilder<CubePositionBloc, CubePositionState>(
                bloc: bloc,
                builder: (context, state) => MyButton(
                  onTapButton: () => bloc.add(IsLeftMovingCubeEvent()),
                  text: 'Влево',
                  isActive: bloc.isLeftMovingPossible,
                ),
              ),
              BlocBuilder<CubePositionBloc, CubePositionState>(
                bloc: bloc,
                builder: (context, state) => MyButton(
                  onTapButton: () => bloc.add(IsRightMovingCubeEvent()),
                  text: 'Вправо',
                  isActive: bloc.isRightMovingPossible,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          BlocBuilder<CubePositionBloc, CubePositionState>(
            bloc: bloc,
            builder: (context, state) => MyButton(
              onTapButton: () => bloc.add(IsDownMovingCubeEvent()),
              text: 'Ниже',
              isActive: bloc.isDownMovingPossible,
            ),
          ),
        ],
      ),
    );
  }
}
