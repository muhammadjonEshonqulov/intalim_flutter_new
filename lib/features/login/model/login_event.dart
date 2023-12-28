part of '../block/login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginEventData extends LoginEvent {
  final String username;
  final String password;

  LoginEventData({required this.username, required this.password});
}
