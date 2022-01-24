import 'package:delicious_ordering/data/services/interceptors.dart';
import 'package:dio/dio.dart';

class DioSettings {
  final String url;

  Dio dio() {
    return Dio(
      BaseOptions(baseUrl: this.url),
    )..interceptors.add(Logging());
  }

  DioSettings(this.url);
}
