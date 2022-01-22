import 'package:dio/dio.dart';

import 'dio_setting.dart';

class OrderAPI {
  Dio dio = DioSettings().dio;

  Future<Response> getMyOrders(
      {required String token, Map<String, dynamic>? params}) async {
    Response response;
    try {
      response = await dio.get('/api/ordering/get_by_user',
          queryParameters: params,
          options: Options(headers: {
            "Authorization": "Bearer " + token,
          }));
    } on DioError catch (e) {
      throw Exception(e.response!.data['message']);
    }
    return response;
  }

  Future<Response> postNewOrder(
      {required String token, required Map<String, dynamic> data}) async {
    Response response;
    try {
      response = await dio.post(
        '/api/ordering/new',
        data: data,
        options: Options(headers: {
          "Authorization": "Bearer " + token,
          "Content-Type": "application/json",
        }),
      );
    } on DioError catch (e) {
      throw Exception(e.response!.data['message']);
    }
    return response;
  }

  ///Singleton factory
  static final OrderAPI _instance = OrderAPI._internal();

  factory OrderAPI() {
    return _instance;
  }

  OrderAPI._internal();
}
