import 'package:delicious_ordering/data/models/customer_type/customer_type_model.dart';
import 'package:equatable/equatable.dart';

abstract class CustTypeState extends Equatable {
  CustTypeState();

  @override
  List<Object> get props => [];
}

class CustTypeInitState extends CustTypeState {}

class CustTypeLoadingState extends CustTypeState {}

class CustTypeLoadedState extends CustTypeState {
  final List<CustomerTypeModel> custTypes;

  CustTypeLoadedState(this.custTypes);
  @override
  List<Object> get props => [custTypes];
}

class CusTypeErrorState extends CustTypeState {
  final String message;
  CusTypeErrorState(this.message);

  @override
  List<Object> get props => [message];
}
