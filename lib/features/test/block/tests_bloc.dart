import 'package:bloc/bloc.dart';
import 'package:intalim/common/repository/network_result.dart';
import 'package:intalim/common/services/utils/utils.dart';
import 'package:intalim/db/cache.dart';

import '../model/tests_event.dart';
import '../repository/tests_repository.dart';

class TestsBloc extends Bloc<TestsEvent, NetworkResult> {
  final TestsRepository savedLessonsRepository;

  TestsBloc(this.savedLessonsRepository) : super(const Loading()) {
    on<TestsEvent>((event, emit) async {
      emit(const Loading());
      try {
        final getStudentTestSubjects = await savedLessonsRepository.getStudentTestSubjects();

        final getStudentTestTemplates = await savedLessonsRepository.getStudentTestTemplates();
        final getSavedTopic = await savedLessonsRepository.getSavedTopic();

        if (getStudentTestSubjects is Success) {
          // final getStudentTestSubjectsData = getStudentTestSubjects.data?["data"] as List<Map<String, dynamic>>;
          final getStudentTestSubjectsData = getStudentTestSubjects.data?["data"] as List<dynamic>;
          var corrects = 0;
          var counts = 0;

          for (var value in getStudentTestSubjectsData) {
            if (value['result'] == null) {
              counts += 10;
            } else {
              corrects += (value["result"]["max_result_corrects"] as int);
              counts += (value["result"]["question_count"] as int);
            }
          }
          await cache.setInt(cache.getStudentTestSubjects, getStudentTestSubjectsData.length);
          final per = (((corrects.toDouble() / counts.toDouble()) * 100) / getStudentTestSubjectsData.length);
          await cache.setDouble(cache.getStudentTestSubjectsPer, double.parse(per.toStringAsFixed(2).replaceAll(RegExp(r'\.?0*$'), '')));
        }

        if (getStudentTestTemplates is Success) {
          // final getStudentTestTemplatesData = getStudentTestTemplates.data?["data"] as List<Map<String, dynamic>>;
          final getStudentTestTemplatesData = getStudentTestTemplates.data?["data"] as List<dynamic>;
          var corrects = 0;
          var counts = 0;
          for (var value in getStudentTestTemplatesData) {
            if (value['result'] == null) {
              counts += 10;
            } else {
              corrects += (value["result"]["max_result_corrects"] as int);
              counts += (value["result"]["question_count"] as int);
            }
          }
          await cache.setInt(cache.getStudentTestTemplates, getStudentTestTemplatesData.length);
          final per = (((corrects.toDouble() / counts.toDouble()) * 100) / getStudentTestTemplatesData.length);
          await cache.setDouble(cache.getStudentTestTemplatesPer, double.parse(per.toStringAsFixed(2).replaceAll(RegExp(r'\.?0*$'), '')));
        }

        kprint("getSavedTopic->${getSavedTopic.data}");
        if (getSavedTopic is Success) {
          // final getSavedTopicData = getSavedTopic.data?["data"] as List<Map<String, dynamic>>;
          final getSavedTopicData = getSavedTopic.data?["data"]["data"] as List<dynamic>;
          var corrects = 0;
          var counts = 0;
          for (var value in getSavedTopicData) {
            if (value['test_result'] == null) {
              counts += 10;
            } else {
              corrects += (value["test_result"]["max_result_corrects"] as int);
              counts += (value["test_result"]["question_count"] as int);
            }
          }
          await cache.setInt(cache.getSavedTopic, getSavedTopicData.length);
          final per = (((corrects.toDouble() / counts.toDouble()) * 100) / getSavedTopicData.length);
          await cache.setDouble(cache.getSavedTopicPer, double.parse(per.toStringAsFixed(2).replaceAll(RegExp(r'\.?0*$'), '')));

        }
        emit(getSavedTopic);
        // emit(getStudentTestTemplates);
        // emit(getStudentTestSubjects);
      } catch (e) {
        emit(Error(message: e.toString(), data: null, code: 0));
      }
    });
  }
}
