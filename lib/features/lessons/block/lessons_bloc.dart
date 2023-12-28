import 'package:bloc/bloc.dart';
import 'package:intalim/common/repository/network_result.dart';

import '../model/lessons_event.dart';
import '../repository/lessons_repository.dart';

class LessonsBloc extends Bloc<LessonsEvent, NetworkResult> {
  final LessonsRepository lessonsRepository;

  LessonsBloc(this.lessonsRepository) : super(const Loading()) {
    on<LessonsEvent>((event, emit) async {
      emit(const Loading());
      try {
        final lessonsResult = await lessonsRepository.lessons();
        emit(lessonsResult);
      } catch (e) {
        emit(Error(message: e.toString(), data: null, code: 0));
      }
    });
  }
}
