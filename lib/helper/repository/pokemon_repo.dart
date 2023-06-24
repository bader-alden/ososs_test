import 'package:dio/dio.dart';

import '../../data/datasource/dio.dart';
import '../../utill/app_constans.dart';
import '../model/api_response.dart';

class PokemonRepo {



  Future<ApiResponse> initPokemonRepo( int offset) async {
     try {
       Response? response = await DioClient.get_data(
           url: AppConstants.INIT_POKEMON_LIST_LINK,
           quary: {
             "offset": offset,
             "limit": AppConstants.NUMBER_OF_POKEMON_IN_REQUST
           }
       );
       return ApiResponse.withSuccess(response!);
     }catch (e){
       return ApiResponse.withError("error in connect to server");
     }
  }
}