import 'dart:async';

import 'package:intalim/common/repository/network_result.dart';
import 'package:intalim/common/services/utils/utils.dart';

import '../../../common/utils/api_helper.dart';
import '../../../main.dart';
import '../model/template_test_data.dart';

class TemplatesRepository {
  Future<NetworkResult<Map<String, dynamic>>> getSavedTopic() async {
    final apiHelper = ApiHelper();
    final response = await apiHelper.myGet("saved-test", {});
    try {
      return handleResponse(response);
    } catch (e) {
      return catchErrors(e);
    }
  }

  Future<NetworkResult<Map<String, dynamic>>> getStudentTemplateTemplates() async {
    final apiHelper = ApiHelper();
    final response = await apiHelper.myGet("student-test-templates", {});
    try {
      return handleResponse(response);
    } catch (e) {
      kprint("getStudentTemplateTemplates error -> ${e.toString()}");
      return catchErrors(e);
    }
  }

  Future<NetworkResult<Map<String, dynamic>>> getStudentTemplateSubjects() async {
    final apiHelper = ApiHelper();
    final response = await apiHelper.myGet("student-test-subjects", {});
    try {
      return handleResponse(response);
    } catch (e) {
      return catchErrors(e);
    }
  }


  Future<List<TemplateTestData>> getTemplateData() async {
    return myDao.getTemplateTestData();
  }

  Future<void> insertTemplateData(List<TemplateTestData> lessons) async {
    myDao.insertTemplateTestData(lessons);
  }

  Future<void> deleteTemplateData() async {
    myDao.deleteTemplateTestData();
  }
}
