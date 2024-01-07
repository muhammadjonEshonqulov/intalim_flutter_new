import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:intalim/common/repository/network_result.dart';
import 'package:intalim/common/services/utils/utils.dart';
import 'package:intalim/features/savedLessons/model/saved_lesson_data.dart';

import '../model/saved_lessons_event.dart';
import '../repository/saved_lessons_repository.dart';

class SavedLessonsBloc extends Bloc<SavedLessonsEvent, NetworkResult> {
  final SavedLessonsRepository savedLessonsRepository;

  SavedLessonsBloc(this.savedLessonsRepository) : super(const Loading()) {
    on<SavedLessonsEvent>((event, emit) async {
      emit(const Loading());
      try {
        // deleteLessons();
        final lessonsLocal = await _savedLessonRepository.getAllSavedLesson();
        if (lessonsLocal.isNotEmpty) {
          fetchData();
        }
        final lessonsResult = await savedLessonsRepository.getSavedTopic();
        List<SavedLessonData> lessons = (lessonsResult.data?["data"] as List).map((lessonJson) => SavedLessonData.fromJson(lessonJson)).toList();
        addLessons(lessons);
        emit(lessonsResult);
      } catch (e) {
        fetchData();
        emit(Error(message: e.toString(), data: null, code: 0));
      }
    });
  }

  final _savedLessonController = StreamController<List<SavedLessonData>>.broadcast();
  final _savedLessonRepository = SavedLessonsRepository();

  Stream<List<SavedLessonData>> get savedLessonsFromLocal => _savedLessonController.stream;

  void fetchData() async {
    final savedLessons = await _savedLessonRepository.getAllSavedLesson();
    _savedLessonController.sink.add(savedLessons);
  }

  void addLessons(List<SavedLessonData> savedLessons) async {
    await _savedLessonRepository.insertSavedLessonData(savedLessons);
    fetchData();
  }

  void deleteLessons() async {
    await _savedLessonRepository.deleteSavedLessons();
  }

  void dispose() {
    _savedLessonController.close();
  }
}
