import 'package:delicious_ordering/data/models/models.dart';
import 'package:delicious_ordering/data/repositories/app_repo.dart';
import 'package:delicious_ordering/data/repositories/auth_repo.dart';
import 'package:delicious_ordering/data/services/customer_api.dart';
import 'package:dio/dio.dart';

class CustomerTypeRepo {
  List<CustomerTypeModel> _customerTypes = [];
  AuthRepository _authRepository = AppRepo.authRepository;
  CustomerAPI _customerAPI = CustomerAPI();

  Future<void> fetchCustomerType() async {
    Response response;
    try {
      response = await _customerAPI.getAllCustomerType(
          token: _authRepository.currentUser.token);
      if (response.statusCode == 200) {
        _customerTypes = List<CustomerTypeModel>.from(
            response.data['data'].map((e) => CustomerTypeModel.fromJson(e)));
      }
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  List<CustomerTypeModel> get customerTypes => [..._customerTypes];

  ///Singleton factory
  static final CustomerTypeRepo _instance = CustomerTypeRepo._internal();

  factory CustomerTypeRepo() {
    return _instance;
  }

  CustomerTypeRepo._internal();
}
