import 'package:delicious_ordering/data/models/models.dart';
import 'package:delicious_ordering/data/repositories/app_repo.dart';
import 'package:delicious_ordering/data/repositories/auth_repo.dart';
import 'package:delicious_ordering/data/services/apis.dart';
import 'package:dio/dio.dart';

class SalesTypeRepo {
  List<SalesTypeModel> _salesTypes = [];
  SalesTypeAPI _salesTypeAPI = SalesTypeAPI();
  AuthRepository _authRepository = AppRepo.authRepository;

  List<SalesTypeModel> get salesType => [..._salesTypes];

  Future<void> fetchFromAPI() async {
    Response response;

    try {
      response = await _salesTypeAPI.getAllSalesType(
          token: _authRepository.currentUser.token);
      if (response.statusCode == 200) {
        _salesTypes = List<SalesTypeModel>.from(
            response.data['data'].map((i) => SalesTypeModel.fromJson(i)));
      } else {
        throw Exception(response.data['message']);
      }
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  ///Singleton factory
  static final SalesTypeRepo _instance = SalesTypeRepo._internal();

  factory SalesTypeRepo() {
    return _instance;
  }

  SalesTypeRepo._internal();
}
