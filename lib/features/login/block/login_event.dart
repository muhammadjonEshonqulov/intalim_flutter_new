part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginEventLogin extends LoginEvent {
  final String username;
  final String password;

  LoginEventLogin({required this.username, required this.password});
}
