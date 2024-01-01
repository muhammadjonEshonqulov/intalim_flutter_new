import 'package:bloc/bloc.dart';
import 'package:intalim/common/repository/network_result.dart';
import 'package:intalim/common/services/utils/utils.dart';

import '../../../db/cache.dart';
import '../model/profile_event.dart';
import '../repository/profile_repository.dart';

class ProfileBloc extends Bloc<ProfileEvent, NetworkResult> {
  final ProfileRepository loginRepository;

  ProfileBloc(this.loginRepository) : super(const Loading()) {
    on<ProfileEventData>((event, emit) async {
      emit(const Loading());

      try {
        final username = await cache.getString(cache.username) ?? "";
        final password = await cache.getString(cache.password) ?? "";
        // await cache.clear();
        final meResult = await loginRepository.me();
        kprint("me -> ${meResult.code} -> ${meResult.data}");
        if (meResult.code == 401) {
          final loginResult = await loginRepository.login(username, password);
          kprint("loginResult -> ${loginResult.code} -> ${loginResult.data}");
          if (loginResult.data?["access_token"] != null) {
            await cache.setString('token', loginResult.data?["access_token"] ?? "");
            await cache.setInt(cache.role, meResult.data?["data"]["user"]["role"]);
            await cache.setString(cache.user_image_url, meResult.data?["data"]["user"]["image"] ?? "");
            await cache.setString(cache.fullname, meResult.data?["data"]["profession"]["first_name"] + " " + meResult.data?["data"]["profession"]["last_name"]);
            await cache.setString(cache.organization_user_uz, meResult.data?["data"]["profession"]["organization"]["name"]);
          } else {
            // await cache.clear();
            emit(loginResult);
          }
        } else {
          emit(meResult);
        }
      } catch (e) {
        emit(Error(message: e.toString(), data: null, code: 0));
      }
    });
  }
}
