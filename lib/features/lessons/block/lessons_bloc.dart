import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:intalim/common/repository/network_result.dart';
import 'package:intalim/common/services/utils/utils.dart';
import 'package:intalim/features/lessons/model/lesson_data.dart';

import '../model/lessons_event.dart';
import '../repository/lessons_repository.dart';

class LessonsBloc extends Bloc<LessonsEvent, NetworkResult> {
  final LessonsRepository lessonsRepository;

  LessonsBloc(this.lessonsRepository) : super(const Loading()) {
    on<LessonsEvent>((event, emit) async {
      emit(const Loading());
      try {
        final lessonsResult = await lessonsRepository.lessons();
        List<LessonData> lessons = (lessonsResult.data?['data'] as List).map((lessonJson) => LessonData.fromJson(lessonJson)).toList();
        addLessons(lessons);
        kprint(lessons.length);
        fetchLessons();
        emit(lessonsResult);
      } catch (e) {
        fetchLessons();
        emit(Error(message: e.toString(), data: null, code: 0));
      }
    });
  }

  final _lessonController = StreamController<List<LessonData>>.broadcast();
  final _lessonRepository = LessonsRepository();

  Stream<List<LessonData>> get lessonsFromLocal => _lessonController.stream;

  void fetchLessons() async {
    final lessons = await _lessonRepository.getAllLessons();
    kprint("fetchLessons-> ${lessons.length}");
    _lessonController.sink.add(lessons);
  }

  void addLessons(List<LessonData> lessons) async {
    await _lessonRepository.insertLessons(lessons);
    fetchLessons();
  }

  void addLesson(LessonData lesson) async {
    await _lessonRepository.insertLesson(lesson);
    fetchLessons();
  }

  void dispose() {
    _lessonController.close();
  }
}
