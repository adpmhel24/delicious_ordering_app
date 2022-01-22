import 'package:delicious_ordering/common_bloc/order_bloc/bloc.dart';
import 'package:delicious_ordering/data/repositories/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  OrderRepo _orderRepo = AppRepo.orderRepository;
  OrdersBloc() : super(OrdersInitState()) {
    on<FetchForConfirmOrders>(onFetchingForConfirmOrders);
    on<FetchForDeliveryOrders>(onFetchingForDelivery);
    on<FetchCompletedOrders>(onFetchingCompleted);
  }

  Future<void> onFetchingForConfirmOrders(
      FetchForConfirmOrders event, Emitter<OrdersState> emit) async {
    emit(LoadingOrdersForConfirm());
    try {
      await _orderRepo.fetchAllOrdersByUser(params: {"delivery_status": 0});
      emit(LoadedOrdersForConfirm(_orderRepo.orders));
    } on Exception catch (e) {
      emit(OrdersErrorState(e.toString()));
    }
  }

  void onFetchingForDelivery(
      FetchForDeliveryOrders event, Emitter<OrdersState> emit) async {
    emit(LoadingOrdersForDelivery());
    try {
      await _orderRepo.fetchAllOrdersByUser(params: {"delivery_status": 1});
      emit(LoadedOrdersForDelivery(_orderRepo.orders));
    } on Exception catch (e) {
      emit(OrdersErrorState(e.toString()));
    }
  }

  Future<void> onFetchingCompleted(
      FetchCompletedOrders event, Emitter<OrdersState> emit) async {
    emit(LoadingOrdersCompeted());
    try {
      await _orderRepo.fetchAllOrdersByUser(params: {"delivery_status": 3});
      emit(LoadedOrdersCompleted(_orderRepo.orders));
    } on Exception catch (e) {
      emit(OrdersErrorState(e.toString()));
    }
  }
}
