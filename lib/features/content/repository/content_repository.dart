import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:intalim/common/repository/network_result.dart';

import '../../../common/utils/api_helper.dart';

class ContentRepository {
  Future<NetworkResult<Map<String, dynamic>>> contents(int topicId) async {
    var has = await checkNetwork();
    if(!has){
      return Error(message: "connection_error_message".tr(), data: null, code: 0);
    }
    final apiHelper = ApiHelper();
    Map<String, int> requestParameters = {"topic_id": topicId};

    final response = await apiHelper.myGet("student-content/contents", requestParameters);
    try {
      return handleResponse(response);
    } catch (e) {
      return catchErrors(e);
    }
  }
}
