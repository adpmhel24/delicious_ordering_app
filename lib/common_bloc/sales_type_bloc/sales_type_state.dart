import 'package:delicious_ordering/data/models/models.dart';
import 'package:equatable/equatable.dart';

abstract class SalesTypeState extends Equatable {
  SalesTypeState();

  @override
  List<Object?> get props => [];
}

class InitState extends SalesTypeState {}

class LoadingState extends SalesTypeState {}

class SalesTypeLoadedState extends SalesTypeState {
  final List<SalesTypeModel> salesTypes;

  SalesTypeLoadedState(this.salesTypes);

  @override
  List<Object?> get props => [salesTypes];
}

class ErrorState extends SalesTypeState {
  final String message;

  ErrorState(this.message);
  @override
  List<Object?> get props => [message];
}
