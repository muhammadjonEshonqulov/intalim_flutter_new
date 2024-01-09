import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intalim/features/lessons/page/lessons.dart';
import 'package:intalim/features/main/page/main_screen.dart';
import 'package:intalim/features/profile/page/profile_screen.dart';
import 'package:intalim/features/splash/page/splash_screen.dart';
import 'package:intalim/features/templateTest/page/template_test_page.dart';

import '../features/content/page/contents.dart';
import '../features/login/page/login_screen.dart';
import '../features/savedTest/page/saved_test_page.dart';
import '../features/startTest/page/start_screen.dart';
import '../features/subjectTest/page/subject_test_page.dart';
import '../features/topic/page/topics.dart';

abstract final class Routes {
  static const splash = '/nav_splash';
  static const login = '/nav_login';
  static const home = '/nav_home';
  static const lessons = '/nav_lessons';
  static const main = '/nav_main';
  static const topic = '/nav_topic';
  static const language = '/nav_language';
  static const drawer = '/nav_drawer';
  static const profile = '/nav_profile';
  static const content = '/nav_content';
  static const subjectTest = '/nav_subject_test';
  static const templateTest = '/nav_template_test';
  static const savedTest = '/nav_saved_test';
  static const startTest = '/nav_start_test';

  static const baseUrl = "$baseUrlImage/v2/api/";
  static const baseUrlImage = "https://back.eavtotalim.uz";
}

final router = GoRouter(
  initialLocation: Routes.splash,
  // initialExtra: const SurveyStep3PageExtra(
  //   surveyUuid: '8e75322c-0e42-4636-93bc-635b9012bc48',
  //   streetId: null,
  //   surveyId: null,
  // ),
  routes: [
    GoRoute(
      path: Routes.splash,
      builder: (context, state) => const SplashPageWithRepo(),
    ),
    GoRoute(
      path: Routes.login,
      builder: (context, state) => const LoginPageWithRepo(),
    ),
    GoRoute(
      path: Routes.lessons,
      builder: (context, state) => const LessonsPageWithRepo(),
    ),
    GoRoute(
      path: Routes.main,
      builder: (context, state) => const MainScreen(),
    ),
    GoRoute(
      path: Routes.profile,
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: Routes.subjectTest,
      builder: (context, state) => const SubjectTestsPageWithRepo(),
    ),
    GoRoute(
      path: Routes.templateTest,
      builder: (context, state) => const TemplatesPageWithRepo(),
    ),
    GoRoute(
      path: Routes.savedTest,
      builder: (context, state) => const SavedTestsPageWithRepo(),
    ),
    GoRoute(
      path: Routes.topic,
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>;
        final eduTypeLessonId = extra['eduTypeLessonId'] ?? 0;
        final eduTypeLessonName = extra['eduTypeLessonName'] ?? "";
        return TopicsPageWithRepo(eduTypeLessonId: eduTypeLessonId, eduTypeLessonName: eduTypeLessonName);
      },
    ),
    GoRoute(
      path: Routes.content,
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>;
        final topicId = extra['topicId'] ?? 0;
        final topicName = extra['topicName'] ?? "";
        return ContentPageWithRepo(topicId: topicId, topicName: topicName);
      },
    ),
    GoRoute(
      path: Routes.startTest,
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>;
        final testId = extra['testId'] ?? 0;
        final typeId = extra['typeId'] ?? 0;
        final testName = extra['testName'] ?? "";
        return StartTestPageWithRepo(testId: testId, testName: testName, typeId: typeId,);
      },
    ),
  ],
);

void finish(BuildContext context) {
  Navigator.of(context).pop();
}
