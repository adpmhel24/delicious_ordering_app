import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:delicious_ordering/data/models/auth_user/user_model.dart';
import 'package:delicious_ordering/data/services/apis.dart';
import 'package:dio/dio.dart';

class AuthRepository {
  LoginAPI _loginAPI = LoginAPI();
  UserModel? _currentUser;

  UserModel get currentUser => _currentUser!;

  Future<void> loginWithCredentials(
      {required String username, required String password}) async {
    Response response;
    try {
      response =
          await _loginAPI.loggedIn(username: username, password: password);
      if (response.statusCode == 200) {
        _currentUser = UserModel.fromJson(response.data['data']);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("userData", json.encode(_currentUser!.toJson()));
      } else {
        throw Exception(response.data['message']);
      }
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  bool isLoggedIn() => _currentUser != null;

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await Future.delayed(const Duration(milliseconds: 500));
    prefs.remove("userData");
    _currentUser = null;
  }

  ///Singleton factory
  static final AuthRepository _instance = AuthRepository._internal();

  factory AuthRepository() {
    return _instance;
  }

  AuthRepository._internal();
}
