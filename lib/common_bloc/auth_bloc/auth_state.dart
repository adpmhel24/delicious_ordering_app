import 'package:delicious_ordering/data/models/auth_user/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  AuthState();

  @override
  List<Object> get props => [];
}

class Unintialized extends AuthState {}

class Authenticated extends AuthState {
  final UserModel loggedUser;

  Authenticated(this.loggedUser);

  @override
  List<Object> get props => [loggedUser];

  @override
  String toString() {
    return 'Authenticated{username: ${loggedUser.fullname}}';
  }
}

class Unauthenticated extends AuthState {}
