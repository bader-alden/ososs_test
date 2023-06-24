import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ososs_test/helper/model/square_type_model.dart';

import '../../utill/app_constans.dart';

part 'animations_event.dart';
part 'animations_state.dart';

class AnimationsBloc extends Bloc<AnimationsEvent, AnimationsState> {
  AnimationsBloc() : super(Page1Initial()) {
    square=SquareTypeModel.getSquare(SquareType.blueSquare);
    on<UpdateSquareEvent>(updateSquareVoid);
  }

  SquareTypeModel? square;

  FutureOr<void> updateSquareVoid(UpdateSquareEvent event, Emitter<AnimationsState> emit) {
    square = SquareTypeModel.getSquare(event.type);
    emit(Change_square_state());
  }

}
