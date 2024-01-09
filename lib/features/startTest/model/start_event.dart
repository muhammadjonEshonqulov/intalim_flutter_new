part of '../block/start_bloc.dart';

@immutable
abstract class StartTestEvent {}

class StartTestEventData extends StartTestEvent {
  final String username;
  final String password;

  StartTestEventData({required this.username, required this.password});
}
