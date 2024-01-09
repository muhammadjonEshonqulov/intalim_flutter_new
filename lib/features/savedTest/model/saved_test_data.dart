import 'dart:convert';import 'package:floor/floor.dart';import '../../lessons/model/lesson_data.dart';@entityclass SavedTestData {  @primaryKey  int? id;  int? testId;  int? type;  String? name;  int? questionCount;  int? maxResultPercent;  SavedTestData({this.id, this.testId, this.type, this.name, this.questionCount, this.maxResultPercent });  SavedTestData.fromJson(Map<String, dynamic> json) {    id = json["id"];    testId = json["test_id"];    type = json["type"];    name = json["type"] == 0 ? jsonEncode(Name.fromJson( json['lesson']["name"]??"").toJson()) : jsonEncode(Name().toJson());    questionCount = json["test_result"] != null ? json["test_result"]["question_count"]??1 : 1;    maxResultPercent = json["test_result"] != null ? json["test_result"]["max_result_percent"]??0 : 0;  }  Map<String, dynamic> toJson() {    final Map<String, dynamic> data = <String, dynamic>{};    data["id"] = id;    data["test_id"] = testId;    data["type"] = type;    data["name"] = name;    data["question_count"] = questionCount;    data["max_result_percent"] = maxResultPercent;    return data;  }}// class Result {//   int? questionCount;//   int? correctAnswersCount;//   int? incorrectAnswersCount;//   int? maxResultCorrects;//   int? percent;//   int? maxResultPercent;////   Result({this.questionCount, this.correctAnswersCount, this.incorrectAnswersCount, this.maxResultCorrects, this.percent, this.maxResultPercent,});////   Result.fromJson(Map<String, dynamic> json) {//     questionCount = json['question_count'];//     correctAnswersCount = json["correct_answers_count"];//     incorrectAnswersCount = json["incorrect_answers_count"];//     maxResultCorrects = json["max_result_corrects"];//     percent = json["percent"];//     maxResultPercent = json["max_result_percent"];//   }////   Map<String, dynamic> toJson() {//     final Map<String, dynamic> data = <String, dynamic>{};////     data[ "question_count"] = questionCount;//     data[ "correct_answers_count"] = correctAnswersCount;//     data[ "incorrect_answers_count"] = incorrectAnswersCount;//     data[ "max_result_corrects"] = maxResultCorrects;//     data[ "percent"] = percent;//     data[ "max_result_percent"] = maxResultPercent;//     return data;//   }// }