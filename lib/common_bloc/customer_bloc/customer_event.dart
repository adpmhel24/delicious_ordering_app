import 'package:equatable/equatable.dart';

abstract class CustomerEvent extends Equatable {
  CustomerEvent();
  @override
  List<Object?> get props => [];
}

class FetchCustomerFromLocal extends CustomerEvent {}

class FetchCustomerFromAPI extends CustomerEvent {}

class CustomerSearchByKeyword extends CustomerEvent {
  final String keyword;

  CustomerSearchByKeyword(this.keyword);
  @override
  List<Object?> get props => [keyword];
}

class FilterCustomerByCustType extends CustomerEvent {
  final int custType;
  FilterCustomerByCustType(this.custType);
  @override
  List<Object?> get props => [custType];
}
