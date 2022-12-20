import 'package:appweb/app/modules/order_stock_transfer_register/data/model/entity_list_model.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/data/model/order_stock_transfer_register_order_model.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/data/model/stock_list_model.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/domain/usecase/customer_list_getlist.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/domain/usecase/order_stock_transfer_register_get.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/domain/usecase/order_stock_transfer_register_get_list.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/domain/usecase/stock_list_getlist.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/enum/order_stock_transfer_search_enum.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/enum/order_stock_transfer_type_enum.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'order_stock_transfer_register_event.dart';
part 'order_stock_transfer_register_state.dart';

class OrderStockTransferRegisterBloc extends Bloc<
    OrderStockTransferRegisterEvent, OrderStockTransferRegisterState> {
  final OrderStockTransferRegisterGetList getlistOrderStock;
  final OrderStockTransferRegisterGet getOrderStock;
  final StockListGetlist getStockList;
  final EntityListGetlist getEntityList;
  OrderStockTransferRegisterSearch typeSearch =
      OrderStockTransferRegisterSearch.date;

  StockListModel? _oriStock;
  StockListModel? _desStock;
  CustomerListModel? _customer;

  OrderStockTransferRegisterOrderModel? _order;
  final List<OrderStockTransferRegisterOrderModel> _orders = [];
  List<OrderStockTransferRegisterOrderModel> get orders => _orders;
  OrderStockTransferRegisterOrderModel? get order => getCurrentOrder();

  List<StockListModel> stockList = [];

  OrderStockTransferRegisterBloc({
    required this.getlistOrderStock,
    required this.getOrderStock,
    required this.getStockList,
    required this.getEntityList,
  }) : super(OrderStockTransferRegisterLoadingState()) {
    on<OrderStockTransferRegisterGetListEvent>(getList);
    on<OrderStockTransferRegisterGetEvent>(get);
    on<OrderStockTransferNewRegisterEvent>(
        goToOrderStockTransferRegisterNewPage);
    on<OrderStockTransferRegisterEditEvent>(goToOrderStockTransferRegisterPage);
    on<OrderStockTransferGetStocksEvent>(getStocks);
    on<OrderStockTransferGetEntitiesEvent>(getEntities);
    on<OrderStockTransferSearchEvent>(searchInOrders);
    on<OrderStockTransferRegisterStockOriEvent>(setStocksOri);
    on<OrderStockTransferRegisterStockDesEvent>(setStocksDes);
    on<OrderStockTransferSelectedEntitiesEvent>(setEntity);
  }
  void setEntity(
    OrderStockTransferSelectedEntitiesEvent event,
    Emitter<OrderStockTransferRegisterState> emit,
  ) {
    emit(OrderStockTransferRegisterLoadingState());
    _customer = event.entity;
    emit(OrderStockTransferRegisterEntitiesSuccessState(entity: event.entity));
  }

  void getEntities(
    OrderStockTransferGetEntitiesEvent event,
    Emitter<OrderStockTransferRegisterState> emit,
  ) async {
    emit(OrderStockTransferRegisterLoadingState());
    var response = await getEntityList.call(
      const ParamsGetListCustomer(
        institutionId: 1,
      ),
    );
    response.fold((l) => emit(OrderStockTransferRegisterErrorState()), (r) {
      // customerList = r;
      emit(OrderStockTransferRegisterEntitiesState(entities: r));
    });
  }

  void searchInOrders(
    OrderStockTransferSearchEvent event,
    Emitter<OrderStockTransferRegisterState> emit,
  ) async {
    late List<OrderStockTransferRegisterOrderModel> orderSearched;

    emit(OrderStockTransferRegisterLoadingState());

    switch (typeSearch) {
      case OrderStockTransferRegisterSearch.date:
        orderSearched = _orders.where((element) {
          String dtRecord = OrderStockTransferRegisterOrderModel.formatDate(
              element.order.dtRecord.toString(), 'dd/MM/yyyy');
          return dtRecord
              .toLowerCase()
              .trim()
              .contains(event.search.toLowerCase().trim());
        }).toList();
        break;
      case OrderStockTransferRegisterSearch.entity:
        orderSearched = _orders.where((element) {
          String nameEntity = element.order.nameEntity;
          return nameEntity
              .toLowerCase()
              .trim()
              .contains(event.search.toLowerCase().trim());
        }).toList();
        break;
      case OrderStockTransferRegisterSearch.stock:
        orderSearched = _orders.where((element) {
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
    _oriStock = null;
    _desStock = null;
    // _orders = [];
    // _order = null;
    _customer = null;
    var response = await getlistOrderStock
        .call(ParamsGetlistOrderStockTransferRegister(id: 1));

    response.fold((l) => emit(OrderStockTransferRegisterErrorState()), (r) {
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
        id: event.id,
        intitutionId: 1,
      ),
    );

    response.fold(
      (l) => emit(OrderStockTransferRegisterErrorState()),
      (r) {
        _order = r;
        emit(OrderStockTransferAddOrEditOrderState(order: _order));
      },
    );
  }

  void goToOrderStockTransferRegisterNewPage(
    OrderStockTransferNewRegisterEvent event,
    Emitter<OrderStockTransferRegisterState> emit,
  ) async {
    emit(OrderStockTransferRegisterLoadingState());
    // _oriStock = null;
    // _desStock = null;
    // _orders = [];
    // // _order= null;
    // _customer = null;
    emit(OrderStockTransferAddOrEditOrderState(order: null));
  }

  void goToOrderStockTransferRegisterPage(
    OrderStockTransferRegisterEditEvent event,
    Emitter<OrderStockTransferRegisterState> emit,
  ) async {
    emit(OrderStockTransferRegisterLoadingState());
    // _oriStock = null;
    // _desStock = null;
    // _orders = [];
    // // _order= null;
    // _customer = null;
    emit(OrderStockTransferAddOrEditOrderState(order: event.order));
  }

  void getStocks(
    OrderStockTransferGetStocksEvent event,
    Emitter<OrderStockTransferRegisterState> emit,
  ) async {
    emit(OrderStockTransferRegisterLoadingState());
    final response = await getStockList.call(
      ParamsGetListStock(
        institutionId: event.tbInstitutionId,
      ),
    );

    response.fold(
      (l) => emit(OrderStockTransferRegisterStockErrorState()),
      (r) {
        stockList = r;
        emit(
          OrderStockTransferRegisterStockState(
            stocks: r,
            type: event.type,
          ),
        );
      },
    );
  }

  void setStocksOri(
    OrderStockTransferRegisterStockOriEvent event,
    Emitter<OrderStockTransferRegisterState> emit,
  ) async {
    emit(OrderStockTransferRegisterLoadingState());
    _oriStock = event.stock;
    emit(
      OrderStockTransferRegisterStockSuccessState(
        stock: event.stock,
      ),
    );
  }

  void setStocksDes(
    OrderStockTransferRegisterStockDesEvent event,
    Emitter<OrderStockTransferRegisterState> emit,
  ) async {
    emit(OrderStockTransferRegisterLoadingState());
    _desStock = event.stock;
    emit(
      OrderStockTransferRegisterStockSuccessState(
        stock: event.stock,
        // orderId: event.orderId,
      ),
    );
  }

  OrderStockTransferRegisterOrderModel? getCurrentOrder() {
    if (_order != null) {
      final order = _order!.order;
      return OrderStockTransferRegisterOrderModel(
        order: Order(
          id: order.id,
          tbInstitutionId: order.tbInstitutionId,
          tbUserId: order.tbUserId,
          tbEntityId: _customer?.id ?? order.tbEntityId,
          nameEntity: _customer?.nameCompany ?? order.nameEntity,
          tbStockListIdOri: _oriStock?.id ?? order.tbStockListIdOri,
          nameStockListOri: _oriStock?.description ?? order.nameStockListOri,
          tbStockListIdDes: _desStock?.id ?? order.tbStockListIdDes,
          nameStockListDes: _desStock?.description ?? order.nameStockListDes,
          dtRecord: order.dtRecord,
          number: order.number,
          status: order.status,
          note: order.note,
        ),
        items: _order?.items,
      );
    }
    return null;
  }
}
