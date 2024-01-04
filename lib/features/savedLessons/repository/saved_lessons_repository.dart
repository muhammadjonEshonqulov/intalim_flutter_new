import 'dart:async';
import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:http/http.dart' as http;
import 'package:intalim/common/repository/network_result.dart';
import 'package:intalim/common/services/utils/utils.dart';

import '../../../app/router.dart';
import '../../../common/utils/api_helper.dart';

class SavedLessonsRepository {


  Future<NetworkResult<Map<String, dynamic>>> getSavedTopic() async {
    var has = await checkNetwork();
    if(!has){
      return Error(message: "connection_error_message".tr(), data: null, code: 0);
    }
    final apiHelper = ApiHelper();
    final response = await apiHelper.myGet("student-content/saved-topic/index", {});
    try {
      return handleResponse(response);
    } catch (e) {
      return catchErrors(e);
    }
  }
}
