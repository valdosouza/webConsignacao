part of 'order_stock_transfer_register_bloc.dart';

abstract class OrderStockTransferRegisterEvent extends Equatable {
  const OrderStockTransferRegisterEvent();

  @override
  List<Object> get props => [];
}

class OrderStockTransferRegisterGetListEvent
    extends OrderStockTransferRegisterEvent {}

class OrderStockTransferSearchEvent extends OrderStockTransferRegisterEvent {
  const OrderStockTransferSearchEvent({
    required this.search,
    // required this.typeSearch,
  });
  final String search;
  // final OrderStockTransferRegisterSearch typeSearch;
}

class OrderStockTransferRegisterSelectFromIndex
    extends OrderStockTransferRegisterEvent {
  const OrderStockTransferRegisterSelectFromIndex({required this.newIndex});
  final int newIndex;
}

class OrderStockTransferRegisterGetEvent
    extends OrderStockTransferRegisterEvent {
  const OrderStockTransferRegisterGetEvent({required this.newIndex});
  final int newIndex;
}
