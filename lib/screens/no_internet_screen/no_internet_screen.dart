import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wework/global_blocs/application_bloc/application_bloc.dart';
import 'package:wework/global_blocs/application_bloc/events/application_bloc_events.dart';
import 'package:wework/screens/home_screen/bloc/repo/home_repo.dart';
import 'package:wework/screens/home_screen/bloc/state/home_state.dart';
import 'package:wework/widgets/primary_button.dart';

class NoInternetScreen extends StatefulWidget {
  const NoInternetScreen({Key? key}) : super(key: key);

  @override
  State<NoInternetScreen> createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen> {
  HomeState? cachedState;
  @override
  void initState() {
    super.initState();
    _fetchCachedData();
  }

  _fetchCachedData() async {
    HomeState? cachedState = await HomeRepoImpl().loadCaches();
    setState(() {
      this.cachedState = cachedState;
    });
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
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
                if (cachedState != null) ...[
                  const SizedBox(height: 60),
                  const Text(
                    "Cached Data found",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: 220,
                    child: PrimaryButton(
                      onPressed: () {
                        context.read<ApplicationBloc>().add(
                              LoadCachedDataEvent(),
                            );
                      },
                      titleSize: 14,
                      title: "Load Cached Data",
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
