import 'package:delicious_ordering/data/services/dio_setting.dart';
import 'package:dio/dio.dart';

class DiscountTypeAPI {
  Dio dio = DioSettings().dio;

  Future<Response> getAllDiscType({required String token}) async {
    Response response;
    try {
      response = await dio.get(
        '/api/disc_type/get_all',
        options: Options(headers: {
          "Authorization": "Bearer " + token,
        }),
      );
    } on DioError catch (e) {
      throw Exception(e.response!.data['message']);
    }
    return response;
  }

  ///Singleton factory
  static final DiscountTypeAPI _instance = DiscountTypeAPI._internal();

  factory DiscountTypeAPI() {
    return _instance;
  }

  DiscountTypeAPI._internal();
}
