part of 'animations_bloc.dart';

@immutable
abstract class AnimationsEvent {}
class UpdateSquareEvent extends AnimationsEvent{
  final SquareType type;

  UpdateSquareEvent(this.type);
}