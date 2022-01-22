import 'package:delicious_ordering/data/repositories/repositories.dart';
import 'package:delicious_ordering/presentation/pages/ordering/components/customer_order_details/bloc/bloc.dart';
import 'package:delicious_ordering/presentation/widgets/text_field_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class OrderCustDetailsBloc
    extends Bloc<OrderCustDetailsEvent, OrderCustDetailsState> {
  CheckOutRepo _checkOutRepo = AppRepo.checkOutRepository;
  OrderCustDetailsBloc() : super(OrderCustDetailsState()) {
    on<ChangeCustType>(onCustTypeChange);
    on<ChangeCustCode>(onCustCodeChange);
    on<ChangeContactNumber>(onContactNumChange);
    on<ChangeAddress>(onAddressChange);
  }

  void onCustTypeChange(
      ChangeCustType event, Emitter<OrderCustDetailsState> emit) {
    final custType = TextFieldModel.dirty(event.custType);
    emit(state.copyWith(
      custType: custType,
      status: Formz.validate([
        custType,
        state.custCode,
        state.contactNumber,
        state.address,
      ]),
    ));
    _checkOutRepo.checkoutData.custType = event.custType;
  }

  void onCustCodeChange(
      ChangeCustCode event, Emitter<OrderCustDetailsState> emit) {
    final custCode = TextFieldModel.dirty(event.custCode);
    emit(state.copyWith(
      custCode: custCode,
      status: Formz.validate([
        state.custType,
        custCode,
        state.contactNumber,
        state.address,
      ]),
    ));
    _checkOutRepo.checkoutData.custCode = event.custCode;
  }

  void onContactNumChange(
      ChangeContactNumber event, Emitter<OrderCustDetailsState> emit) {
    final contactNumber = TextFieldModel.dirty(event.contactNum.text);
    emit(state.copyWith(
      contactNumber: contactNumber,
      status: Formz.validate([
        state.custType,
        state.custCode,
        contactNumber,
        state.address,
      ]),
    ));
    _checkOutRepo.checkoutData.contactNumber = event.contactNum.text;
  }

  void onAddressChange(
      ChangeAddress event, Emitter<OrderCustDetailsState> emit) {
    final address = TextFieldModel.dirty(event.address.text);
    emit(state.copyWith(
      address: address,
      status: Formz.validate([
        state.custType,
        state.custCode,
        state.contactNumber,
        address,
      ]),
    ));
    _checkOutRepo.checkoutData.address = event.address.text;
  }
}
