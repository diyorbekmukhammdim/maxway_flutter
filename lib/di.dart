import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:maxway_flutter/service.dart';




final GetIt get = GetIt.instance;

void setUp() {
  get.registerLazySingleton(()=>Dio(BaseOptions(baseUrl: "https://maxway.uz/_next/data/ch7KmKvJ5azfPmlISTmjb/")));
  get.registerLazySingleton(()=>MaxWayApi(get.get<Dio>()));
}
