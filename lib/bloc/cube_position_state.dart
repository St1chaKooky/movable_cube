// ignore_for_file: must_be_immutable

part of 'cube_position_bloc.dart';

@immutable
sealed class CubePositionState {}

final class CubePositionInitial extends CubePositionState {}

final class CubePositionIsUp extends CubePositionState {}

final class CubePositionIsDown extends CubePositionState {}

final class CubePositionIsLeft extends CubePositionState {}

final class CubePositionIsRight extends CubePositionState {}
