
import 'package:flutter/material.dart';
import 'package:ososs_test/utill/color_resources.dart';

import '../../utill/app_constans.dart';

class SquareTypeModel{
  late double round;
  late double smallRound;
  late Color color;

  SquareTypeModel.getSquare(SquareType input){

      switch (input) {

        case SquareType.blueSquare:
          round=0;
          smallRound=0;
          color=ColorResources.SQUARE_TYPE_BLUE;
          break;

        case SquareType.skyBlueSquare:
          round=50;
          smallRound=15;
          color=ColorResources.SQUARE_TYPE_SKYBLUE;
          break;

        case SquareType.redSquare:
          round=200;
          smallRound=200;
          color=ColorResources.SQUARE_TYPE_RED;
          break;

      }}
}
