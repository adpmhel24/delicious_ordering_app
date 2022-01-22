import 'package:delicious_ordering/data/models/models.dart';
import 'package:equatable/equatable.dart';

abstract class OrdersState extends Equatable {
  OrdersState();
  @override
  List<Object?> get props => [];
}

class OrdersInitState extends OrdersState {}

class LoadingOrdersForConfirm extends OrdersState {}

class LoadingOrdersForDelivery extends OrdersState {}

class LoadingOrdersCompeted extends OrdersState {}

class LoadedOrdersForConfirm extends OrdersState {
  final List<OrderModel> orders;

  LoadedOrdersForConfirm(this.orders);

  @override
  List<Object?> get props => [orders];
}

class LoadedOrdersForDelivery extends OrdersState {
  final List<OrderModel> orders;

  LoadedOrdersForDelivery(this.orders);

  @override
  List<Object?> get props => [orders];
}

class LoadedOrdersCompleted extends OrdersState {
  final List<OrderModel> orders;

  LoadedOrdersCompleted(this.orders);

  @override
  List<Object?> get props => [orders];
}

class OrdersErrorState extends OrdersState {
  final String message;

  OrdersErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
