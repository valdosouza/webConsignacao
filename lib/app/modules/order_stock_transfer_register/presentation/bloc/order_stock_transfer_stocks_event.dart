part of 'order_stock_transfer_stocks_bloc.dart';

abstract class OrderStockTransferStocksEvent extends Equatable {
  const OrderStockTransferStocksEvent();

  @override
  List<Object> get props => [];
}

class OrderStockTransferGetStocksEvent extends OrderStockTransferStocksEvent {
  const OrderStockTransferGetStocksEvent({
    required this.tbInstitutionId,
    required this.type,
  });
  final int tbInstitutionId;
  final OrderStockTransferRegisterStockType type;
}

class OrderStockTransferRegisterStockOriEvent
    extends OrderStockTransferStocksEvent {
  OrderStockTransferRegisterStockOriEvent({
    required this.stock,
  });
  final StockListModel stock;
  // final int? orderId;
}

class OrderStockTransferRegisterStockDesEvent
    extends OrderStockTransferStocksEvent {
  OrderStockTransferRegisterStockDesEvent({
    required this.stock,
  });
  final StockListModel stock;
}
