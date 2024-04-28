import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wework/enums/application_error_type.dart';
import 'package:wework/enums/application_status.dart';
import 'package:wework/global_blocs/application_bloc/application_bloc.dart';
import 'package:wework/global_blocs/application_bloc/events/application_bloc_events.dart';
import 'package:wework/global_blocs/application_bloc/state/application_state.dart';
import 'package:wework/screens/home_screen/home_screen.dart';
import 'package:wework/screens/location_error_screen/location_error_screen.dart';
import 'package:wework/screens/no_internet_screen/no_internet_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ApplicationBloc>().add(
          InitialiseApplicationEvent(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9999),
            border: Border.all(
              color: Colors.black,
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
          child: Stack(
            children: [
              const SizedBox(
                height: 212,
                width: 212,
                child: CircularProgressIndicator(
                  color: Colors.black,
                  strokeWidth: 5,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Image.asset(
                  "assets/images/logo_full.png",
                  width: 180,
                  height: 180,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
