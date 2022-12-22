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
  });
  final String search;
}

class OrderStockTransferRegisterGoToItemsEvent
    extends OrderStockTransferRegisterEvent {
  const OrderStockTransferRegisterGoToItemsEvent({
    this.items,
  });
  final List<Item>? items;
}

class OrderStockTransferRegisterAddMoreItemsEvent
    extends OrderStockTransferRegisterEvent {}

class OrderStockTransferRegisterShowSelectProductsPageEvent
    extends OrderStockTransferRegisterEvent {}

class OrderStockTransferRegisterEditItemPageEvent
    extends OrderStockTransferRegisterEvent {
  const OrderStockTransferRegisterEditItemPageEvent({required this.item});
  final Item? item;
}

class OrderStockTransferSearchStocksEvent
    extends OrderStockTransferRegisterEvent {
  const OrderStockTransferSearchStocksEvent({
    required this.search,
  });
  final String search;
}

class OrderStockTransferSearchEntitiesEvent
    extends OrderStockTransferRegisterEvent {
  const OrderStockTransferSearchEntitiesEvent({
    required this.search,
  });
  final String search;
}

class OrderStockTransferSearchProductsEvent
    extends OrderStockTransferRegisterEvent {
  const OrderStockTransferSearchProductsEvent({
    required this.search,
  });
  final String search;
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

class OrderStockTransferRegisterEditEvent
    extends OrderStockTransferRegisterEvent {
  const OrderStockTransferRegisterEditEvent({
    this.order,
  });
  final OrderStockTransferRegisterOrderModel? order;
}

class OrderStockTransferGetStocksEvent extends OrderStockTransferRegisterEvent {
  const OrderStockTransferGetStocksEvent({
    required this.tbInstitutionId,
    required this.type,
  });
  final int tbInstitutionId;
  final OrderStockTransferRegisterStockType type;
}

class OrderStockTransferRegisterStockOriEvent
    extends OrderStockTransferRegisterEvent {
  const OrderStockTransferRegisterStockOriEvent({
    required this.stock,
  });
  final StockListModel stock;
}

class OrderStockTransferGetEntitiesEvent
    extends OrderStockTransferRegisterEvent {
  const OrderStockTransferGetEntitiesEvent();
}

class OrderStockTransferSelectedEntitiesEvent
    extends OrderStockTransferRegisterEvent {
  const OrderStockTransferSelectedEntitiesEvent({
    required this.entity,
  });
  final CustomerListModel entity;
}

class OrderStockTransferRegisterStockDesEvent
    extends OrderStockTransferRegisterEvent {
  const OrderStockTransferRegisterStockDesEvent({
    required this.stock,
  });
  final StockListModel stock;
}

class OrderStockTransferRegisterPostEvent
    extends OrderStockTransferRegisterEvent {
  const OrderStockTransferRegisterPostEvent({required this.model});
  final OrderStockTransferRegisterOrderModel model;
}

class OrderStockTransferRegisterPutEvent
    extends OrderStockTransferRegisterEvent {
  const OrderStockTransferRegisterPutEvent({required this.model});
  final OrderStockTransferRegisterOrderModel model;
}

class OrderStockTransferRegisterDeleteEvent
    extends OrderStockTransferRegisterEvent {
  const OrderStockTransferRegisterDeleteEvent({required this.id});
  final int id;
}
