import 'package:equatable/equatable.dart';
import 'package:wework/enums/application_error_type.dart';
import 'package:wework/enums/application_status.dart';
import 'package:wework/enums/location_error.dart';
import 'package:wework/models/user_location.dart';

class ApplicationState extends Equatable {
  final UserLocation? userLocation;
  final LocationError? locationError;
  final ApplicationErrorType? applicationError;
  final ApplicationStatus status;
  const ApplicationState({
    this.userLocation,
    this.status = ApplicationStatus.initial,
    this.locationError,
    this.applicationError,
  });

  ApplicationState copyWith({
    UserLocation? userLocation,
    ApplicationStatus? status,
    LocationError? locationError,
    ApplicationErrorType? applicationError,
  }) {
    return ApplicationState(
      userLocation: userLocation ?? this.userLocation,
      status: status ?? this.status,
      locationError: locationError ?? this.locationError,
      applicationError: applicationError ?? this.applicationError,
    );
  }

  @override
  List<Object?> get props => [
        userLocation,
        status,
        locationError,
        applicationError,
      ];
}
