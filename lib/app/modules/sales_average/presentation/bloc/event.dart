import 'package:appweb/app/modules/sales_average/domain/usecase/get_sales_average.dart';

abstract class SalesAverageEvent {}

class InitEvent extends SalesAverageEvent {}

class GetSalesAverageEvent extends SalesAverageEvent {
  final ParamsGetSales params;

  GetSalesAverageEvent({required this.params});
}

class GetRegionListEvent extends SalesAverageEvent {}

class MainFormEvent extends SalesAverageEvent {}
