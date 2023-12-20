import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intalim/features/login/model/login_response.dart';

class LoginRepository {
  Future<LoginResponse?> login(String userName, String password) async {
    LoginResponse? confirmCardModel;
    final requestParameters = {"username": userName, "password": password};

    final response = await http.post(
      Uri.parse('https://api.ijtimoiy-himoya.uz/auth/login'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        // 'Authorization': 'Bearer  $token',

      },
      body: json.encode(requestParameters),
    );

    final int statusCode = response.statusCode;
    final resultClass = json.decode(utf8.decode(response.bodyBytes));

    if (statusCode == 200) {
      confirmCardModel = LoginResponse.fromJson(resultClass);
    }

    return confirmCardModel ?? LoginResponse();
  }

// Future<EImzoModel?> eImzoLogin() async {
//   EImzoModel? eImzoModel;
//
//   final response = await http.post(
//     Uri.parse('https://hujjat.uz/mobile-id/frontend/mobile/auth'),
//     headers: {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json',
//     },
//   );
//   final int statusCode = response.statusCode;
//   final resultClass = json.decode(utf8.decode(response.bodyBytes));
//   if (statusCode == 200) {
//     eImzoModel = EImzoModel.fromJson(resultClass);
//   }
//   return eImzoModel ?? EImzoModel();
// }
//
// Future<int?> eImzoLoginCheck(String documentId, Timer? _timer) async {
//   final response = await http.post(
//     Uri.parse(
//         'https://hujjat.uz/mobile-id/frontend/mobile/status?documentId=${documentId}'),
//     headers: {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json',
//     },
//   );
//   final int statusCode = response.statusCode;
//   final resultClass = json.decode(utf8.decode(response.bodyBytes));
//   if (statusCode == 200) {
//     if (resultClass["status"] == 1) {
//       _timer?.cancel();
//     }
//     return resultClass["status"];
//   }
//   return resultClass["status"];
// }
//
// Future<LoginModel?> getUserInfo(
//   String documentId,
// ) async {
//   LoginModel? loginWithEImzoModel;
//   final response = await http.get(
//     Uri.parse('https://api.ijtimoiy-himoya.uz/auth/eimzo-v2/${documentId}'),
//     headers: {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json',
//     },
//   );
//   final int statusCode = response.statusCode;
//   print("statusCode:____" + statusCode.toString());
//   final resultClass = json.decode(utf8.decode(response.bodyBytes));
//   if (statusCode == 200) {
//     loginWithEImzoModel = LoginModel.fromJson(resultClass);
//   }
//   return loginWithEImzoModel ?? LoginModel();
// }
}
