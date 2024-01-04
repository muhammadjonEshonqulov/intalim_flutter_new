import 'package:bloc/bloc.dart';
import 'package:intalim/common/repository/network_result.dart';
import 'package:intalim/common/services/utils/utils.dart';

import '../model/content_event.dart';
import '../repository/content_repository.dart';

class ContentBloc extends Bloc<ContentEvent, NetworkResult> {
  final ContentRepository contentRepository;

  ContentBloc(this.contentRepository) : super(const Loading()) {
    on<ContentEventData>((event, emit) async {
      emit(const Loading());
      try {
        final topicsResult = await contentRepository.contents(event.topicId);
        emit(topicsResult);
      } catch (e) {
        emit(Error(message: e.toString(), data: null, code: 0));
      }
    });
  }
}
