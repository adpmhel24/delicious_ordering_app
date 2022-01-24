import 'package:equatable/equatable.dart';

abstract class AppInitState extends Equatable {
  AppInitState();
  @override
  List<Object?> get props => [];
}

class OpeningAppState extends AppInitState {}

class NoURLState extends AppInitState {}

class AddedNewURlState extends AppInitState {
  final String url;
  AddedNewURlState(this.url);
  @override
  List<Object> get props => [url];
}
