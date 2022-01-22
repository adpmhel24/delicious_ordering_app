import 'package:equatable/equatable.dart';

abstract class CheckOutEvent extends Equatable {
  CheckOutEvent();

  @override
  List<Object?> get props => [];
}

class DeliveryDateChange extends CheckOutEvent {
  final String deliveryDate;

  DeliveryDateChange(this.deliveryDate);
  @override
  List<Object?> get props => [deliveryDate];
}

class CheckOutNotesChange extends CheckOutEvent {
  final String notes;
  CheckOutNotesChange(this.notes);
  @override
  List<Object?> get props => [notes];
}

class DeliveryMethodChange extends CheckOutEvent {
  final String deliveryMethod;
  DeliveryMethodChange(this.deliveryMethod);
  @override
  List<Object?> get props => [deliveryMethod];
}

class PaymentMethodChange extends CheckOutEvent {
  final String paymentMethod;
  PaymentMethodChange(this.paymentMethod);
  @override
  List<Object?> get props => [paymentMethod];
}

class ProceedCheckOut extends CheckOutEvent {}
