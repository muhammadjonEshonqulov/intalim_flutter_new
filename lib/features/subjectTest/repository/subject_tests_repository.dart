import 'dart:async';

import 'package:intalim/common/repository/network_result.dart';
import 'package:intalim/common/services/utils/utils.dart';

import '../../../common/utils/api_helper.dart';
import '../../../main.dart';
import '../model/subject_test_data.dart';

class SubjectTestsRepository {
  Future<NetworkResult<Map<String, dynamic>>> getSavedTopic() async {
    final apiHelper = ApiHelper();
    final response = await apiHelper.myGet("saved-test", {});
    try {
      return handleResponse(response);
    } catch (e) {
      return catchErrors(e);
    }
  }

  Future<NetworkResult<Map<String, dynamic>>> getStudentSubjectTestTemplates() async {
    final apiHelper = ApiHelper();
    final response = await apiHelper.myGet("student-test-templates", {});
    try {
      return handleResponse(response);
    } catch (e) {
      return catchErrors(e);
    }
  }

  Future<NetworkResult<Map<String, dynamic>>> getStudentSubjectTestSubjects() async {
    final apiHelper = ApiHelper();
    final response = await apiHelper.myGet("student-test-subjects", {});
    try {
      return handleResponse(response);
    } catch (e) {
      return catchErrors(e);
    }
  }


  Future<List<SubjectTestData>> getSubjectTestData() async {
    return myDao.getSubjectTestData();
  }

  Future<void> insertSubjectTestData(List<SubjectTestData> lessons) async {
    myDao.insertSubjectTestData(lessons);
  }

  Future<void> deleteSubjectTestData() async {
    myDao.deleteSubjectTestData();
  }
}
