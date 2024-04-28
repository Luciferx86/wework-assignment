import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wework/enums/location_error.dart';
import 'package:wework/global_blocs/application_bloc/application_bloc.dart';
import 'package:wework/global_blocs/application_bloc/events/application_bloc_events.dart';
import 'package:wework/widgets/primary_button.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/no_internet.png',
                height: 120,
                width: 120,
              ),
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  "No Internet",
                  textAlign: TextAlign.center,
                  style: TextStyle(
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
                    context.read<ApplicationBloc>().add(
                          InitialiseApplicationEvent(),
                        );
                  },
                  titleSize: 14,
                  title: "Retry",
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
