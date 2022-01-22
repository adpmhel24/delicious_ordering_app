import 'package:delicious_ordering/data/models/models.dart';
import 'package:delicious_ordering/data/repositories/repositories.dart';
import 'package:delicious_ordering/data/services/apis.dart';
import 'package:dio/dio.dart';

class DiscountTypeRepo {
  DiscountTypeAPI _discountTypeAPI = DiscountTypeAPI();
  AuthRepository _authRepository = AuthRepository();

  List<DiscTypeModel> _discTypes = [];

  List<DiscTypeModel> get discTypes => [..._discTypes];

  Future<void> fetchDiscType() async {
    Response response;
    try {
      response = await _discountTypeAPI.getAllDiscType(
          token: _authRepository.currentUser.token);
      if (response.statusCode == 200) {
        _discTypes = List<DiscTypeModel>.from(
            response.data['data'].map((i) => DiscTypeModel.fromJson(i)));
      } else {
        throw Exception(response.data['message']);
      }
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  List<DiscTypeModel> getSuggestions(String description) {
    return _discTypes
        .where((e) =>
            e.description.toLowerCase().contains(description.toLowerCase()))
        .toList();
  }

  ///Singleton factory
  static final DiscountTypeRepo _instance = DiscountTypeRepo._internal();

  factory DiscountTypeRepo() {
    return _instance;
  }

  DiscountTypeRepo._internal();
}
