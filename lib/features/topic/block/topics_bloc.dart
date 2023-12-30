import 'package:bloc/bloc.dart';
import 'package:intalim/common/repository/network_result.dart';
import 'package:intalim/common/services/utils/utils.dart';

import '../model/topics_event.dart';
import '../repository/topics_repository.dart';

class TopicsBloc extends Bloc<TopicsEvent, NetworkResult> {
  final TopicsRepository topicsRepository;

  TopicsBloc(this.topicsRepository) : super(const Loading()) {
    on<TopicsEventData>((event, emit) async {
      emit(const Loading());
      try {
        final topicsResult = await topicsRepository.topics(event.eduTypeLessonId);
        // if (topicsResult.code == 401) {
        //   final topicsResult = await topicsRepository.topics();
        // }
        emit(topicsResult);
      } catch (e) {
        emit(Error(message: e.toString(), data: null, code: 0));
      }
    });
  }
}
