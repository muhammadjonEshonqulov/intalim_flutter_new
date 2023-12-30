import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intalim/app/router.dart';
import 'package:intalim/features/splash/repository/me_repository.dart';
import 'package:intalim/features/test/repository/tests_repository.dart';
import 'package:intalim/features/topic/repository/topics_repository.dart';

import '../features/lessons/repository/lessons_repository.dart';
import '../features/login/repository/login_repository.dart';
import '../features/savedLessons/repository/saved_lessons_repository.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: Colors.white, // Set your desired status bar background color
    //   statusBarIconBrightness: Brightness.light, // Set the brightness of the icons
    //   systemNavigationBarColor: Colors.white, // Set your desired navigation bar color (if applicable)
    //   systemNavigationBarIconBrightness: Brightness.light, // Set the brightness of the navigation bar icons (if applicable)
    // ));
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => LoginRepository()),
        RepositoryProvider(create: (_) => LessonsRepository()),
        RepositoryProvider(create: (_) => SavedLessonsRepository()),
        RepositoryProvider(create: (_) => TestsRepository()),
        RepositoryProvider(create: (_) => MeRepository()),
        RepositoryProvider(create: (_) => TopicsRepository()),
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

void snack(BuildContext context, String mes){
  final snackBar = SnackBar(content: Text(mes), duration: const Duration(seconds: 1));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
void hideKeyboard(BuildContext context){
  FocusScope.of(context).unfocus();
}

BuildContext? _dialogContext;

void showLoading(context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      _dialogContext = context;
      return Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Container(
          alignment: AlignmentDirectional.center,
          decoration: BoxDecoration(),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
              ],
            ),
          ),
        ),
      );
    },
  );
}

void hideLoading() {
  if (_dialogContext != null) {
    Navigator.of(_dialogContext!).pop();
    _dialogContext = null;
  }
}