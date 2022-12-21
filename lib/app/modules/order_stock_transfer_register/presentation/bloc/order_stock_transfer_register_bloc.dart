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
  List<CustomerListModel>? _entities;
  List<StockListModel> _stocks = [];
  OrderStockTransferRegisterOrderModel? _order;
  List<OrderStockTransferRegisterOrderModel> _orders = [];
  List<StockListModel> get stocks => _stocks;
  List<OrderStockTransferRegisterOrderModel> get orders => _orders;
  OrderStockTransferRegisterOrderModel? get order => getCurrentOrder();
  bool get isEditing => order?.order.id == 0;

  OrderStockTransferRegisterBloc({
    required this.getlistOrderStock,
    required this.getOrderStock,
    required this.getStockList,
    required this.getEntityList,
  }) : super(OrderStockTransferRegisterLoadingState()) {
    on<OrderStockTransferRegisterGetListEvent>(getList);
    on<OrderStockTransferRegisterGetEvent>(get);
    on<OrderStockTransferNewRegisterEvent>(
      goToOrderStockTransferRegisterNewPage,
    );
    on<OrderStockTransferRegisterEditEvent>(goToOrderStockTransferRegisterPage);
    on<OrderStockTransferGetStocksEvent>(getStocks);
    on<OrderStockTransferGetEntitiesEvent>(getEntities);
    on<OrderStockTransferSearchEvent>(searchInOrders);
    on<OrderStockTransferSearchStocksEvent>(searchInStocks);
    on<OrderStockTransferSearchEntitiesEvent>(searchInEntities);
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
      _entities = r;
      emit(OrderStockTransferRegisterEntitiesState(entities: r));
    });
  }

  void searchInStocks(
    OrderStockTransferSearchStocksEvent event,
    Emitter<OrderStockTransferRegisterState> emit,
  ) async {
    late List<StockListModel> stocksSearched;

    if (_stocks.isNotEmpty) {
      emit(OrderStockTransferRegisterLoadingState());
      stocksSearched = _stocks.where((element) {
        String description = element.description;
        return description
            .toLowerCase()
            .trim()
            .contains(event.search.toLowerCase().trim());
      }).toList();
      emit(
        OrderStockTransferRegisterStockState(
          stocks: stocksSearched,
          type: OrderStockTransferRegisterStockType.none,
        ),
      );
    }
  }

  void searchInOrders(
    OrderStockTransferSearchEvent event,
    Emitter<OrderStockTransferRegisterState> emit,
  ) async {
    emit(OrderStockTransferRegisterLoadingState());

    late List<OrderStockTransferRegisterOrderModel> orderSearched;

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
      case OrderStockTransferRegisterSearch.stockOri:
        orderSearched = _orders.where((element) {
          String nameStockListOri = element.order.nameStockListOri;
          return nameStockListOri
              .toLowerCase()
              .trim()
              .contains(event.search.toLowerCase().trim());
        }).toList();
        break;
      case OrderStockTransferRegisterSearch.stockDes:
        orderSearched = _orders.where((element) {
          String nameStockListDes = element.order.nameStockListDes;
          return nameStockListDes
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

  void searchInEntities(
    OrderStockTransferSearchEntitiesEvent event,
    Emitter<OrderStockTransferRegisterState> emit,
  ) async {
    late List<CustomerListModel> entitiesSearched;

    if (_entities != null) {
      emit(OrderStockTransferRegisterLoadingState());
      entitiesSearched = _entities!.where((element) {
        String nameCompany = element.nameCompany;
        return nameCompany
            .toLowerCase()
            .trim()
            .contains(event.search.toLowerCase().trim());
      }).toList();
      emit(
        OrderStockTransferRegisterEntitiesState(entities: entitiesSearched),
      );
    }
  }

  void getList(
    OrderStockTransferRegisterGetListEvent event,
    Emitter<OrderStockTransferRegisterState> emit,
  ) async {
    emit(OrderStockTransferRegisterLoadingState());
    _oriStock = null;
    _desStock = null;
    // _orders = [];
    _order = null;
    _customer = null;
    var response = await getlistOrderStock
        .call(ParamsGetlistOrderStockTransferRegister(id: 1));

    response.fold((l) => emit(OrderStockTransferRegisterErrorState()), (r) {
      _orders = r;
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
    // final mainStock = _stocks.firstWhere((e) => e.main == 'S');
    // emit(
    // OrderStockTransferAddOrEditOrderState(
    //   order: OrderStockTransferRegisterOrderModel(
    //     order: Order(
    //       id: id,
    //       tbInstitutionId: tbInstitutionId,
    //       tbUserId: tbUserId,
    //       tbEntityId: _customer?.id ?? 0,
    //       nameEntity: _customer.nameCompany,
    //       tbStockListIdOri:mainStock.id
    //       nameStockListOri: mainStock.description,
    //       tbStockListIdDes: mainStock.id,
    //       nameStockListDes: mainStock.description,
    //       dtRecord: DateTime.now(),
    //       number: number,
    //       status: status,
    //       note: note,
    //     ),
    //     items: null,
    //   ),
    //   ),
    // );
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
        _stocks = r;
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
    // final mainStock = _stocks.firstWhere((e) => e.main == 'S');

    return OrderStockTransferRegisterOrderModel(
      order: Order(
        id: 0,
        tbInstitutionId: 0,
        tbUserId: 0,
        tbEntityId: _customer?.id ?? 0,
        nameEntity: _customer?.nameCompany ?? '',
        tbStockListIdOri: _oriStock?.id ?? 0,
        nameStockListOri: _oriStock?.description ?? '',
        tbStockListIdDes: _desStock?.id ?? 0,
        nameStockListDes: _desStock?.description ?? '',
        dtRecord: DateTime.now(),
        number: 0,
        status: 'A',
        note: '',
      ),
      items: null,
    );
  }
}
