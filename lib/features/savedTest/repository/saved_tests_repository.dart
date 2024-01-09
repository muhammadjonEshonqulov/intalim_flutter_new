import 'dart:async';

import 'package:intalim/common/repository/network_result.dart';
import 'package:intalim/common/services/utils/utils.dart';

import '../../../common/utils/api_helper.dart';
import '../../../main.dart';
import '../model/saved_test_data.dart';

class SavedTestsRepository {
  Future<NetworkResult<Map<String, dynamic>>> getSavedTopic() async {
    final apiHelper = ApiHelper();
    final response = await apiHelper.myGet("saved-test", {});
    try {
      return handleResponse(response);
    } catch (e) {
      return catchErrors(e);
    }
  }

  Future<NetworkResult<Map<String, dynamic>>> getStudentSavedTestTemplates() async {
    final apiHelper = ApiHelper();
    final response = await apiHelper.myGet("student-test-templates", {});
    try {
      return handleResponse(response);
    } catch (e) {
      return catchErrors(e);
    }
  }

  Future<NetworkResult<Map<String, dynamic>>> getStudentSavedTestSaveds() async {
    final apiHelper = ApiHelper();
    final response = await apiHelper.myGet("student-test-subjects", {});
    try {
      return handleResponse(response);
    } catch (e) {
      return catchErrors(e);
    }
  }


  Future<List<SavedTestData>> getSavedTestData() async {
    return myDao.getSavedTestData();
  }

  Future<void> insertSavedTestData(List<SavedTestData> lessons) async {
    myDao.insertSavedTestData(lessons);
  }

  Future<void> deleteSavedTestData() async {
    myDao.deleteSavedTestData();
  }
}
