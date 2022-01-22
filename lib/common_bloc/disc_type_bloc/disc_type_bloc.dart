import 'package:delicious_ordering/common_bloc/disc_type_bloc/bloc.dart';
import 'package:delicious_ordering/data/repositories/app_repo.dart';
import 'package:delicious_ordering/data/repositories/disc_type_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiscTypeBloc extends Bloc<DiscTypeEvent, DiscTypeState> {
  DiscountTypeRepo _discountTypeRepo = AppRepo.discTypeRepository;
  DiscTypeBloc() : super(DiscTypeInitState()) {
    on<FetchDiscTypeFromLocal>(onFetchFromLocal);
    on<FetchDiscTypeFromAPI>(onFetchFromAPI);
  }

  void onFetchFromLocal(
      FetchDiscTypeFromLocal event, Emitter<DiscTypeState> emit) async {
    emit(DiscTypeLoadingState());
    try {
      if (_discountTypeRepo.discTypes.isEmpty) {
        await _discountTypeRepo.fetchDiscType();
      }
    } on Exception catch (e) {
      emit(DiscTypeError(e.toString()));
    }
    emit(DiscTypeLoadedState(_discountTypeRepo.discTypes));
  }

  void onFetchFromAPI(
      FetchDiscTypeFromAPI event, Emitter<DiscTypeState> emit) async {
    emit(DiscTypeLoadingState());
    try {
      await _discountTypeRepo.fetchDiscType();
    } on Exception catch (e) {
      emit(DiscTypeError(e.toString()));
    }
    emit(DiscTypeLoadedState(_discountTypeRepo.discTypes));
  }
}
