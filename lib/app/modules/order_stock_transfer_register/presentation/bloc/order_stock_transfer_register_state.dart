// part of 'order_stock_transfer_register_bloc.dart';

//   OrderStockTransferRegisterOrderModel list;

part of 'order_stock_transfer_register_bloc.dart';

abstract class OrderStockTransferRegisterState extends Equatable {
  @override
  List<Object> get props => [];
}

class OrderStockTransferRegisterLoadingState
    extends OrderStockTransferRegisterState {}

class OrderStockTransferRegisterLoadedState
    extends OrderStockTransferRegisterState {
  OrderStockTransferRegisterLoadedState({
    required this.list,
  });

  final List<OrderStockTransferRegisterOrderModel> list;
}

class OrderStockTransferAddOrEditOrderState
    extends OrderStockTransferRegisterState {
  OrderStockTransferAddOrEditOrderState({required this.order});
  final OrderStockTransferRegisterOrderModel? order;
}

class OrderStockTransferRegisterErrorState
    extends OrderStockTransferRegisterState {}

class OrderStockTransferRegisterEntityState
    extends OrderStockTransferRegisterState {}

class OrderStockTransferRegisterStockErrorState
    extends OrderStockTransferRegisterState {}

class OrderStockTransferRegisterStockSuccessState
    extends OrderStockTransferRegisterState {
  OrderStockTransferRegisterStockSuccessState({
    required this.stocks,
    required this.type,
  });
  final List<StockListModel> stocks;
  final OrderStockTransferRegisterStockType type;
}

class OrderStockTransferRegisterEntitiesErrorState
    extends OrderStockTransferRegisterState {}

class OrderStockTransferRegisterEntitiesSuccessState
    extends OrderStockTransferRegisterState {
  OrderStockTransferRegisterEntitiesSuccessState({
    required this.entities,
  });
  final List<CustomerListModel> entities;
}

class OrderStockTransferRegisterStockOriSuccessState
    extends OrderStockTransferRegisterState {
  OrderStockTransferRegisterStockOriSuccessState({
    required this.stock,
    // required this.orderId,
  });
  final StockListModel stock;
  // final int? orderId;
}

class OrderStockTransferRegisterStockDesSuccessState
    extends OrderStockTransferRegisterState {
  OrderStockTransferRegisterStockDesSuccessState({
    required this.stock,
    // required this.orderId,
  });
  final StockListModel stock;
  // final int? orderId;
}
