part of 'order_stock_transfer_stocks_bloc.dart';

abstract class OrderStockTransferStocksState extends Equatable {
  const OrderStockTransferStocksState();

  @override
  List<Object> get props => [];
}

class OrderStockTransferRegisterStocksLoadingState
    extends OrderStockTransferStocksState {}

class OrderStockTransferRegisterStockErrorState
    extends OrderStockTransferStocksState {}

class OrderStockTransferRegisterReturnedStocksState
    extends OrderStockTransferStocksState {
  const OrderStockTransferRegisterReturnedStocksState({
    required this.stocks,
    required this.type,
  });
  final List<StockListModel> stocks;
  final OrderStockTransferRegisterStockType type;
}

class OrderStockTransferRegisterStockSuccessState
    extends OrderStockTransferStocksState {
  const OrderStockTransferRegisterStockSuccessState({
    required this.stock,
  });
  final StockListModel stock;
}
