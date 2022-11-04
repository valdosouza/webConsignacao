import 'package:appweb/app/modules/sales_route_register/data/models/sales_model.dart';

abstract class SalesEvent {}

class LoadSalesEvent extends SalesEvent {}

class AddSalesEvent extends SalesEvent {
  final SalesModel salesModel;

  AddSalesEvent({
    required this.salesModel,
  });
}

class EditSalesEvent extends SalesEvent {
  final SalesModel salesModel;

  EditSalesEvent({
    required this.salesModel,
  });
}

class SearchSalesEvent extends SalesEvent {
  String search;

  SearchSalesEvent({
    required this.search,
  });
}

class DeleteSalesEvent extends SalesEvent {
  int salesId;

  DeleteSalesEvent({
    required this.salesId,
  });
}

class SalesInteractionEvent extends SalesEvent {
  final SalesModel? salesModel;

  SalesInteractionEvent({
    this.salesModel,
  });
}
