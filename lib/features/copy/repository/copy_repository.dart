import 'dart:async';
import 'dart:convert';

import 'package:intalim/common/repository/network_result.dart';
import 'package:intalim/common/services/utils/utils.dart';

import '../../../app/router.dart';
import '../../../common/utils/api_helper.dart';

class CopyRepository {
  Future<NetworkResult<Map<String, dynamic>>> login(String userName, String password) async {
    final requestParameters = {"username": userName, "password": password};

    final apiHelper = ApiHelper();
    final response = await apiHelper.myPost("login", json.encode(requestParameters));

    try {
      return handleResponse(response);
    } catch (e) {
      return catchErrors(e);
    }
  }

  Future<NetworkResult<Map<String, dynamic>>> me() async {
    final apiHelper = ApiHelper();
    final response = await apiHelper.myGet("auth/me", {});

    try {
      return handleResponse(response);
    } catch (e) {
      return catchErrors(e);
    }
  }
}
