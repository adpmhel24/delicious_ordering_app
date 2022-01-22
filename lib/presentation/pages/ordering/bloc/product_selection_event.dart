import 'package:delicious_ordering/data/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class ProductSelectionEvent extends Equatable {
  ProductSelectionEvent();

  @override
  List<Object?> get props => [];
}

class QuantityChanged extends ProductSelectionEvent {
  final TextEditingController quantityController;
  final TextEditingController unitPriceController;
  final TextEditingController totalController;

  QuantityChanged(
      {required this.quantityController,
      required this.unitPriceController,
      required this.totalController});

  @override
  List<Object> get props =>
      [quantityController, unitPriceController, totalController];
}

// class DiscPercentageChanged extends ProductSelectionEvent {
//   final TextEditingController quantityController;
//   final TextEditingController unitPriceController;
//   final TextEditingController discPercentageController;
//   final TextEditingController discAmountController;
//   final TextEditingController totalController;

//   DiscPercentageChanged({
//     required this.quantityController,
//     required this.unitPriceController,
//     required this.discPercentageController,
//     required this.discAmountController,
//     required this.totalController,
//   });

//   @override
//   List<Object> get props => [
//         quantityController,
//         unitPriceController,
//         discPercentageController,
//         discAmountController,
//         totalController,
//       ];
// }

class PriceChanged extends ProductSelectionEvent {
  final String price;

  PriceChanged(this.price);

  @override
  List<Object> get props => [price];
}

class TotalChanged extends ProductSelectionEvent {
  final String total;

  TotalChanged(
    this.total,
  );

  @override
  List<Object?> get props => [total];
}

class UndoCart extends ProductSelectionEvent {
  final CartItem cartItem;

  UndoCart(this.cartItem);

  @override
  List<Object?> get props => [cartItem];
}

class AddingToCart extends ProductSelectionEvent {
  final CartItem cartItem;

  AddingToCart(this.cartItem);

  @override
  List<Object?> get props => [cartItem];
}
