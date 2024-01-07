import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:intalim/common/repository/network_result.dart';
import 'package:intalim/common/services/utils/utils.dart';

import '../model/topic_data.dart';
import '../model/topics_event.dart';
import '../repository/topics_repository.dart';

class TopicsBloc extends Bloc<TopicsEvent, NetworkResult> {
  final TopicsRepository topicsRepository;
  var eduTypeLessonId = 0;

  TopicsBloc(this.topicsRepository) : super(const Loading()) {
    on<TopicsEventData>((event, emit) async {
      eduTypeLessonId = event.eduTypeLessonId;
      emit(const Loading());
      try {
        final topicsLocal = await _topicRepository.getTopicData(event.eduTypeLessonId);
        if (topicsLocal.isNotEmpty) {
          fetchTopic();
        }
        final topicsResult = await topicsRepository.topics(event.eduTypeLessonId);
        kprint(topicsResult.data);
        List<TopicData> topics = (topicsResult.data?["data"] as List).map((lessonJson) => TopicData.fromJson(lessonJson)).toList();
        topics.forEach((element) {
          element.lessonId = eduTypeLessonId;
        });
        addTopic(topics);
        emit(topicsResult);
      } catch (e) {
        kprint(e.toString());
        emit(Error(message: e.toString(), data: null, code: 0));
      }
    });
  }

  final _topicController = StreamController<List<TopicData>>.broadcast();
  final _topicRepository = TopicsRepository();

  Stream<List<TopicData>> get topicsFromLocal => _topicController.stream;

  void fetchTopic() async {
    final topics = await _topicRepository.getTopicData(eduTypeLessonId);
    _topicController.sink.add(topics);
  }

  void addTopic(List<TopicData> topics) async {
    await _topicRepository.insertTopicData(topics);
    fetchTopic();
  }

  void deleteTopic() async {
    await _topicRepository.deleteTopicData();
  }

  void dispose() {
    _topicController.close();
  }
}
