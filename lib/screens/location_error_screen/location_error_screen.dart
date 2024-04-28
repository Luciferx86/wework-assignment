import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wework/enums/location_error.dart';
import 'package:wework/global_blocs/application_bloc/application_bloc.dart';
import 'package:wework/global_blocs/application_bloc/events/application_bloc_events.dart';
import 'package:wework/widgets/primary_button.dart';

class LocationErrorScreen extends StatelessWidget {
  const LocationErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final errorType = context.read<ApplicationBloc>().state.locationError ??
        LocationError.permanently_denied;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/location_error.png',
                height: 120,
                width: 120,
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  getWarningText(errorType),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 160,
                child: PrimaryButton(
                  onPressed: () {
                    errorType == LocationError.temporary_denied
                        ? context.read<ApplicationBloc>().add(
                              FetchUserLocationEvent(),
                            )
                        : context.read<ApplicationBloc>().add(
                              OpenLocationSettingsEvent(),
                            );
                  },
                  titleSize: 14,
                  title: errorType == LocationError.temporary_denied
                      ? "Retry"
                      : "Open Settings",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getWarningText(LocationError errorType) {
    switch (errorType) {
      case LocationError.temporary_denied:
        return 'Location Permission Denied';
      case LocationError.permanently_denied:
        return 'Location Permission Denied Permanently';
      case LocationError.services_disabled:
        return 'Location Services Disabled';
    }
  }
}
