import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wework/global_blocs/application_bloc/application_bloc.dart';
import 'package:wework/services/application_repo.dart';
import 'package:wework/services/cache_service.dart';

import 'screens/start_page/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheServiceImpl().initialise();
  runApp(
    BlocProvider(
      create: (context) => ApplicationBloc(
        applicationRepo: ApplicationRepoImpl(),
      ),
      child: const MainPage(),
    ),
  );
}
