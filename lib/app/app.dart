import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intalim/app/router.dart';

import '../features/login/repository/login_repository.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => LoginRepository()),
        // RepositoryProvider(create: (_) => HomeRepository()),
        // RepositoryProvider(create: (_) => AddHomeRepository()),
        // RepositoryProvider(create: (_) => SurveyStep1Repository()),
        // RepositoryProvider(create: (_) => SurveyStep2Repository()),
        // RepositoryProvider(create: (_) => SurveyStep3Repository()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: false,
        ),
        routerConfig: router,
      ),
    );
  }
}
