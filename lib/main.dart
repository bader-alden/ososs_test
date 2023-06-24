import 'package:flutter/cupertino.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:ososs_test/data/datasource/dio.dart';
import 'package:ososs_test/view/screen/home/home.dart';

main() async {
 var widgetsBinding= WidgetsFlutterBinding.ensureInitialized();
  await DioClient.init();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Future.delayed(const Duration(seconds: 3)).then((value) =>  FlutterNativeSplash.remove());
  runApp(const Home());
}