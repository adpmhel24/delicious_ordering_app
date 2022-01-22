import 'package:dio/dio.dart';

import 'dio_setting.dart';

class SalesTypeAPI {
  Dio dio = DioSettings().dio;

  Future<Response> getAllSalesType({required String token}) async {
    Response response;
    try {
      response = await dio.get('/api/sales/type/get_all',
          options: Options(headers: {
            "Authorization": "Bearer " + token,
          }));
    } on DioError catch (e) {
      throw Exception(e.response!.data['message']);
    }
    return response;
  }

  ///Singleton factory
  static final SalesTypeAPI _instance = SalesTypeAPI._internal();

  factory SalesTypeAPI() {
    return _instance;
  }

  SalesTypeAPI._internal();
}
