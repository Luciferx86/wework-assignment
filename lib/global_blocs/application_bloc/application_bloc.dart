import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wework/enums/application_error_type.dart';
import 'package:wework/enums/application_status.dart';
import 'package:wework/enums/location_error.dart';
import 'package:wework/global_blocs/application_bloc/events/application_bloc_events.dart';
import 'package:wework/global_blocs/application_bloc/state/application_state.dart';
import 'package:wework/models/user_location.dart';
import 'package:wework/global_blocs/application_bloc/repo/application_repo.dart';

class ApplicationBloc extends Bloc<ApplicationBlocEvent, ApplicationState> {
  final ApplicationRepo applicationRepo;

  ApplicationBloc({required this.applicationRepo})
      : super(const ApplicationState()) {
    on<InitialiseApplicationEvent>(_mapInitialiseApplicationEventToState);
    on<FetchUserLocationEvent>(_mapFetchUserLocationEventToState);
    on<OpenLocationSettingsEvent>(_mapOpenLocationSettingsEventToState);
    on<LoadCachedDataEvent>(_mapLoadCachedDataEventToState);
  }

  void _mapInitialiseApplicationEventToState(
    InitialiseApplicationEvent event,
    Emitter<ApplicationState> emit,
  ) async {
    emit(state.copyWith(
      status: ApplicationStatus.loading,
    ));
    bool internetConnected = await applicationRepo.checkConnectivity();
    if (internetConnected) {
      add(FetchUserLocationEvent());
    } else {
      emit(state.copyWith(
        status: ApplicationStatus.error,
        applicationError: ApplicationErrorType.no_internet,
      ));
    }
  }

  void _mapFetchUserLocationEventToState(
    FetchUserLocationEvent event,
    Emitter<ApplicationState> emit,
  ) async {
    try {
      final userLocation = await applicationRepo.getUserLocation();
      emit(state.copyWith(
        userLocation: userLocation,
        status: ApplicationStatus.success,
      ));
    } catch (e) {
      emit(state.copyWith(
        locationError: e is LocationError ? e : null,
        applicationError: ApplicationErrorType.location_error,
        status: ApplicationStatus.error,
      ));
    }
  }

  void _mapOpenLocationSettingsEventToState(
    OpenLocationSettingsEvent event,
    Emitter<ApplicationState> emit,
  ) async {
    applicationRepo.openApplicationSettings();
  }

  void _mapLoadCachedDataEventToState(
    LoadCachedDataEvent event,
    Emitter<ApplicationState> emit,
  ) {
    emit(state.copyWith(
      userLocation: const UserLocation(
        mainAddress: "Unknown",
        subAddress: "Unknown",
      ),
      status: ApplicationStatus.success,
    ));
  }
}
