import 'package:flutter/material.dart';
import 'package:ososs_test/helper/model/square_type_model.dart';
import 'package:ososs_test/utill/Dimensions.dart';
import '../../../../utill/app_constans.dart';



class SquareShape extends StatelessWidget{
final void Function(SquareType) onTap ;
  const SquareShape({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          squareWidget(SquareType.blueSquare,onTap),
          squareWidget(SquareType.skyBlueSquare,onTap),
          squareWidget(SquareType.redSquare,onTap),
      ],),
    );
  }
}
Widget squareWidget(SquareType type,onTap){
  SquareTypeModel model = SquareTypeModel.getSquare(type);
  return  InkWell(
      onTap: ()=>onTap.call(type),
      child: Container(
        padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
        height: 75,
        width: 75,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(model.smallRound),color: model.color),));
}