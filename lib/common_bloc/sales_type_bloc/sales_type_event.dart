import 'package:equatable/equatable.dart';

abstract class SalesTypeEvent extends Equatable {
  SalesTypeEvent();

  @override
  List<Object?> get props => [];
}

class FetchSalesTypeFromAPI extends SalesTypeEvent {}

class FetchSalesTypeFromLocal extends SalesTypeEvent {}
