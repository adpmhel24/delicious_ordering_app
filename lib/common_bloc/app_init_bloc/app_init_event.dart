import 'package:equatable/equatable.dart';

abstract class AppInitEvent extends Equatable {
  AppInitEvent();
  @override
  List<Object?> get props => [];
}

class OpeningApp extends AppInitEvent {}

class AddingNewURL extends AppInitEvent {
  final String url;

  AddingNewURL(this.url);
  @override
  List<Object> get props => [url];
}
