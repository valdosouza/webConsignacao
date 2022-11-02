import '../../data/models/sales_model.dart';

abstract class SalesState {
  final List<SalesModel> listSalesModel;

  SalesState({
    required this.listSalesModel,
  });
}

class SalesInitialState extends SalesState {
  SalesInitialState() : super(listSalesModel: []);
}

class SalesSuccessSate extends SalesState {
  SalesSuccessSate({
    required super.listSalesModel,
  });
}

class SalesAddSuccessSate extends SalesState {
  SalesAddSuccessSate({
    required super.listSalesModel,
  });
}

class SalesAddErrorSate extends SalesState {
  SalesAddErrorSate({
    required super.listSalesModel,
  });
}
