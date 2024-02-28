import 'package:appweb/app/modules/Core/data/model/region_model.dart';

abstract class AttendanceOrderingState {}

class InitState extends AttendanceOrderingState {}

class LoadingState extends AttendanceOrderingState {}

class MainFormLoadedState extends AttendanceOrderingState {}

class ErrorState extends AttendanceOrderingState {
  final String msg;
  ErrorState({
    required this.msg,
  });
}

class RegionLoadedState extends AttendanceOrderingState {
  final List<RegionModel> list;
  RegionLoadedState({
    required this.list,
  });
}

class RouteLoadedState extends AttendanceOrderingState {}

class CustomerLoadedState extends AttendanceOrderingState {}
