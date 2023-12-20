// import 'dart:convert';
//
// import 'package:assistant/common/models/street.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/services.dart';
//
// final Map<int, List<Street>> _streetsMap = {};
//
// List<Street> _parseStreetsIsolated((ByteData, int) data) {
//   final (byteData, districtId) = data;
//   final uint8List = Uint8List.sublistView(byteData);
//   final parsed = jsonDecode(utf8.decode(uint8List));
//   List list = parsed['data'];
//
//   List<Street> streets = [
//     for (final e in list)
//       if (e['district_id'] == districtId) Street.fromJson(e),
//   ];
//
//   return streets;
// }
//
// class GlobalRepo {
//   Future<List<Street>> getStreetsByDistrictId(int districtId) async {
//     var streets = _streetsMap[districtId];
//     if (streets != null) return [...streets];
//
//     final byteData = await rootBundle.load('assets/json/streets.json');
//     streets = await compute(_parseStreetsIsolated, (byteData, districtId));
//
//     if (streets != null) {
//       _streetsMap[districtId] = [...streets];
//       return [...streets];
//     }
//
//     return [];
//   }
// }
//
// final globalRepo = GlobalRepo();
