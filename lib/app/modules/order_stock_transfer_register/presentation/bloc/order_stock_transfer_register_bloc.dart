import 'package:appweb/app/modules/order_stock_transfer_register/data/model/entity_list_model.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/data/model/order_stock_transfer_register_order_model.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/domain/usecase/customer_list_getlist.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/domain/usecase/order_stock_transfer_register_get.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/domain/usecase/order_stock_transfer_register_get_list.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/domain/usecase/stock_list_getlist.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/enum/order_stock_transfer_search_enum.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/data/model/stock_list_model.dart';
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

  List<OrderStockTransferRegisterOrderModel> _ordersStock = [];
  OrderStockTransferRegisterOrderModel? _orderStock;
  StockListModel? _oriStock;
  StockListModel? _desStock;
  CustomerListModel? _customer;
  List<OrderStockTransferRegisterOrderModel> get ordersStock => _ordersStock;
  OrderStockTransferRegisterOrderModel? get orderStock => _orderStock;
  List<StockListModel> stockList = [];
  List<CustomerListModel> customerList = [];

  OrderStockTransferRegisterBloc({
    required this.getlistOrderStock,
    required this.getOrderStock,
    required this.getStockList,
    required this.getEntityList,
  }) : super(OrderStockTransferRegisterLoadingState()) {
    on<OrderStockTransferRegisterGetListEvent>(getList);
    on<OrderStockTransferRegisterGetEvent>(get);
    on<OrderStockTransferNewRegisterEvent>(goToOrderStockTransferRegisterPage);
    on<OrderStockTransferGetStocksEvent>(getStocks);
    on<OrderStockTransferGetEntitiesEvent>(getEntities);
    on<OrderStockTransferSearchEvent>(searchInOrders);
    on<OrderStockTransferRegisterStockOriEvent>(setStocksOri);
    on<OrderStockTransferRegisterStockDesEvent>(setStocksDes);
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
      customerList = r;
      emit(OrderStockTransferRegisterEntitiesSuccessState(entities: r));
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
        orderSearched = _ordersStock.where((element) {
          String dtRecord = OrderStockTransferRegisterOrderModel.formatDate(
              element.order.dtRecord.toString(), 'dd/MM/yyyy');
          return dtRecord
              .toLowerCase()
              .trim()
              .contains(event.search.toLowerCase().trim());
        }).toList();
        break;
      case OrderStockTransferRegisterSearch.entity:
        orderSearched = _ordersStock.where((element) {
          String nameEntity = element.order.nameEntity;
          return nameEntity
              .toLowerCase()
              .trim()
              .contains(event.search.toLowerCase().trim());
        }).toList();
        break;
      case OrderStockTransferRegisterSearch.stock:
        orderSearched = _ordersStock.where((element) {
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
    _ordersStock = [];
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
        _orderStock = r;
        _oriStock = event.stockOri ?? _oriStock;
        _desStock = event.stockDes ?? _desStock;
        _customer = event.entity ?? _customer;
        emit(
          OrderStockTransferAddOrEditOrderState(
            order: OrderStockTransferRegisterOrderModel(
              order: Order(
                id: r.order.id,
                tbInstitutionId: r.order.tbInstitutionId,
                tbUserId: r.order.tbUserId,
                tbEntityId: _customer?.id ?? r.order.tbEntityId,
                nameEntity: _customer?.nameCompany ?? r.order.nameEntity,
                tbStockListIdOri: _oriStock?.id ?? r.order.tbStockListIdOri,
                nameStockListOri:
                    _oriStock?.description ?? r.order.nameStockListOri,
                tbStockListIdDes: _desStock?.id ?? r.order.tbStockListIdDes,
                nameStockListDes:
                    _desStock?.description ?? r.order.nameStockListDes,
                dtRecord: r.order.dtRecord,
                number: r.order.number,
                status: r.order.status,
                note: r.order.note,
              ),
              items: r.items,
            ),
          ),
        );
      },
    );
  }

  void goToOrderStockTransferRegisterPage(
    OrderStockTransferNewRegisterEvent event,
    Emitter<OrderStockTransferRegisterState> emit,
  ) async {
    emit(OrderStockTransferRegisterLoadingState());
    emit(OrderStockTransferAddOrEditOrderState(order: null));
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
          OrderStockTransferRegisterStockSuccessState(
            stocks: r,
            type: event.type,
          ),
        );
      },
    );
  }
}

void setStocksOri(
  OrderStockTransferRegisterStockOriEvent event,
  Emitter<OrderStockTransferRegisterState> emit,
) async {
  emit(OrderStockTransferRegisterLoadingState());

  emit(
    OrderStockTransferRegisterStockOriSuccessState(
      stock: event.stock,
      // orderId: event.orderId,
    ),
  );
}

void setStocksDes(
  OrderStockTransferRegisterStockDesEvent event,
  Emitter<OrderStockTransferRegisterState> emit,
) async {
  emit(OrderStockTransferRegisterLoadingState());

  emit(
    OrderStockTransferRegisterStockDesSuccessState(
      stock: event.stock,
      // orderId: event.orderId,
    ),
  );
}
