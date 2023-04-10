import 'package:appweb/app/core/shared/utils/custom_date.dart';
import 'package:appweb/app/modules/Core/data/model/entity_list_model.dart';
import 'package:appweb/app/modules/Core/data/model/order_status_model.dart';
import 'package:appweb/app/modules/Core/data/model/product_list_model.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/data/model/order_stock_transfer_list_model.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/data/model/order_stock_transfer_main_model.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/data/model/order_stock_transfer_register_items_model.dart';
import 'package:appweb/app/modules/Core/data/model/stock_list_model.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/domain/usecase/entities_list_getlist.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/domain/usecase/order_stock_transfer_register_closure.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/domain/usecase/order_stock_transfer_register_delete.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/domain/usecase/order_stock_transfer_main_get.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/domain/usecase/order_stock_transfer_register_get_list.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/domain/usecase/order_stock_transfer_register_post.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/domain/usecase/order_stock_transfer_register_put.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/domain/usecase/order_stock_transfer_register_reopen.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/domain/usecase/product_get_list.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/domain/usecase/stock_list_getlist.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/bloc/event.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/bloc/state.dart';
import 'package:bloc/bloc.dart';

class OrderStockTransferRegisterBloc extends Bloc<
    OrderStockTransferRegisterEvent, OrderStockTransferRegisterState> {
  final OrderStockTransferMainGet getOrderStockTransfer;
  final OrderStockTransferRegisterGetlist getlistOrderStockTransfer;
  final OrderStockTransferRegisterPost postOrderStockTransfer;
  final OrderStockTransferRegisterPut putOrderStockTransfer;
  final OrderStockTransferRegisterDelete deleteOrderStockTransfer;
  final OrderStockTransferRegisterClosure closureOrderStocktransfer;
  final OrderStockTransferRegisterReopen reopenOrderStocktransfer;

  final ProductGetlist productGetlist;
  final StockListGetlist stockListGetlist;
  final EntitiesListGetlist entitiesListGetlist;

  List<OrderStockTransferListModel> orderStockTransfers = [];
  OrderStockTransferListModel orderStockTransList =
      OrderStockTransferListModel();
  OrderStockTransferMainModel orderMain = OrderStockTransferMainModel.empty();
  OrderStockTransferRegisterItemsModel orderItem =
      OrderStockTransferRegisterItemsModel.empty();
  List<ProductListModel> products = [];
  List<ProductListModel> productsTemp = [];
  int pageProducts = 0;

  List<StockListModel> stocks = [];
  List<EntityListModel> entities = [];
  StockListModel stock = StockListModel.empty();

  OrderStatusModel modelStatus = OrderStatusModel.empty();

  int tabIndex = 0;
  String search = "";
  OrderStockTransferRegisterBloc({
    required this.getOrderStockTransfer,
    required this.getlistOrderStockTransfer,
    required this.postOrderStockTransfer,
    required this.putOrderStockTransfer,
    required this.deleteOrderStockTransfer,
    required this.closureOrderStocktransfer,
    required this.reopenOrderStocktransfer,
    required this.productGetlist,
    required this.stockListGetlist,
    required this.entitiesListGetlist,
  }) : super(OrderLoadingState()) {
    orderGetList();

    orderNew();

    orderGet();

    orderReturnMaster();

    itemsNews();

    itemsEdit();

    itemDelete();

    productChosen();

    itemsUpdate();

    orderPost();

    orderPut();

    orderDelete();

    closureOrder();

    reopenOrder();

    getProducts();

    getStocks();

    getEntities();

    searchProducts();

    searchStocks();

    searchEntities();

    searchOrder();
  }

  orderGetList() {
    on<OrderGetListEvent>((event, emit) async {
      emit(OrderLoadingState());

      var response = await getlistOrderStockTransfer
          .call(ParamsGetlistOrderStockTransferRegister(id: 1));

      response.fold((l) => emit(OrderLoadedErrorState()), (r) {
        orderStockTransfers = r;
        emit(OrderLoadedSucessState());
      });
    });
  }

  orderNew() {
    on<OrderNewEvent>((event, emit) async {
      emit(OrderLoadingState());
      orderMain = OrderStockTransferMainModel.empty();
      emit(OrderNewLoadedState());
    });
  }

  orderPost() {
    on<OrderPostEvent>((event, emit) async {
      emit(OrderLoadingState());

      var response = await postOrderStockTransfer
          .call(ParamsPostOrderStockTransferRegister(model: orderMain));

      response.fold((l) => emit(OrderPostErrorState()), (r) {
        orderStockTransfers.add(r);
        emit(OrderPostSuccessState());
      });
    });
  }

  orderPut() {
    on<OrderPutEvent>((event, emit) async {
      emit(OrderLoadingState());

      var response = await putOrderStockTransfer
          .call(ParamsPutOrderStockTransferRegister(model: orderMain));

      response.fold((l) => emit(OrderPutErrorState()), (r) {
        orderStockTransfers[orderStockTransfers
            .indexWhere((element) => element.id == r.id)] = r;

        emit(OrderPutSuccessState());
      });
    });
  }

  orderDelete() {
    on<OrderDeleteEvent>((event, emit) async {
      emit(OrderLoadingState());

      var response = await deleteOrderStockTransfer
          .call(ParamsDeleteOrderStockTransferRegister(id: orderMain.order.id));

      response.fold((l) => emit(OrderDeleteErrorState()), (r) {
        orderStockTransfers
            .removeWhere((element) => element.id == orderMain.order.id);
        emit(OrderDeleteSuccessState());
      });
    });
  }

  closureOrder() {
    on<OrderClosureEvent>((event, emit) async {
      emit(OrderLoadingState());
      modelStatus.tbInstitutionId = orderMain.order.tbInstitutionId;
      modelStatus.id = orderMain.order.id;
      modelStatus.dtRecord = CustomDate.newDate();
      modelStatus.direction = "V";
      var response = await closureOrderStocktransfer
          .call(ParamsOrderStockTransferClosure(model: modelStatus));

      response.fold((l) {
        emit(OrderClosureErrorState());
      }, (r) {
        orderStockTransfers[orderStockTransfers
                .indexWhere((element) => element.id == modelStatus.id)]
            .status = "F";
        emit(OrderClosureSuccessState());
      });
    });
  }

  reopenOrder() {
    on<OrderReopenEvent>((event, emit) async {
      emit(OrderLoadingState());
      modelStatus.tbInstitutionId = orderMain.order.tbInstitutionId;
      modelStatus.id = orderMain.order.id;
      modelStatus.dtRecord = CustomDate.newDate();
      modelStatus.direction = "V";

      var response = await reopenOrderStocktransfer
          .call(ParamsOrderStocktransferReopen(model: modelStatus));

      response.fold((l) => emit(OrderClosureErrorState()), (r) {
        orderStockTransfers[orderStockTransfers
                .indexWhere((element) => element.id == modelStatus.id)]
            .status = "A";

        emit(OrderReopenSuccessState());
      });
    });
  }

  orderGet() {
    on<OrderGetEvent>((event, emit) async {
      emit(OrderLoadingState());

      final response = await getOrderStockTransfer.call(
          ParamsGetOrderStockTransferRegister(orderid: orderStockTransList.id));

      response.fold((l) => emit(OrderGetErrorState()), (r) {
        orderMain = r;
        emit(OrderGetLoadedState());
      });
    });
  }

  orderReturnMaster() {
    on<OrderReturnMainEvent>((event, emit) async {
      emit(OrderReturnMasterState());
    });
  }

  itemsNews() {
    on<OrderItemNewEvent>((event, emit) async {
      emit(OrderLoadingState());
      orderItem = OrderStockTransferRegisterItemsModel.empty();
      emit(OrderItemPageEditState());
    });
  }

  itemsEdit() {
    on<OrderItemEditEvent>((event, emit) async {
      emit(OrderItemPageEditState());
    });
  }

  itemDelete() {
    on<OrderItemDeleteEvent>((event, emit) async {
      if (orderItem.id > 0) {
        orderItem.updateStatus = "D";
        orderMain.items[orderMain.items
            .indexWhere((element) => element.id == orderItem.id)] = orderItem;
      } else {
        orderMain.items.removeWhere((item) => item == orderItem);
      }
      tabIndex = 1;

      emit(OrderItemUpdateSuccessState());
    });
  }

  productChosen() {
    on<ProductChosenEvent>((event, emit) {
      emit(ProductChosenSucessState());
    });
  }

  itemsUpdate() {
    on<OrderItemUpdateEvent>((event, emit) {
      if (orderItem.id > 0) {
        orderItem.updateStatus = "E";
        orderMain.items[orderMain.items
            .indexWhere((element) => element.id == orderItem.id)] = orderItem;
      } else {
        orderMain.items.add(OrderStockTransferRegisterItemsModel(
          id: 0,
          tbProductId: orderItem.tbProductId,
          nameProduct: orderItem.nameProduct,
          quantity: orderItem.quantity,
          updateStatus: "I",
        ));
      }
      tabIndex = 1;
      emit(OrderItemUpdateSuccessState());
    });
  }

  getProducts() {
    on<ProductsGetEvent>((event, emit) async {
      emit(OrderLoadingState());
      if (event.params.page == 0) {
        products.clear();
        productsTemp.clear;
        pageProducts = 1;
      } else {
        pageProducts += 1;
      }
      event.params.page = pageProducts;
      final response = await productGetlist.call(event.params);

      response.fold((l) => emit(ProductGetErrorState()), (r) {
        products += r;
        emit(ProductGetSucessState());
      });
    });
  }

  getStocks() {
    on<StocksGetEvent>((event, emit) async {
      emit(OrderLoadingState());

      final response = await stockListGetlist.call(ParamsGetListStock());

      response.fold((l) => emit(StocksLoadErrorState()), (r) {
        stocks = r;
        emit(StocksLoadSuccessState(type: event.type));
      });
    });
  }

  getEntities() {
    on<EntitiesGetEvent>((event, emit) async {
      emit(OrderLoadingState());

      final response = await entitiesListGetlist.call(ParamsGetListEntities());

      response.fold((l) => emit(EntityLoadErrorState()), (r) {
        entities = r;
        emit(EntitiesLoadSuccessState());
      });
    });
  }

  searchProducts() {
    on<ProductsSearchEvent>((event, emit) async {
      if (productsTemp.length < products.length) {
        productsTemp = products;
      } else {
        products = productsTemp;
      }
      if (search.isNotEmpty) {
        products = products
            .where(
              (element) => element.description
                  .toLowerCase()
                  .trim()
                  .contains(search.toLowerCase().trim()),
            )
            .toList();
      }
      emit(ProductSearchSucessState());
    });
  }

  searchStocks() {
    on<StockSearchEvent>((event, emit) async {
      if (search.isNotEmpty) {
        var stockSearched = stocks.where((element) {
          String name = element.description;
          int id = element.id;
          return (name
                  .toLowerCase()
                  .trim()
                  .contains(search.toLowerCase().trim()) ||
              id.toString() == search);
        }).toList();
        if (stockSearched.isNotEmpty) {
          emit(StockSearchSucessState());
        } else {
          emit(StockSearchErrorState());
        }
      } else {
        emit(StockSearchErrorState());
      }
    });
  }

  searchEntities() {
    on<EntitySearchEvent>((event, emit) async {
      if (search.isNotEmpty) {
        var entitiesSearched = entities.where((element) {
          String name = element.nickTrade;
          int id = element.id;
          return (name
                  .toLowerCase()
                  .trim()
                  .contains(search.toLowerCase().trim()) ||
              id.toString() == search);
        }).toList();
        if (entitiesSearched.isNotEmpty) {
          emit(EntitySearchSucessState());
        } else {
          emit(EntitySearchErrorState());
        }
      } else {
        emit(EntitySearchErrorState());
      }
    });
  }

  searchOrder() {
    on<OrderSearchEvent>((event, emit) async {
      if (search.isNotEmpty) {
        var orderStockTransfersSearched = orderStockTransfers.where((element) {
          String name = element.nameEntity;
          int id = element.id;
          String date = element.dtRecord;
          return (name
                  .toLowerCase()
                  .trim()
                  .contains(search.toLowerCase().trim()) ||
              date.toLowerCase().trim().contains(search.toLowerCase().trim()) ||
              id.toString() == search);
        }).toList();
        if (orderStockTransfersSearched.isNotEmpty) {
          emit(OrderLoadedSucessState());
        } else {
          emit(OrderLoadedErrorState());
        }
      } else {
        emit(OrderLoadedErrorState());
      }
    });
  }
}
