part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}
class NameEvent extends HomeEvent{
  final String? value;

  NameEvent(this.value);
}
