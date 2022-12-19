import 'package:appweb/app/modules/order_stock_transfer_register/data/model/order_stock_transfer_register_order_model.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/domain/usecase/order_stock_transfer_register_get.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/domain/usecase/order_stock_transfer_register_get_list.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/domain/usecase/stock_list_getlist.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/enum/order_stock_transfer_search_enum.dart';
import 'package:appweb/app/modules/stock_list_register/data/model/stock_list_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'order_stock_transfer_register_event.dart';
part 'order_stock_transfer_register_state.dart';

class OrderStockTransferRegisterBloc extends Bloc<
    OrderStockTransferRegisterEvent, OrderStockTransferRegisterState> {
  final OrderStockTransferRegisterGetList getlistOrderStock;
  final OrderStockTransferRegisterGet getOrderStock;
  final StockListGetlist getStockList;
  OrderStockTransferRegisterSearch typeSearch =
      OrderStockTransferRegisterSearch.date;

  List<OrderStockTransferRegisterOrderModel> ordersStock = [];
  List<StockListModel> stockList = [];

  OrderStockTransferRegisterBloc({
    required this.getlistOrderStock,
    required this.getOrderStock,
    required this.getStockList,
  }) : super(OrderStockTransferRegisterLoadingState()) {
    on<OrderStockTransferRegisterGetListEvent>(getList);
    on<OrderStockTransferRegisterGetEvent>(get);
    on<OrderStockTransferNewRegisterEvent>(goToOrderStockTransferRegisterPage);
    on<OrderStockTransferSearchEvent>(searchInOrders);
    on<OrderStockTransferGetStocksEvent>(getStocks);
  }
  void searchInOrders(
    OrderStockTransferSearchEvent event,
    Emitter<OrderStockTransferRegisterState> emit,
  ) async {
    late List<OrderStockTransferRegisterOrderModel> orderSearched;

    emit(OrderStockTransferRegisterLoadingState());

    switch (typeSearch) {
      case OrderStockTransferRegisterSearch.date:
        orderSearched = ordersStock.where((element) {
          String dtRecord = OrderStockTransferRegisterOrderModel.formatDate(
              element.order.dtRecord.toString(), 'dd/MM/yyyy');
          return dtRecord
              .toLowerCase()
              .trim()
              .contains(event.search.toLowerCase().trim());
        }).toList();
        break;
      case OrderStockTransferRegisterSearch.entity:
        orderSearched = ordersStock.where((element) {
          String nameEntity = element.order.nameEntity;
          return nameEntity
              .toLowerCase()
              .trim()
              .contains(event.search.toLowerCase().trim());
        }).toList();
        break;
      case OrderStockTransferRegisterSearch.stock:
        orderSearched = ordersStock.where((element) {
          String nameStockListOri = element.order.nameStockListOri;
          return nameStockListOri
              .toLowerCase()
              .trim()
              .contains(event.search.toLowerCase().trim());
        }).toList();
        break;
    }
    emit(
      OrderStockTransferRegisterLoadedState(list: orderSearched),
    );
  }

  void getList(
    OrderStockTransferRegisterGetListEvent event,
    Emitter<OrderStockTransferRegisterState> emit,
  ) async {
    emit(OrderStockTransferRegisterLoadingState());

    var response = await getlistOrderStock
        .call(ParamsGetlistOrderStockTransferRegister(id: 1));

    response.fold((l) => emit(OrderStockTransferRegisterErrorState()), (r) {
      ordersStock = r;
      emit(OrderStockTransferRegisterLoadedState(list: r));
    });
  }

  void get(
    OrderStockTransferRegisterGetEvent event,
    Emitter<OrderStockTransferRegisterState> emit,
  ) async {
    emit(OrderStockTransferRegisterLoadingState());

    var response = await getOrderStock.call(
      ParamsGetOrderStockTransferRegister(
        id: event.newIndex,
        intitutionId: 1,
      ),
    );

    response.fold((l) => emit(OrderStockTransferRegisterErrorState()), (r) {
      emit(
        OrderStockTransferAddOrEditOrderState(order: r),
      );
    });
  }

  void goToOrderStockTransferRegisterPage(
    OrderStockTransferNewRegisterEvent event,
    Emitter<OrderStockTransferRegisterState> emit,
  ) async {
    emit(OrderStockTransferRegisterLoadingState());
    emit(OrderStockTransferRegisterLoadingState());
  }

  void getStocks(
    OrderStockTransferGetStocksEvent event,
    Emitter<OrderStockTransferRegisterState> emit,
  ) async {
    emit(OrderStockTransferRegisterLoadingState());
    final response = await getStockList
        .call(ParamsGetListStock(institutionId: event.tbInstitutionId));

    response.fold((l) => emit(OrderStockTransferRegisterStockErrorState()),
        (r) {
      stockList = r;
      emit(OrderStockTransferRegisterStockSuccessState(stocks: r));
    });
  }
}
