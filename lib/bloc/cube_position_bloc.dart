import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cube_position_event.dart';
part 'cube_position_state.dart';

class CubePositionBloc extends Bloc<CubePositionEvent, CubePositionState> {
  // Это должно быть в состоянии
  double currentPositionX = 1;
  double currentPositionY = 1;

  bool isUpMovingPossible = true;
  bool isLeftMovingPossible = true;
  bool isDownMovingPossible = true;
  bool isRightMovingPossible = true;
  CubePositionBloc() : super(CubePositionInitial()) {
    on<IsUpMovingCubeEvent>((event, emit) {
      if (currentPositionY != 2) {
        currentPositionY += 1;
      }
      isDownMovingPossible = true;
      if (currentPositionY == 2) {
        isUpMovingPossible = false;
      } else {
        isUpMovingPossible = true;
      }
      emit(CubePositionIsUp());
    });

    on<IsDownMovingCubeEvent>((event, emit) {
      if (currentPositionY != 0) {
        currentPositionY -= 1;
      }
      isUpMovingPossible = true;
      if (currentPositionY == 0) {
        isDownMovingPossible = false;
      } else {
        isDownMovingPossible = true;
      }
      emit(CubePositionIsDown());
    });

    on<IsLeftMovingCubeEvent>((event, emit) {
      if (currentPositionX != 0) {
        currentPositionX -= 1;
      }
      isRightMovingPossible = true;
      if (currentPositionX == 0) {
        isLeftMovingPossible = false;
      } else {
        isLeftMovingPossible = true;
      }
      emit(CubePositionIsLeft());
    });

    on<IsRightMovingCubeEvent>((event, emit) {
      if (currentPositionX != 2) {
        currentPositionX += 1;
      }
      isLeftMovingPossible = true;
      if (currentPositionX == 2) {
        isRightMovingPossible = false;
      } else {
        isRightMovingPossible = true;
      }
      emit(CubePositionIsRight());
    });
  }
}
