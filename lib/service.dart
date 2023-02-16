import 'package:dio/dio.dart';
import 'package:maxway_flutter/Model.dart';

class MaxWayApi {
  final Dio _dio;

  MaxWayApi(this._dio);

  Future<MaxWay> getData() async {
    var response = await _dio.get("/uz.json");
    final res = MaxWay.fromJson(response.data);
    return res;
  }

}
