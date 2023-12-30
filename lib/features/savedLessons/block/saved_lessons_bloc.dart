import 'package:bloc/bloc.dart';
import 'package:intalim/common/repository/network_result.dart';
import 'package:intalim/common/services/utils/utils.dart';

import '../model/saved_lessons_event.dart';
import '../repository/saved_lessons_repository.dart';

class SavedLessonsBloc extends Bloc<SavedLessonsEvent, NetworkResult> {
  final SavedLessonsRepository savedLessonsRepository;

  SavedLessonsBloc(this.savedLessonsRepository) : super(const Loading()) {
    on<SavedLessonsEvent>((event, emit) async {
      emit(const Loading());
      try {
        final lessonsResult = await savedLessonsRepository.getSavedTopic();
        kprint("getSavedTopic-> ${lessonsResult.data}");
        emit(lessonsResult);
      } catch (e) {
        emit(Error(message: e.toString(), data: null, code: 0));
      }
    });
  }
}
