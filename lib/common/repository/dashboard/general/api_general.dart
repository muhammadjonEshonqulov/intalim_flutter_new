import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model_general.dart';

class GeneralRepository {
  static final GeneralRepository _singleton = GeneralRepository._internal();

  GeneralRepository._internal();

  static GeneralRepository getInstance() {
    return _singleton;
  }

  Future<GeneralModel> getGeneralInfo(
    int obl_id,
  ) async {
    GeneralModel? getGeneralInfo;

    // final basicAuth = 'Basic ' + base64Encode(utf8.encode('$username:$password'));

    try {
      final requestUrl = Uri.parse("https://api.ijtimoiy-himoya.uz/api/v1/mobile/dashboard/general-region?obl_id=6");
      final response = await http.get(
        requestUrl,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer 1c878637-b939-4a5a-bf97-69206233abee',
        },
      );

      final int statusCode = response.statusCode;
      print(statusCode);
      final resultClass = json.decode(utf8.decode(response.bodyBytes));
      if (statusCode == 200) {
        getGeneralInfo = GeneralModel.fromJson(resultClass);

        print(getGeneralInfo);
      } else {
        getGeneralInfo = GeneralModel.fromJson(resultClass);
      }
    } catch (e) {
      print("e");
      print(e);
    }
    return getGeneralInfo ?? GeneralModel();
  }
}
