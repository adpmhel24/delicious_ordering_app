import 'package:delicious_ordering/common_bloc/cart_bloc/bloc.dart';
import 'package:delicious_ordering/data/repositories/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartRepo _cartRepo = AppRepo.cartRepository;
  CartBloc() : super(CartLoading()) {
    on<LoadCart>(onLoadCart);
    on<ClearCart>(onClearCart);
    on<RemoveItemFromCart>(onRemoveFromCart);
    on<UpdateDiscount>(onUpdateDiscount);
    on<UpdateDeliveryFee>(onUpdateDelfee);
    on<UpdateTenderedAmount>(onUpdateTenderedAmnt);
  }

  void onLoadCart(LoadCart event, Emitter<CartState> emit) {
    emit(CartLoading());
    try {
      if (_cartRepo.cartItemsCount > 0) {
        emit(CartLoaded(_cartRepo.cartItems));
      } else {
        emit(EmptyCart());
      }
    } on Exception catch (e) {
      emit(CartError(e.toString()));
    }
  }

  void onClearCart(ClearCart event, Emitter<CartState> emit) async {
    emit(CartLoading());
    await _cartRepo.clearCart();
    emit(EmptyCart());
  }

  void onRemoveFromCart(
      RemoveItemFromCart event, Emitter<CartState> emit) async {
    emit(CartLoading());
    await _cartRepo.deleteFromCart(event.cartItem);
    emit(CartLoaded(_cartRepo.cartItems));
  }

  void onUpdateDiscount(UpdateDiscount event, Emitter<CartState> emit) {
    _cartRepo.changeDiscount(event.discount);
    emit(CartUpdateDiscountState(_cartRepo.discount.toString()));
  }

  void onUpdateDelfee(UpdateDeliveryFee event, Emitter<CartState> emit) {
    _cartRepo.changeDelfee(event.delfee);
    emit(CartUpdateDelFeeState(_cartRepo.delfee.toString()));
  }

  void onUpdateTenderedAmnt(
    UpdateTenderedAmount event,
    Emitter<CartState> emit,
  ) {
    _cartRepo.changeTenderedAmnt(event.tenderedAmount);
    emit(CartUpdateTenderedAmountState(_cartRepo.tenderedAmnt.toString()));
  }
}
