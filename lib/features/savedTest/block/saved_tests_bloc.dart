import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:intalim/common/repository/network_result.dart';
import 'package:intalim/common/services/utils/utils.dart';

import '../model/saved_test_data.dart';
import '../model/saved_tests_event.dart';
import '../repository/saved_tests_repository.dart';

class SavedTestsBloc extends Bloc<SavedTestsEvent, NetworkResult> {
  final SavedTestsRepository savedTestRepository;

  SavedTestsBloc(this.savedTestRepository) : super(const Loading()) {
    on<SavedTestsEvent>((event, emit) async {
      emit(const Loading());

      try {
        // deleteData();
        final savedTestLocal = await _savedTestRepository.getSavedTestData();
        kprint("savedTestLocal.size -> ${savedTestLocal.length}");
        if (savedTestLocal.isNotEmpty) {
          fetchData();
        }
        final savedTestResult = await savedTestRepository.getSavedTopic();
        kprint("getStudentSavedTest-> ${savedTestResult.data.toString()}");

        List<SavedTestData> savedTest = (savedTestResult.data?['data']['data'] as List).map((savedTestJson) => SavedTestData.fromJson(savedTestJson)).toList();
        addData(savedTest);
        emit(savedTestResult);
      } catch (e) {
        fetchData();
        kprint("getStudentSavedTestSaveds-> error ${e.toString()}");
        emit(Error(message: e.toString(), data: null, code: 0));
      }
    });
  }


  final _savedTestController = StreamController<List<SavedTestData>>.broadcast();
  final _savedTestRepository = SavedTestsRepository();

  Stream<List<SavedTestData>> get savedTestFromLocal => _savedTestController.stream;

  void fetchData() async {
    final savedTest = await _savedTestRepository.getSavedTestData();
    _savedTestController.sink.add(savedTest);
  }

  void addData(List<SavedTestData> savedTest) async {
    await _savedTestRepository.insertSavedTestData(savedTest);
    fetchData();
  }

  void deleteData() async {
    await _savedTestRepository.deleteSavedTestData();
  }

  void dispose() {
    _savedTestController.close();
  }
}
