import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class OrderCustDetailsEvent extends Equatable {
  OrderCustDetailsEvent();
  @override
  List<Object> get props => [];
}

class ChangeCustType extends OrderCustDetailsEvent {
  final TextEditingController custType;

  ChangeCustType(this.custType);

  @override
  List<Object> get props => [custType];
}

class ChangeCustCode extends OrderCustDetailsEvent {
  final TextEditingController custCode;
  final int? customerId;

  ChangeCustCode({this.customerId, required this.custCode});
  @override
  List<Object> get props => [custCode];
}

class ChangeContactNumber extends OrderCustDetailsEvent {
  final TextEditingController contactNum;

  ChangeContactNumber(this.contactNum);
  @override
  List<Object> get props => [contactNum];
}

class ChangeAddress extends OrderCustDetailsEvent {
  final TextEditingController address;

  ChangeAddress(this.address);
  @override
  List<Object> get props => [address];
}
