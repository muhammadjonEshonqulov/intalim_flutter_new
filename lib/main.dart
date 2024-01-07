import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intalim/app/app.dart';
import 'package:intalim/db/my_dao.dart';

import 'common/services/language/lang_json.dart';
import 'db/database.dart';
import 'main.dart';
late MyDao myDao;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  // await initObjectbox();

  AppDatabase appDatabase = (await $FloorAppDatabase.databaseBuilder('app_database.db').build());
  myDao = appDatabase.myDao;

  runApp(EasyLocalization(
    supportedLocales: const [
      Locale('uz'),
      // Locale('en'),
      // Locale('ru'),
    ],
    path: 'assets/lang',
    assetLoader: JsonAssetLoader(),
    fallbackLocale: const Locale('uz'),
    child: const App(),
  ));
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//       statusBarColor: Colors.white, // Set your desired color here
//       statusBarIconBrightness: Brightness.light, // Optionally, set the status bar icon color
//     ));
//
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       locale: context.locale,
//       supportedLocales: context.supportedLocales,
//       localizationsDelegates: context.localizationDelegates,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         appBarTheme: AppBarTheme(
//           iconTheme: IconThemeData(color: Colors.black),
//           color: Colors.white,
//         ),
//       ),
//       title: 'InTalim',
//       home: MainNavigator(),
//     );
//   }
// }
