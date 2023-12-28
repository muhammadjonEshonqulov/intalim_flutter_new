import 'dart:async';

import 'package:intalim/common/repository/network_result.dart';
import 'package:intalim/common/services/utils/utils.dart';

import '../../../common/utils/api_helper.dart';

class TestsRepository {
  Future<NetworkResult<Map<String, dynamic>>> getSavedTopic() async {
    final apiHelper = ApiHelper();
    final response = await apiHelper.myGet("saved-test", {});
    try {
      return handleResponse(response);
    } catch (e) {
      return catchErrors(e);
    }
  }

  Future<NetworkResult<Map<String, dynamic>>> getStudentTestTemplates() async {
    final apiHelper = ApiHelper();
    final response = await apiHelper.myGet("student-test-templates", {});
    try {
      return handleResponse(response);
    } catch (e) {
      return catchErrors(e);
    }
  }

  Future<NetworkResult<Map<String, dynamic>>> getStudentTestSubjects() async {
    final apiHelper = ApiHelper();
    final response = await apiHelper.myGet("student-test-subjects", {});
    try {
      return handleResponse(response);
    } catch (e) {
      return catchErrors(e);
    }
  }
}
