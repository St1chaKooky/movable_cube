import 'package:flutter/material.dart';
import 'package:movable_cube/utils/colors.dart';

class MyCubeWidget extends StatelessWidget {
  final double x;
  final double y;
  const MyCubeWidget({super.key, required this.x, required this.y});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Positioned(
      bottom: 200 / 2 * y - 20 * y,
      left: screenWidth / 2 * x - 20 * x,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: MyColors.blackColor,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}
