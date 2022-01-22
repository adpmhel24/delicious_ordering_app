import 'package:delicious_ordering/data/models/models.dart';
import 'package:equatable/equatable.dart';

abstract class CustomerState extends Equatable {
  CustomerState();

  @override
  List<Object?> get props => [];
}

class CustomerInitState extends CustomerState {}

class EmptyState extends CustomerState {}

class CustomerLoadingState extends CustomerState {}

class CustomerLoadedState extends CustomerState {
  final List<CustomerModel> customers;
  CustomerLoadedState(this.customers);

  @override
  List<Object?> get props => [customers];
}

class ErrorState extends CustomerState {
  final String message;
  ErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
