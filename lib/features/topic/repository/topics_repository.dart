import 'dart:async';

import 'package:intalim/common/repository/network_result.dart';

import '../../../common/utils/api_helper.dart';

class TopicsRepository {
  Future<NetworkResult<Map<String, dynamic>>> topics(int eduTypeLessonId) async {
    final apiHelper = ApiHelper();
    Map<String, int> requestParameters = {"edu_type_lesson_id": eduTypeLessonId};

    final response = await apiHelper.myGet("student-content/topics", requestParameters);
    try {
      return handleResponse(response);
    } catch (e) {
      return catchErrors(e);
    }
  }
}
