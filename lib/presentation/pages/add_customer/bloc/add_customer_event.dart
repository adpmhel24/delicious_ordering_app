import 'package:equatable/equatable.dart';

abstract class AddCustomerEvent extends Equatable {
  AddCustomerEvent();

  @override
  List<Object> get props => [];
}

class ChangeCustomerCode extends AddCustomerEvent {
  final String code;
  ChangeCustomerCode(this.code);
  @override
  List<Object> get props => [code];
}

class ChangeCustomerName extends AddCustomerEvent {
  final String name;
  ChangeCustomerName(this.name);
  @override
  List<Object> get props => [name];
}

class ChangeCustomerType extends AddCustomerEvent {
  final String custType;
  ChangeCustomerType(this.custType);
  @override
  List<Object> get props => [custType];
}

class ChangeCustAddress extends AddCustomerEvent {
  final String address;
  ChangeCustAddress(this.address);
  @override
  List<Object> get props => [address];
}

class ChangeCustContactNumber extends AddCustomerEvent {
  final String contactNumber;
  ChangeCustContactNumber(this.contactNumber);
  @override
  List<Object> get props => [contactNumber];
}

class PostNewCustomer extends AddCustomerEvent {}
