import 'package:appweb/app/modules/Core/data/model/region_model.dart';
import 'package:appweb/app/modules/sales_average/data/model/sales_average_model.dart';

abstract class SalesAverageState {}

class LoadingState extends SalesAverageState {}

class InitState extends SalesAverageState {}

class SalesAverageLoadedState extends SalesAverageState {
  final List<SalesAverageModel> list;

  SalesAverageLoadedState({required this.list});
}

class ErrorState extends SalesAverageState {
  final String msg;

  ErrorState({required this.msg});
}

class RegionLoadedState extends SalesAverageState {
  final List<RegionModel> list;

  RegionLoadedState({required this.list});
}

class MainFormLoadedState extends SalesAverageState {}
