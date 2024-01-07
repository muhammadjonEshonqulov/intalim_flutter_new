import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:intalim/common/repository/network_result.dart';
import 'package:intalim/common/services/utils/utils.dart';

import '../model/content_data.dart';
import '../model/content_event.dart';
import '../repository/content_repository.dart';

class ContentBloc extends Bloc<ContentEvent, NetworkResult> {
  final ContentRepository contentRepository;
  var topicId = 0;
  ContentBloc(this.contentRepository) : super(const Loading()) {
    on<ContentEventData>((event, emit) async {
      topicId = event.topicId;
      emit(const Loading());
      try {
        final contentsLocal = await _contentRepository.getContentData(event.topicId);
        if (contentsLocal.isNotEmpty) {
          fetchContent();
        }
        final contentsResult = await contentRepository.contents(event.topicId);
        kprint(contentsResult.data);
        List<ContentData> contents = (contentsResult.data?["data"] as List).map((lessonJson) => ContentData.fromJson(lessonJson)).toList();

        addContent(contents);
        emit(contentsResult);
      } catch (e) {
        emit(Error(message: e.toString(), data: null, code: 0));
      }
    });
  }

  final _contentController = StreamController<List<ContentData>>.broadcast();
  final _contentRepository = ContentRepository();

  Stream<List<ContentData>> get contentsFromLocal => _contentController.stream;

  void fetchContent() async {
    final contents = await _contentRepository.getContentData(topicId);
    _contentController.sink.add(contents);
  }

  void addContent(List<ContentData> contents) async {
    await _contentRepository.insertContentData(contents);
    fetchContent();
  }

  void deleteContent() async {
    await _contentRepository.deleteContentData();
  }

  void dispose() {
    _contentController.close();
  }

}
