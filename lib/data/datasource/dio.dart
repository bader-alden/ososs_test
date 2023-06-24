
import 'package:dio/dio.dart';
import 'package:ososs_test/utill/app_constans.dart';

class DioClient {
  static Dio? dio;
  static init() {
    dio = Dio(BaseOptions(
        baseUrl: AppConstants.BASE_URL,
        receiveDataWhenStatusError: true,
        followRedirects: true,
        validateStatus: (status) { return status! < 500;},
        headers: {'Content-Type': 'application/json','Accept':'application/json'}));
  }

  static Future<Response?> get_data({url, quary}) async {
    dio?.options.headers = { 'Accept':'application/json'};
    return await dio?.get(url,queryParameters: quary ??{});
  }

}

