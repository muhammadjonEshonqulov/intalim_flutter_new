import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:intalim/common/repository/network_result.dart';

import '../../../common/utils/api_helper.dart';
import '../../../main.dart';
import '../model/topic_data.dart';

class TopicsRepository {
  Future<NetworkResult<Map<String, dynamic>>> topics(int eduTypeLessonId) async {
    var has = await checkNetwork();
    if (!has) {
      return Error(message: "connection_error_message".tr(), data: null, code: 0);
    }
    final apiHelper = ApiHelper();
    Map<String, int> requestParameters = {"edu_type_lesson_id": eduTypeLessonId};

    final response = await apiHelper.myGet("student-content/topics", requestParameters);
    try {
      return handleResponse(response);
    } catch (e) {
      return catchErrors(e);
    }
  }

  Future<List<TopicData>> getTopicData(int lessonId) async {
    return myDao.getTopicData(lessonId);
  }

  Future<void> insertTopicData(List<TopicData> topics) async {
    myDao.insertTopicData(topics);
  }

  Future<void> deleteTopicData() async {
    myDao.deleteTopicData();
  }

}
