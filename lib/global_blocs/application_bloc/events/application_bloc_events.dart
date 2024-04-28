import 'package:equatable/equatable.dart';

class ApplicationBlocEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialiseApplicationEvent extends ApplicationBlocEvent {
  InitialiseApplicationEvent() : super();
}

class FetchUserLocationEvent extends ApplicationBlocEvent {
  FetchUserLocationEvent() : super();
}

class OpenLocationSettingsEvent extends ApplicationBlocEvent {
  OpenLocationSettingsEvent() : super();
}
