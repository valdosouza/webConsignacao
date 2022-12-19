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

class OrderStockTransferGetStocksEvent extends OrderStockTransferRegisterEvent {
  const OrderStockTransferGetStocksEvent({required this.tbInstitutionId});
  final int tbInstitutionId;
}

class OrderStockTransferRegisterGetEvent
    extends OrderStockTransferRegisterEvent {
  const OrderStockTransferRegisterGetEvent({required this.newIndex});
  final int newIndex;
}
