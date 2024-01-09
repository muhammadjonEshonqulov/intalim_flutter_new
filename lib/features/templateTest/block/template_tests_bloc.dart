import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:intalim/common/repository/network_result.dart';
import 'package:intalim/common/services/utils/utils.dart';

import '../model/subject_tests_event.dart';
import '../model/template_test_data.dart';
import '../repository/template_tests_repository.dart';

class TemplateTestsBloc extends Bloc<TemplateTestsEvent, NetworkResult> {
  final TemplatesRepository savedLessonsRepository;

  TemplateTestsBloc(this.savedLessonsRepository) : super(const Loading()) {
    on<TemplateTestsEvent>((event, emit) async {
      emit(const Loading());

      try {
        // deleteData();
        final templateTestLocal = await _templateTestRepository.getTemplateData();
        if (templateTestLocal.isNotEmpty) {
          fetchData();
        }
        final templateTestResult = await savedLessonsRepository.getStudentTemplateTemplates();

        List<TemplateTestData> templateTest = (templateTestResult.data?['data'] as List).map((templateTestJson) => TemplateTestData.fromJson(templateTestJson)).toList();
        addData(templateTest);
        emit(templateTestResult);
      } catch (e) {
        fetchData();
        emit(Error(message: e.toString(), data: null, code: 0));
      }
    });
  }


  final _templateTestController = StreamController<List<TemplateTestData>>.broadcast();
  final _templateTestRepository = TemplatesRepository();

  Stream<List<TemplateTestData>> get templateTestFromLocal => _templateTestController.stream;

  void fetchData() async {
    final templateTest = await _templateTestRepository.getTemplateData();
    _templateTestController.sink.add(templateTest);
  }

  void addData(List<TemplateTestData> templateTest) async {
    await _templateTestRepository.insertTemplateData(templateTest);
    fetchData();
  }

  void deleteData() async {
    await _templateTestRepository.deleteTemplateData();
  }

  void dispose() {
    _templateTestController.close();
  }
}
