import 'package:bloc/bloc.dart';
import 'package:intalim/common/repository/network_result.dart';
import 'package:intalim/common/services/utils/utils.dart';

import '../model/lessons_test_event.dart';
import '../repository/lessons_test_repository.dart';

class LessonsTestBloc extends Bloc<LessonsTestEvent, NetworkResult> {
  final LessonsTestRepository lessonsRepository;

  LessonsTestBloc(this.lessonsRepository) : super(const Loading()) {
    on<LessonsTestEvent>((event, emit) async {
      emit(const Loading());
      try {
        final lessonsResult = await lessonsRepository.lessons();
        kprint(lessonsResult.data);
        if(lessonsResult.code == 401){
          final lessonsResult = await lessonsRepository.lessons();
        }
        emit(lessonsResult);
      } catch (e) {
        emit(Error(message: e.toString(), data: null, code: 0));
      }
    });
  }
}
