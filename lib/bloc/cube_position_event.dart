part of 'cube_position_bloc.dart';

@immutable
sealed class CubePositionEvent {}

final class IsUpMovingCubeEvent extends CubePositionEvent {}

final class IsDownMovingCubeEvent extends CubePositionEvent {}

final class IsLeftMovingCubeEvent extends CubePositionEvent {}

final class IsRightMovingCubeEvent extends CubePositionEvent {}
