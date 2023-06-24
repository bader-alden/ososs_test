import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ososs_test/helper/model/pokemon_modle.dart';
import 'package:ososs_test/utill/app_constans.dart';

import '../../helper/model/api_response.dart';
import '../../helper/repository/pokemon_repo.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc() : super(PokemonInitial()) {
    on<InitPokemonList>(initPokemonListVoid);
  }

  PokemonRepo pokemonRepo = PokemonRepo();
  int page_num = 0;
  List<PokemonModel> pokemonList = [];

  Future<void> initPokemonListVoid(InitPokemonList event, Emitter<PokemonState> emit) async {

    ApiResponse? apiResponse = await pokemonRepo.initPokemonRepo(page_num);

    if (apiResponse.response != null && apiResponse.response?.statusCode == 200) {
      page_num = page_num+AppConstants.NUMBER_OF_POKEMON_IN_REQUST;
      apiResponse.response?.data?["results"].forEach((e){
        pokemonList.add(PokemonModel.fromJson(e));
      });

      emit(ScssGetPokemon());

    }else{
      emit(ErrorGetPokemon());
    }

    }
}
