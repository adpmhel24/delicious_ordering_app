import 'package:delicious_ordering/data/services/dio_setting.dart';
import 'package:dio/dio.dart';

class ItemAPI {
  Dio dio = DioSettings().dio;

  Future<Response> getAllItem({
    required String token,
  }) async {
    Response response;
    try {
      response = await dio.get('/api/item/getall',
          options: Options(headers: {
            "Authorization": "Bearer " + token,
          }));
    } on DioError catch (e) {
      throw Exception(e.response!.data['message']);
    }
    return response;
  }

  ///Singleton factory
  static final ItemAPI _instance = ItemAPI._internal();

  factory ItemAPI() {
    return _instance;
  }

  ItemAPI._internal();
}
