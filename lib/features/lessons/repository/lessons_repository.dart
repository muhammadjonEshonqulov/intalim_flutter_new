import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:intalim/common/repository/network_result.dart';
import 'package:intalim/db/database.dart';
import 'package:intalim/main.dart';

import '../../../common/utils/api_helper.dart';
import '../model/lesson_data.dart';

class LessonsRepository {
  Future<NetworkResult<Map<String, dynamic>>> lessons() async {
    var has = await checkNetwork();
    if (!has) {
      return Error(message: "connection_error_message".tr(), data: null, code: 0);
    }
    final apiHelper = ApiHelper();
    final response = await apiHelper.myGet("student-content/lessons", {});
    try {
      return handleResponse(response);
    } catch (e) {
      return catchErrors(e);
    }
  }

  Future<List<LessonData>> getAllLessons() async {
    return myDao.getAllLesson();
  }

  Future<void> insertLessons(List<LessonData> lessons) async {
    myDao.insertLessonData(lessons);
  }

  Future<void> deleteLessons() async {
    myDao.deleteLessons();
  }
}
