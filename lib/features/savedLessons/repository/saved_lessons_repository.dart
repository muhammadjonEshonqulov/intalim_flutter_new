import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intalim/common/repository/network_result.dart';
import 'package:intalim/common/services/utils/utils.dart';

import '../../../app/router.dart';
import '../../../common/utils/api_helper.dart';

class SavedLessonsRepository {


  Future<NetworkResult<Map<String, dynamic>>> getSavedTopic() async {
    final apiHelper = ApiHelper();
    final response = await apiHelper.myGet("student-content/saved-topic/index", {});
    try {
      return handleResponse(response);
    } catch (e) {
      return catchErrors(e);
    }
  }
}
