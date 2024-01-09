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
