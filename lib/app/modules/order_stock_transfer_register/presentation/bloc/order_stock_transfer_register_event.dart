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

class OrderStockTransferNewRegisterEvent
    extends OrderStockTransferRegisterEvent {}

class OrderStockTransferRegisterGetEvent
    extends OrderStockTransferRegisterEvent {
  const OrderStockTransferRegisterGetEvent({
    required this.id,
  });
  final int id;
}

class OrderStockTransferGetStocksEvent extends OrderStockTransferRegisterEvent {
  const OrderStockTransferGetStocksEvent({
    required this.tbInstitutionId,
    // required this.orderId,
    required this.type,
  });
  final int tbInstitutionId;
  // final int? orderId;
  final OrderStockTransferRegisterStockType type;
}

class OrderStockTransferRegisterStockOriEvent
    extends OrderStockTransferRegisterGetListEvent {
  OrderStockTransferRegisterStockOriEvent({
    required this.stock,
    // required this.orderId,
  });
  final StockListModel stock;
  // final int? orderId;
}

class OrderStockTransferGetEntitiesEvent
    extends OrderStockTransferRegisterGetListEvent {
  OrderStockTransferGetEntitiesEvent();
}

class OrderStockTransferSelectedEntitiesEvent
    extends OrderStockTransferRegisterGetListEvent {
  OrderStockTransferSelectedEntitiesEvent({
    required this.entity,
  });
  final CustomerListModel entity;
}

class OrderStockTransferRegisterStockDesEvent
    extends OrderStockTransferRegisterGetListEvent {
  OrderStockTransferRegisterStockDesEvent({
    required this.stock,
    // required this.orderId,
  });
  final StockListModel stock;
  // final int? orderId;
}
