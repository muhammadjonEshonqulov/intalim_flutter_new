import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:intalim/common/repository/network_result.dart';
import 'package:intalim/common/services/utils/utils.dart';

import '../model/subject_test_data.dart';
import '../model/subject_tests_event.dart';
import '../repository/subject_tests_repository.dart';

class SubjectTestsBloc extends Bloc<SubjectTestsEvent, NetworkResult> {
  final SubjectTestsRepository savedLessonsRepository;

  SubjectTestsBloc(this.savedLessonsRepository) : super(const Loading()) {
    on<SubjectTestsEvent>((event, emit) async {
      emit(const Loading());

      try {
        // final subjectTestLocal = await _subjectTestRepository.getSubjectTestData();
        // if (subjectTestLocal.isNotEmpty) {
        //   fetchData();
        // }
        final subjectTestResult = await savedLessonsRepository.getStudentSubjectTestSubjects();
        kprint("getStudentSubjectTestSubjects-> ${subjectTestResult.data.toString()}");

        List<SubjectTestData> subjectTest = (subjectTestResult.data?['data'] as List).map((subjectTestJson) => SubjectTestData.fromJson(subjectTestJson)).toList();
        addData(subjectTest);
        emit(subjectTestResult);
      } catch (e) {
        fetchData();
        kprint("getStudentSubjectTestSubjects-> error ${e.toString()}");
        emit(Error(message: e.toString(), data: null, code: 0));
      }
    });
  }


  final _subjectTestController = StreamController<List<SubjectTestData>>.broadcast();
  final _subjectTestRepository = SubjectTestsRepository();

  Stream<List<SubjectTestData>> get subjectTestFromLocal => _subjectTestController.stream;

  void fetchData() async {
    final subjectTest = await _subjectTestRepository.getSubjectTestData();
    _subjectTestController.sink.add(subjectTest);
  }

  void addData(List<SubjectTestData> subjectTest) async {
    await _subjectTestRepository.insertSubjectTestData(subjectTest);
    fetchData();
  }

  void deleteData() async {
    await _subjectTestRepository.deleteSubjectTestData();
  }

  void dispose() {
    _subjectTestController.close();
  }
}
