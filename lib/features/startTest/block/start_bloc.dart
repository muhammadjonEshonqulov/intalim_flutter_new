import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:intalim/common/repository/network_result.dart';

import '../../../db/cache.dart';
import '../repository/start_repository.dart';

part '../model/start_event.dart';

class StartTestBloc extends Bloc<StartTestEvent, NetworkResult> {
  final StartTestRepository loginRepository;

  StartTestBloc(this.loginRepository) : super(const Loading()) {
    on<StartTestEventData>((event, emit) async {
      emit(const Loading());

      try {
        final loginResult = await loginRepository.login(event.username, event.password);
        if (loginResult.data?["access_token"] != null) {
          await cache.setString('token', loginResult.data?["access_token"] ?? "");
          final meResult = await loginRepository.me(loginResult.data?["access_token"]);
          await cache.setInt(cache.role, meResult.data?["data"]["user"]["role"]);
          await cache.setString(cache.user_image_url, meResult.data?["data"]["user"]["image"] ?? "");
          await cache.setString(cache.username, event.username??"");
          await cache.setString(cache.password, event.password??"");
          await cache.setString(cache.fullname, meResult.data?["data"]["profession"]["first_name"] + " " + meResult.data?["data"]["profession"]["last_name"]);
          await cache.setString(cache.organization_user_uz, meResult.data?["data"]["profession"]["organization"]["name"]);

          emit(meResult);

          // emit(Success(data: meResult));
        } else
          emit(loginResult);
      } catch (e) {
        emit(Error(message: e.toString(), data: null, code: 0));
      }
    });
  }
}
