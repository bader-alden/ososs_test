import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<NameEvent>(change_name);
  }

  String? name_text;


  FutureOr<void> change_name(NameEvent event, Emitter<HomeState> emit) {
    name_text=event.value;
    emit(NameState());
  }
}
