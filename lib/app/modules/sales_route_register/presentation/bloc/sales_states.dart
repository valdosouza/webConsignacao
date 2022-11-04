import '../../data/models/sales_model.dart';

abstract class SalesState {
  List<SalesModel> listSalesModel;

  SalesState({
    required this.listSalesModel,
  });
}

class SalesInitialState extends SalesState {
  SalesInitialState() : super(listSalesModel: []);
}

class SalesSuccessState extends SalesState {
  SalesSuccessState({
    required super.listSalesModel,
  });
}

class SalesAddSuccessState extends SalesState {
  SalesAddSuccessState({
    required super.listSalesModel,
  });
}

class SalesAddErrorState extends SalesState {
  SalesAddErrorState({required List<SalesModel> salesModel})
      : super(listSalesModel: salesModel);
}

class SalesEditSuccessState extends SalesState {
  SalesEditSuccessState({required List<SalesModel> salesList})
      : super(listSalesModel: salesList);
}

class SalesErrorState extends SalesState {
  SalesErrorState() : super(listSalesModel: []);
}

class SalesPutErrorState extends SalesState {
  SalesPutErrorState({required List<SalesModel> salesModelList})
      : super(listSalesModel: salesModelList);
}

class SalesDeleteSuccessState extends SalesState {
  SalesDeleteSuccessState({required List<SalesModel> paymentTypeList})
      : super(listSalesModel: paymentTypeList);
}

class SalesDeleteErrorState extends SalesState {
  SalesDeleteErrorState({required List<SalesModel> salesModelList})
      : super(listSalesModel: salesModelList);
}

class SalesInterationPageState extends SalesState {
  final SalesModel? salesModel;

  SalesInterationPageState({
    required List<SalesModel> salesList,
    this.salesModel,
  }) : super(listSalesModel: salesList);
}
