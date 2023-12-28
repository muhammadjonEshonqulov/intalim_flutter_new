import 'package:shared_preferences/shared_preferences.dart';

final class Cache {
  final standard_text_size = "standard_text_size";
  final very_large_text_size = "very_large_text_size";
  final user_id = "user_id";
  final large_text_size = "large_text_size";
  final small_text_size = "small_text_size";
  final min_text_size = "min_text_size";
  final small_action_bar_size = "small_action_bar_size";
  final progressbar_circle_radius = "progressbar_circle_radius";
  final textSizePos = "textSizePos";
  final token = "token";
  final pinCode = "pinCode";
  final newPinCode = "newPinCode";
  final full_price = "full_price";

  final email = "email";
  final fullname = "fullname";
  final username = "username";
  final password = "password";
  final region_user_uz = "region_user_uz";
  final organization_user_uz = "organization_user_uz";
  final getStudentTestSubjectsPer = "getStudentTestSubjectsPer";
  final getStudentTestSubjects = "getStudentTestSubjects";
  final organization_id = "organization_id";
  final theme = "theme";
  final downloadVideos = "downloadVideos";
  final language = "language";
  final edu_type_id = "edu_type_id";
  final edu_type_name_uz = "edu_type_name_uz";
  final user_image_url = "user_image_url";
  final proxy_server_name = "proxy_server_name";
  final proxy_port = "proxy_port";
  final proxy_user_name = "proxy_user_name";
  final proxy_password = "proxy_password";
  final fontSize = "fontSize";
  final testFontSize = "testFontSize";
  final autoDownload = "autoDownload";
  final contentSearch = "contentSearch";
  final online = "online";
  final changedTopicSaved = "changedTopicSaved";
  final changedTestSaved = "changedTestSaved";
  final role = "role";
  final directorRole = "1";
  final teacherRole = "4";
  final studentRole = "5";
  final getStudentTestTemplates = "getStudentTestTemplates";
  final getStudentTestTemplatesPer = "getStudentTestTemplatesPer";
  final getSavedTopic = "getSavedTopic";
  final getSavedTopicPer = "getSavedTopicPer";

  Future<String?> getString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  Future<void> setString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  Future<int?> getInt(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key);
  }

  Future<void> setInt(String key, int value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, value);
  }

  Future<double?> getDouble(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(key);
  }

  Future<void> setDouble(String key, double value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(key, value);
  }

  Future<bool?> getBool(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  Future<void> setBool(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}

final cache = Cache();
