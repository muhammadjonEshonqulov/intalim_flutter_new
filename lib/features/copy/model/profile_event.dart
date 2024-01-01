import 'package:meta/meta.dart';

@immutable
abstract class CopyEvent {}

class CopyEventData extends CopyEvent {}
