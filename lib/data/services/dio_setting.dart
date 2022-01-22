import 'package:delicious_ordering/data/services/interceptors.dart';
import 'package:dio/dio.dart';

import 'api_defaults.dart';

class DioSettings {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: APIDefaults.uri),
  )..interceptors.add(Logging());

  Dio get dio => _dio;

  ///Singleton factory
  static final DioSettings _instance = DioSettings._internal();

  factory DioSettings() {
    return _instance;
  }

  DioSettings._internal();
}
