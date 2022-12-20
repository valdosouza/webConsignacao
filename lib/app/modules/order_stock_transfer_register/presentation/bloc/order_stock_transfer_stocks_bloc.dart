import 'package:appweb/app/modules/order_stock_transfer_register/data/model/stock_list_model.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/domain/usecase/stock_list_getlist.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/enum/order_stock_transfer_type_enum.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'order_stock_transfer_stocks_event.dart';
part 'order_stock_transfer_stocks_state.dart';

class OrderStockTransferStocksBloc
    extends Bloc<OrderStockTransferStocksEvent, OrderStockTransferStocksState> {
  List<StockListModel> _stocklist = [];
  StockListModel? _oriStock;
  StockListModel? _desStock;
  OrderStockTransferStocksBloc({
    required this.getStockList,
  }) : super(OrderStockTransferRegisterStocksLoadingState()) {
    on<OrderStockTransferGetStocksEvent>(getStocks);
    on<OrderStockTransferRegisterStockOriEvent>(setStocksOri);
    on<OrderStockTransferRegisterStockDesEvent>(setStocksDes);
  }
  final StockListGetlist getStockList;
  void getStocks(
    OrderStockTransferGetStocksEvent event,
    Emitter<OrderStockTransferStocksState> emit,
  ) async {
    emit(OrderStockTransferRegisterStocksLoadingState());
    final response = await getStockList.call(
      ParamsGetListStock(
        institutionId: event.tbInstitutionId,
      ),
    );

    response.fold(
      (l) => emit(OrderStockTransferRegisterStockErrorState()),
      (r) {
        _stocklist = r;
        emit(
          OrderStockTransferRegisterReturnedStocksState(
            stocks: r,
            type: event.type,
          ),
        );
      },
    );
  }

  void setStocksOri(
    OrderStockTransferRegisterStockOriEvent event,
    Emitter<OrderStockTransferStocksState> emit,
  ) async {
    emit(OrderStockTransferRegisterStocksLoadingState());
    _oriStock = event.stock;
    emit(
      OrderStockTransferRegisterStockSuccessState(
        stock: event.stock,
        // orderId: event.orderId,
      ),
    );
  }

  void setStocksDes(
    OrderStockTransferRegisterStockDesEvent event,
    Emitter<OrderStockTransferStocksState> emit,
  ) async {
    emit(OrderStockTransferRegisterStocksLoadingState());
    _desStock = event.stock;
    emit(
      OrderStockTransferRegisterStockSuccessState(
        stock: event.stock,
        // orderId: event.orderId,
      ),
    );
  }
}
