// import 'dart:convert';
// import 'dart:typed_data';
//
// import 'package:assistant/app/router.dart';
// import 'package:assistant/common/utils/errors.dart';
// import 'package:assistant/db/cache.dart';
// import 'package:http/http.dart' as http;
// import 'package:http_parser/http_parser.dart';
// import 'package:logger/logger.dart';
//
// class ApiRepo {
//   final logger = Logger();
//
//   Future<dynamic> getWithAuth(String url) async {
//     final token = await cache.getString('token');
//     if (token == null) {
//       router.go(Routes.login);
//       throw UnauthorizedError();
//     }
//
//     try {
//       final uri = Uri.parse(url);
//       final headers = {'Authorization': 'Bearer $token'};
//
//       final response = await http.get(uri, headers: headers);
//       final parsed = jsonDecode(utf8.decode(response.bodyBytes));
//
//       if (parsed['error'] != null) {
//         logger.e('GET ERROR: $parsed');
//         throw parsed['error'];
//       }
//
//       return parsed;
//     } catch (err) {
//       rethrow;
//     }
//   }
//
//   Future<dynamic> postWithAuth(
//     String url,
//     Map<String, dynamic> body,
//   ) async {
//     final token = await cache.getString('token');
//     if (token == null) {
//       router.go(Routes.login);
//       throw UnauthorizedError();
//     }
//
//     try {
//       final uri = Uri.parse(url);
//       final headers = {
//         'Authorization': 'Bearer $token',
//         'Content-Type': 'application/json',
//       };
//
//       final response = await http.post(
//         uri,
//         headers: headers,
//         body: jsonEncode(body),
//       );
//       final parsed = jsonDecode(utf8.decode(response.bodyBytes));
//
//       if (parsed['error'] != null) {
//         logger.e('POST request error response: $parsed');
//         throw parsed['error'];
//       }
//
//       return parsed;
//     } catch (err) {
//       rethrow;
//     }
//   }
//
//   Future<dynamic> fileUpload({
//     required Uint8List bytes,
//   }) async {
//     final token = await cache.getString('token');
//     if (token == null) {
//       router.go(Routes.login);
//       throw UnauthorizedError();
//     }
//
//     try {
//       final uri = Uri.parse('https://api.ijtimoiy-himoya.uz/files/upload/form');
//       final headers = {
//         'Authorization': 'Bearer $token',
//       };
//
//       final request = http.MultipartRequest('POST', uri);
//       request.headers.addAll(headers);
//
//       final pic = http.MultipartFile.fromBytes(
//         'file',
//         bytes,
//       );
//
//       request.files.add(pic);
//
//       final response = await request.send();
//       final data = await response.stream.toBytes();
//
//       logger.e(response.statusCode);
//       logger.e(data);
//     } catch (err) {
//       // rethrow;
//     }
//   }
// }
//
// final apiRepo = ApiRepo();
