import 'package:appweb/app/core/shared/utils/custom_date.dart';
import 'package:appweb/app/modules/Core/data/model/entity_list_model.dart';
import 'package:appweb/app/modules/Core/data/model/order_status_model.dart';
import 'package:appweb/app/modules/Core/data/model/product_list_model.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/data/model/order_stock_adjustment_list_model.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/data/model/order_stock_adjustment_main_model.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/data/model/order_stock_adjustment_register_items_model.dart';
import 'package:appweb/app/modules/Core/data/model/stock_list_model.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/domain/usecase/entities_list_getlist.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/domain/usecase/order_stock_adjustment_register_closure.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/domain/usecase/order_stock_adjustment_register_delete.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/domain/usecase/order_stock_adjustment_main_get.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/domain/usecase/order_stock_adjustment_register_get_list.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/domain/usecase/order_stock_adjustment_register_post.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/domain/usecase/order_stock_adjustment_register_put.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/domain/usecase/order_stock_adjustment_register_reopen.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/domain/usecase/product_get_list.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/domain/usecase/stock_list_getlist.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/bloc/order_stock_adjustment_register_event.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/bloc/order_stock_adjustment_register_state.dart';
import 'package:bloc/bloc.dart';

class OrderStockAdjustmentRegisterBloc extends Bloc<
    OrderStockAdjustmentRegisterEvent, OrderStockAdjustmentRegisterState> {
  final OrderStockAdjustmentMainGet getOrderStockAdjustment;
  final OrderStockAdjustmentRegisterGetlist getlistOrderStockAdjustment;
  final OrderStockAdjustmentRegisterPost postOrderStockAdjustment;
  final OrderStockAdjustmentRegisterPut putOrderStockAdjustment;
  final OrderStockAdjustmentRegisterDelete deleteOrderStockAdjustment;
  final OrderStockAdjustmentRegisterClosure closureOrderStockAdjustment;
  final OrderStockAdjustmentRegisterReopen reopenOrderStockAdjustment;

  final ProductGetlist productGetlist;
  final StockListGetlist stockListGetlist;
  final EntitiesListGetlist entitiesListGetlist;

  List<OrderStockAdjustmentListModel> orderStockAdjustments = [];
  OrderStockAdjustmentListModel orderStockTransList =
      OrderStockAdjustmentListModel();
  OrderStockAdjustmentMainModel orderMain =
      OrderStockAdjustmentMainModel.empty();
  OrderStockAdjustmentRegisterItemsModel orderItem =
      OrderStockAdjustmentRegisterItemsModel.empty();
  List<ProductListModel> products = [];
  List<StockListModel> stocks = [];
  List<EntityListModel> entities = [];
  StockListModel stock = StockListModel.empty();

  OrderStatusModel modelStatus = OrderStatusModel.empty();

  int tabIndex = 0;
  String search = "";
  OrderStockAdjustmentRegisterBloc({
    required this.getOrderStockAdjustment,
    required this.getlistOrderStockAdjustment,
    required this.postOrderStockAdjustment,
    required this.putOrderStockAdjustment,
    required this.deleteOrderStockAdjustment,
    required this.closureOrderStockAdjustment,
    required this.reopenOrderStockAdjustment,
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

      var response = await getlistOrderStockAdjustment
          .call(ParamsGetlistOrderStockAdjustmentRegister(id: 1));

      response.fold((l) => emit(OrderLoadedErrorState()), (r) {
        orderStockAdjustments = r;
        emit(OrderLoadedSucessState());
      });
    });
  }

  orderNew() {
    on<OrderNewEvent>((event, emit) async {
      emit(OrderLoadingState());
      orderMain = OrderStockAdjustmentMainModel.empty();
      emit(OrderNewLoadedState());
    });
  }

  orderPost() {
    on<OrderPostEvent>((event, emit) async {
      emit(OrderLoadingState());

      var response = await postOrderStockAdjustment
          .call(ParamsPostOrderStockAdjustmentRegister(model: orderMain));

      response.fold((l) => emit(OrderPostErrorState()), (r) {
        orderStockAdjustments.add(r);
        emit(OrderPostSuccessState());
      });
    });
  }

  orderPut() {
    on<OrderPutEvent>((event, emit) async {
      emit(OrderLoadingState());

      var response = await putOrderStockAdjustment
          .call(ParamsPutOrderStockAdjustmentRegister(model: orderMain));

      response.fold((l) => emit(OrderPutErrorState()), (r) {
        orderStockAdjustments[orderStockAdjustments
            .indexWhere((element) => element.id == r.id)] = r;

        emit(OrderPutSuccessState());
      });
    });
  }

  orderDelete() {
    on<OrderDeleteEvent>((event, emit) async {
      emit(OrderLoadingState());

      var response = await deleteOrderStockAdjustment.call(
          ParamsDeleteOrderStockAdjustmentRegister(id: orderMain.order.id));

      response.fold((l) => emit(OrderDeleteErrorState()), (r) {
        orderStockAdjustments
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
      var response = await closureOrderStockAdjustment
          .call(ParamsOrderStockAdjustmentClosure(model: modelStatus));

      response.fold((l) {
        emit(OrderClosureErrorState());
      }, (r) {
        orderStockAdjustments[orderStockAdjustments
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

      var response = await reopenOrderStockAdjustment
          .call(ParamsOrderStockAdjustmentReopen(model: modelStatus));

      response.fold((l) => emit(OrderClosureErrorState()), (r) {
        orderStockAdjustments[orderStockAdjustments
                .indexWhere((element) => element.id == modelStatus.id)]
            .status = "A";

        emit(OrderReopenSuccessState());
      });
    });
  }

  orderGet() {
    on<OrderGetEvent>((event, emit) async {
      emit(OrderLoadingState());

      final response = await getOrderStockAdjustment.call(
          ParamsGetOrderStockAdjustmentRegister(
              orderid: orderStockTransList.id));

      response.fold((l) => emit(OrderGetErrorState()), (r) {
        orderMain = r;
        emit(OrderGetLoadedState());
      });
    });
  }

  orderReturnMaster() {
    on<OrderReturnMasterEvent>((event, emit) async {
      emit(OrderReturnMasterState());
    });
  }

  itemsNews() {
    on<OrderItemNewEvent>((event, emit) async {
      emit(OrderLoadingState());
      orderItem = OrderStockAdjustmentRegisterItemsModel.empty();
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
        orderMain.items.add(OrderStockAdjustmentRegisterItemsModel(
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

      final response = await productGetlist.call(ParamsGetlistProduct(id: 1));

      response.fold((l) => emit(ProductGetErrorState()), (r) {
        products = r;
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
        emit(StocksLoadSuccessState());
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
      if (search.isNotEmpty) {
        var productstSearched = products.where((element) {
          String name = element.description;
          int id = element.id;
          return (name
                  .toLowerCase()
                  .trim()
                  .contains(search.toLowerCase().trim()) ||
              id.toString() == search);
        }).toList();
        if (productstSearched.isNotEmpty) {
          emit(ProductSearchSucessState());
        } else {
          emit(ProductSearchErrorState());
        }
      } else {
        emit(ProductSearchErrorState());
      }
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
        var orderStockAdjustmentsSearched =
            orderStockAdjustments.where((element) {
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
        if (orderStockAdjustmentsSearched.isNotEmpty) {
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
