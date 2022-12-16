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
  final OrderStockTransferRegisterOrderModel order;
}

class OrderStockTransferRegisterErrorState
    extends OrderStockTransferRegisterState {}
