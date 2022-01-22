import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  AuthEvent();

  @override
  List<Object?> get props => [];
}

class AuthenticationStarted extends AuthEvent {}

class LoggedIn extends AuthEvent {}

class LoggedOut extends AuthEvent {}
