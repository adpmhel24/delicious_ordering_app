import 'package:dio/dio.dart';

import 'dio_setting.dart';

class LoginAPI {
  Dio dio = DioSettings().dio;

// Login Request
  Future<Response> loggedIn({
    required username,
    required password,
  }) async {
    Response response;

    try {
      response = await dio.get('/api/auth/login',
          queryParameters: {'username': username, 'password': password});
    } on DioError catch (e) {
      throw Exception(e.response!.data['message']);
    }
    return response;
  }

  ///Singleton factory
  static final LoginAPI _instance = LoginAPI._internal();

  factory LoginAPI() {
    return _instance;
  }

  LoginAPI._internal();
}
