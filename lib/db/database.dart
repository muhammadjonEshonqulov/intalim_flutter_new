// database.dart

// required package imports
import 'dart:async';

import 'package:floor/floor.dart';
import 'package:intalim/features/lessons/model/lesson_data.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../features/content/model/content_data.dart';
import '../features/savedLessons/model/saved_lesson_data.dart';
import '../features/subjectTest/model/subject_test_data.dart';
import '../features/topic/model/topic_data.dart';
import 'my_dao.dart';

part 'database.g.dart';

@Database(version: 3, entities: [
  SavedLessonData,
  LessonData,
  TopicData,
  ContentData,
  SubjectTestData,
])
abstract class AppDatabase extends FloorDatabase {
  MyDao get myDao;
}
