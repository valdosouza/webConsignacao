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

class OrderStockTransferRegisterEntityErrorState
    extends OrderStockTransferRegisterState {}

class OrderStockTransferRegisterStockErrorState
    extends OrderStockTransferRegisterState {}

class OrderStockTransferRegisterStockState
    extends OrderStockTransferRegisterState {
  OrderStockTransferRegisterStockState({
    required this.stocks,
    required this.type,
  });
  final List<StockListModel> stocks;
  final OrderStockTransferRegisterStockType type;
}

class OrderStockTransferRegisterEntitiesErrorState
    extends OrderStockTransferRegisterState {}

class OrderStockTransferRegisterEntitiesState
    extends OrderStockTransferRegisterState {
  OrderStockTransferRegisterEntitiesState({
    required this.entities,
  });
  final List<CustomerListModel> entities;
}

class OrderStockTransferRegisterEntitiesSuccessState
    extends OrderStockTransferRegisterState {
  OrderStockTransferRegisterEntitiesSuccessState({
    required this.entity,
  });
  final CustomerListModel entity;
}

class OrderStockTransferRegisterStockSuccessState
    extends OrderStockTransferRegisterState {
  OrderStockTransferRegisterStockSuccessState({
    required this.stock,
    // required this.orderId,
  });
  final StockListModel stock;
  // final int? orderId;
}

class OrderProductionRegisterPostSuccessState
    extends OrderStockTransferRegisterState {
  OrderProductionRegisterPostSuccessState({required this.list});
  final List<OrderStockTransferRegisterOrderModel> list;
}

class OrderProductionRegisterPostErrorState
    extends OrderStockTransferRegisterState {
  OrderProductionRegisterPostErrorState({required this.list});
  final List<OrderStockTransferRegisterOrderModel> list;
}

class OrderProductionRegisterPutSuccessState
    extends OrderStockTransferRegisterState {
  OrderProductionRegisterPutSuccessState({required this.list});
  final List<OrderStockTransferRegisterOrderModel> list;
}

class OrderProductionRegisterPutErrorState
    extends OrderStockTransferRegisterState {
  OrderProductionRegisterPutErrorState({required this.list});
  final List<OrderStockTransferRegisterOrderModel> list;
}

class OrderProductionRegisterDeleteSuccessState
    extends OrderStockTransferRegisterState {
  OrderProductionRegisterDeleteSuccessState({required this.list});
  final List<OrderStockTransferRegisterOrderModel> list;
}

class OrderProductionRegisterDeleteErrorState
    extends OrderStockTransferRegisterState {
  OrderProductionRegisterDeleteErrorState({required this.list});
  final List<OrderStockTransferRegisterOrderModel> list;
}
