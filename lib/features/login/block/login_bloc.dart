import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:intalim/features/login/model/login_response.dart';

import '../../../db/cache.dart';
import '../repository/login_repository.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository loginRepository;

  LoginBloc(this.loginRepository) : super(LoginInitial()) {
    LoginResponse? loginResponse;

    on<LoginEventLogin>((event, emit) async {
      emit(LoginLoading(loading: true));

      try {
        final result = await loginRepository.login(event.username, event.password);
        loginResponse = result;

        if (loginResponse?.accessToken != null) {
          emit(LoginLoading(loading: false));

          print("loginResponse->$loginResponse");
          await cache.setString('token', loginResponse!.accessToken ?? "");
          // await loginRepository.saveUser(loginResponse!.user!);

          emit(LoginLoading(loading: false));
          emit(LoginSuccess());
        } else {
          emit(LoginLoading(loading: false));
          emit(LoginFailed());
        }
      } catch (e) {
        print('LOGIN ERROR: $e');
        emit(LoginFailed());
        emit(LoginLoading(loading: false));
      }
    });
  }

  void showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Хатолик'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('Ёпиш'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
