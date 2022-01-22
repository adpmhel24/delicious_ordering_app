import 'package:equatable/equatable.dart';

abstract class DiscTypeEvent extends Equatable {
  DiscTypeEvent();

  @override
  List<Object?> get props => [];
}

class FetchDiscTypeFromAPI extends DiscTypeEvent {}

class FetchDiscTypeFromLocal extends DiscTypeEvent {}
