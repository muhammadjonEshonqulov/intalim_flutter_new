part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class LoginSuccess extends LoginState {}
class LoginSuccessSecond extends LoginState {}
class SuccessCheckStatusImzo extends LoginState {}

class LoginFailed extends LoginState {}
class LoginFailedEImzo extends LoginState {}
class LoginLoading extends LoginState {
  final bool loading;
  LoginLoading({required this.loading});
}
