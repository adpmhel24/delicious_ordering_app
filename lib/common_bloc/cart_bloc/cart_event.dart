import 'package:delicious_ordering/data/models/cart/cart_item_model.dart';
import 'package:equatable/equatable.dart';

abstract class CartEvent extends Equatable {
  CartEvent();

  @override
  List<Object?> get props => [];
}

class LoadCart extends CartEvent {}

class ClearCart extends CartEvent {}

class RemoveItemFromCart extends CartEvent {
  final CartItem cartItem;

  RemoveItemFromCart(this.cartItem);

  @override
  List<Object?> get props => [cartItem];
}

class UpdateItemInCart extends CartEvent {}

class UpdateDiscount extends CartEvent {
  final double discount;

  UpdateDiscount(this.discount);

  @override
  List<Object?> get props => [discount];
}

class UpdateDeliveryFee extends CartEvent {
  final double delfee;
  UpdateDeliveryFee(this.delfee);

  @override
  List<Object?> get props => [delfee];
}

class UpdateTenderedAmount extends CartEvent {
  final double tenderedAmount;
  UpdateTenderedAmount(this.tenderedAmount);

  @override
  List<Object?> get props => [tenderedAmount];
}
