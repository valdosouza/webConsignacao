import 'package:appweb/app/modules/sales_route_register/data/models/sales_model.dart';

abstract class SalesEvent {}

class LoadSalesEvent extends SalesEvent {}

class AddSalesEvent extends SalesEvent {
  final SalesModel salesModel;

  AddSalesEvent({
    required this.salesModel,
  });
}

class SalesInteractionEvent extends SalesEvent {
  final SalesModel? salesModel;

  SalesInteractionEvent({
    this.salesModel,
  });
}
