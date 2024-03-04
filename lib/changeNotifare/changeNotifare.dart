import 'package:flutter/material.dart';

class CurrentPositionState extends ChangeNotifier {
  double _currentPositionX;
  double _currentPositionY;

  bool _isUpMovingPossible;
  bool _isLeftMovingPossible;
  bool _isDownMovingPossible;
  bool _isRightMovingPossible;

  CurrentPositionState(this._currentPositionX,this._currentPositionY,this._isDownMovingPossible,this._isLeftMovingPossible,this._isRightMovingPossible,this._isUpMovingPossible);
  
  double get currentPositionX => _currentPositionX;
  double get currentPositionY => _currentPositionY;

  bool get isUpMovingPossible => _isUpMovingPossible;
  bool get isLeftMovingPossible => _isLeftMovingPossible;
  bool get isDownMovingPossible => _isDownMovingPossible;
  bool get isRightMovingPossible => _isRightMovingPossible;


  void isUpMoving() {
    if (_currentPositionY != 2) {
      _currentPositionY += 1;
    }
    _isDownMovingPossible = true;
      if (currentPositionY == 2) {
        _isUpMovingPossible = false;
      } else {
        _isUpMovingPossible = true;
      }
    notifyListeners();
  }

  void isLeftMoving() {
    if (_currentPositionX != 0) {
      _currentPositionX -= 1;
    }
    _isRightMovingPossible = true;
      if (currentPositionX == 0) {
        _isLeftMovingPossible = false;
      } else {
        _isLeftMovingPossible = true;
      }
    notifyListeners();
    
  }

  void isRightMoving() {
    if (_currentPositionX != 2) {
      _currentPositionX += 1;
    }
    _isLeftMovingPossible = true;
      if (currentPositionX == 2) {
        _isRightMovingPossible = false;
      } else {
        _isRightMovingPossible = true;
      }
    notifyListeners();
    
  }

  void isDownMoving() {
    if (_currentPositionY != 0) {
      _currentPositionY -= 1;
    }
    _isUpMovingPossible = true;
      if (currentPositionY == 0) {
        _isDownMovingPossible = false;
      } else {
        _isDownMovingPossible = true;
      }
    notifyListeners();
    
  }
  
}