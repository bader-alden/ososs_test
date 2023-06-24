part of 'pokemon_bloc.dart';

@immutable
abstract class PokemonState {}

class PokemonInitial extends PokemonState {}
class ScssGetPokemon extends PokemonState {}
class ErrorGetPokemon extends PokemonState {}
