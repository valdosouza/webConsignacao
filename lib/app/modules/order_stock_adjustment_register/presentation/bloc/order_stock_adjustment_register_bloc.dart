import 'package:appweb/app/core/shared/utils/custom_date.dart';
import 'package:appweb/app/modules/Core/data/model/entity_list_model.dart';
import 'package:appweb/app/modules/Core/data/model/order_status_model.dart';
import 'package:appweb/app/modules/Core/data/model/product_list_model.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/data/model/order_stock_adjustment_register_items_model.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/data/model/order_stock_adjustment_register_model.dart';
import 'package:appweb/app/modules/Core/data/model/stock_list_model.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/domain/usecase/entities_list_getlist.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/domain/usecase/order_stock_adjustment_register_closure.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/domain/usecase/order_stock_adjustment_register_delete.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/domain/usecase/order_stock_adjustment_register_get.dart';
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
  final OrderStockAdjustmentRegisterGet getOrderStockAdjustment;
  final OrderStockAdjustmentRegisterGetlist getlistOrderStockAdjustment;
  final OrderStockAdjustmentRegisterPost postOrderStockAdjustment;
  final OrderStockAdjustmentRegisterPut putOrderStockAdjustment;
  final OrderStockAdjustmentRegisterDelete deleteOrderStockAdjustment;
  final OrderStockAdjustmentRegisterClosure closureOrderStockAdjustment;
  final OrderStockAdjustmentRegisterReopen reopenOrderStockAdjustment;

  final ProductGetlist productGetlist;
  final StockListGetlist stockListGetlist;
  final EntitiesListGetlist entitiesListGetlist;

  List<OrderStockAdjustmentRegisterModel> orderStockAdjustments = [];
  OrderStockAdjustmentRegisterModel orderStockAdjustment =
      OrderStockAdjustmentRegisterModel();
  List<ProductListModel> products = [];
  List<StockListModel> stocks = [];
  List<EntityListModel> entities = [];
  StockListModel stock = StockListModel.empty();
  OrderStockAdjustmentRegisterItemsModel item =
      OrderStockAdjustmentRegisterItemsModel.empty();
  bool edit = false;

  OrderStatusModel modelStatus = OrderStatusModel.empty();

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
  }) : super(OrderStockAdjustmentRegisterLoadingState()) {
    getList();

    goToOrderStockAdjustmentDesktopPage();

    // goToOrderStockAdjustmentMobilePage();
    goToItemsPage();

    postOrder();

    putOrder();

    deleteOrder();

    closureOrder();

    reopenOrder();

    getProducts();

    getStocks();

    getEntities();

    searchEventProducts();

    searchEventStocks();

    searchEventEntities();

    searchEventOrderStockAdjustment();

    changeDirection();

    on<OrderStockAdjustmentRegisterReturnEvent>((event, emit) {
      if (event.item != null) {
        orderStockAdjustment.items.removeWhere(
            (element) => element.tbProductId == event.item!.tbProductId);
        orderStockAdjustment.items.add(event.item!);
      }
      emit(OrderStockAdjustmentRegisterInfoPageState(
          list: [], tabIndex: event.tabIndex));
    });
  }

  formatItems() {
    if (stock.id != 0) {
      int index = 1;
      int orderId = orderStockAdjustment.id;
      orderStockAdjustment.items = orderStockAdjustment.items.map((e) {
        e.id = index++;
        e.tbOrderId = orderId;
        e.tbStockListId = stock.id;
        e.nameStockList = stock.description;
        return e;
      }).toList();
    }
  }

  getList() {
    on<OrderStockAdjustmentRegisterGetListEvent>((event, emit) async {
      emit(OrderStockAdjustmentRegisterLoadingState());

      var response = await getlistOrderStockAdjustment
          .call(ParamsGetlistOrderStockAdjustmentRegister());

      response.fold(
          (l) => emit(OrderStockAdjustmentRegisterErrorState(
              list: orderStockAdjustments)), (r) {
        orderStockAdjustments = r;
        emit(OrderStockAdjustmentRegisterLoadedState(list: r));
      });
    });
  }

  postOrder() {
    on<OrderStockAdjustmentRegisterPostEvent>((event, emit) async {
      emit(OrderStockAdjustmentRegisterLoadingState());
      formatItems();
      var response = await postOrderStockAdjustment
          .call(ParamsPostOrderStockAdjustmentRegister(model: event.model));

      response.fold(
          (l) => emit(OrderStockAdjustmentRegisterPostErrorState(
              list: orderStockAdjustments)), (r) {
        orderStockAdjustments.add(r);
        emit(OrderStockAdjustmentRegisterPostSuccessState(
            list: orderStockAdjustments));
      });
    });
  }

  putOrder() {
    on<OrderStockAdjustmentRegisterPutEvent>((event, emit) async {
      emit(OrderStockAdjustmentRegisterLoadingState());
      formatItems();
      var response = await putOrderStockAdjustment
          .call(ParamsPutOrderStockAdjustmentRegister(model: event.model));

      response.fold(
          (l) => event.model.id != 0
              ? emit(OrderStockAdjustmentRegisterPutErrorState(
                  list: orderStockAdjustments))
              : emit(OrderStockAdjustmentRegisterPutErrorState(
                  list: orderStockAdjustments)), (r) {
        orderStockAdjustments = orderStockAdjustments.map((element) {
          if (element.id == r.id) {
            element = r;
          }
          return element;
        }).toList();

        emit(OrderStockAdjustmentRegisterPutSuccessState(
            list: orderStockAdjustments));
      });
    });
  }

  deleteOrder() {
    on<OrderStockAdjustmentRegisterDeleteEvent>((event, emit) async {
      emit(OrderStockAdjustmentRegisterLoadingState());

      var response = await deleteOrderStockAdjustment
          .call(ParamsDeleteOrderStockAdjustmentRegister(id: event.model.id));

      response.fold(
          (l) => emit(OrderStockAdjustmentRegisterDeleteErrorState(
              list: orderStockAdjustments)), (r) {
        orderStockAdjustments
            .removeWhere((element) => element.id == event.model.id);
        emit(OrderStockAdjustmentRegisterDeleteSuccessState(
            list: orderStockAdjustments));
      });
    });
  }

  closureOrder() {
    on<OrderClosureEvent>((event, emit) async {
      emit(OrderStockAdjustmentRegisterLoadingState());
      modelStatus.tbInstitutionId = orderStockAdjustment.tbInstitutionId;
      modelStatus.id = orderStockAdjustment.id;
      modelStatus.dtRecord = CustomDate.newDate();
      modelStatus.direction = orderStockAdjustment.direction;
      var response = await closureOrderStockAdjustment
          .call(ParamsOrderStockAdjustmentClosure(model: modelStatus));

      response.fold((l) {
        emit(OrderClosureErrorState(
          list: orderStockAdjustments,
        ));
      }, (r) {
        orderStockAdjustments[orderStockAdjustments
                .indexWhere((element) => element.id == modelStatus.id)]
            .status = "F";
        emit(OrderClosureSuccessState(list: orderStockAdjustments, result: r));
      });
    });
  }

  reopenOrder() {
    on<OrderReopenEvent>((event, emit) async {
      emit(OrderStockAdjustmentRegisterLoadingState());
      modelStatus.tbInstitutionId = orderStockAdjustment.tbInstitutionId;
      modelStatus.id = orderStockAdjustment.id;
      modelStatus.dtRecord = CustomDate.newDate();
      modelStatus.direction = orderStockAdjustment.direction;

      var response = await reopenOrderStockAdjustment
          .call(ParamsOrderStockAdjustmentReopen(model: modelStatus));

      response.fold(
          (l) => emit(OrderClosureErrorState(
                list: orderStockAdjustments,
              )), (r) {
        orderStockAdjustments[orderStockAdjustments
                .indexWhere((element) => element.id == modelStatus.id)]
            .status = "A";

        emit(OrderReopenSuccessState(list: orderStockAdjustments, result: r));
      });
    });
  }

  goToOrderStockAdjustmentDesktopPage() {
    on<OrderStockAdjustmentRegisterDesktopEvent>((event, emit) async {
      if (event.model != null) {
        emit(OrderStockAdjustmentRegisterLoadingState());

        final response = await getOrderStockAdjustment
            .call(ParamsGetOrderStockAdjustmentRegister(id: event.model!.id));

        response.fold(
            (l) => emit(OrderStockAdjustmentRegisterGetErrorState(
                list: orderStockAdjustments)), (r) {
          orderStockAdjustment = r;
          if (r.items.isNotEmpty) {
            stock.description = r.items.first.description;
            stock.id = r.items.first.tbStockListId;
          }
          emit(
              OrderStockAdjustmentRegisterInfoPageState(list: [], tabIndex: 0));
        });
      } else {
        orderStockAdjustment = OrderStockAdjustmentRegisterModel();
        emit(OrderStockAdjustmentRegisterInfoPageState(list: [], tabIndex: 0));
      }
    });
  }

  goToItemsPage() {
    on<OrderStockAdjustmentRegisterItemEvent>((event, emit) async {
      if (event.item != null) {
        emit(OrderStockAdjustmentRegisterLoadingState());
        item = event.item! as OrderStockAdjustmentRegisterItemsModel;
        emit(OrderStockAdjustmentRegisterItemPage(item: item));
      } else {
        item = OrderStockAdjustmentRegisterItemsModel.empty();
        emit(OrderStockAdjustmentRegisterItemPage(item: item));
      }
    });
  }

  getProducts() {
    on<OrderStockAdjustmentRegisterGetProductsEvent>((event, emit) async {
      emit(OrderStockAdjustmentRegisterLoadingState());

      final response = await productGetlist.call(ParamsGetlistProduct());

      response.fold(
          (l) => emit(OrderStockAdjustmentRegisterProductErrorState()), (r) {
        products = r;
        emit(OrderStockAdjustmentRegisterProductSuccessState(products: r));
      });
    });
  }

  getStocks() {
    on<OrderStockAdjustmentRegisterGetStocksEvent>((event, emit) async {
      emit(OrderStockAdjustmentRegisterLoadingState());

      final response = await stockListGetlist.call(const ParamsGetListStock());

      response.fold((l) => emit(OrderStockAdjustmentRegisterStockErrorState()),
          (r) {
        stocks = r;
        emit(OrderStockAdjustmentRegisterStockSuccessState(stock: r));
      });
    });
  }

  getEntities() {
    on<OrderStockAdjustmentRegisterGetEntityEvent>((event, emit) async {
      emit(OrderStockAdjustmentRegisterLoadingState());

      final response = await entitiesListGetlist.call(ParamsGetListEntities());

      response.fold((l) => emit(OrderStockAdjustmentRegisterEntityErrorState()),
          (r) {
        entities = r;
        emit(OrderStockAdjustmentRegisterEntitySuccessState(entity: r));
      });
    });
  }

  searchEventProducts() {
    on<OrderStockAdjustmentRegisterSearchProductsEvent>((event, emit) async {
      if (event.search.isNotEmpty) {
        var productstSearched = products.where((element) {
          String name = element.description;
          int id = element.id;
          return (name
                  .toLowerCase()
                  .trim()
                  .contains(event.search.toLowerCase().trim()) ||
              id.toString() == event.search);
        }).toList();
        if (productstSearched.isNotEmpty) {
          emit(OrderStockAdjustmentRegisterProductSuccessState(
              products: productstSearched));
        } else {
          emit(OrderStockAdjustmentRegisterProductSuccessState(products: []));
        }
      } else {
        emit(OrderStockAdjustmentRegisterProductSuccessState(
            products: products));
      }
    });
  }

  searchEventStocks() {
    on<OrderStockAdjustmentRegisterSearchStocksEvent>((event, emit) async {
      if (event.search.isNotEmpty) {
        var stockSearched = stocks.where((element) {
          String name = element.description;
          int id = element.id;
          return (name
                  .toLowerCase()
                  .trim()
                  .contains(event.search.toLowerCase().trim()) ||
              id.toString() == event.search);
        }).toList();
        if (stockSearched.isNotEmpty) {
          emit(OrderStockAdjustmentRegisterStockSuccessState(
              stock: stockSearched));
        } else {
          emit(OrderStockAdjustmentRegisterStockSuccessState(stock: []));
        }
      } else {
        emit(OrderStockAdjustmentRegisterStockSuccessState(stock: stocks));
      }
    });
  }

  searchEventEntities() {
    on<OrderStockAdjustmentRegisterSearchEntityEvent>((event, emit) async {
      if (event.search.isNotEmpty) {
        var entitiesSearched = entities.where((element) {
          String name = element.nameCompany;
          int id = element.id;
          return (name
                  .toLowerCase()
                  .trim()
                  .contains(event.search.toLowerCase().trim()) ||
              id.toString() == event.search);
        }).toList();
        if (entitiesSearched.isNotEmpty) {
          emit(OrderStockAdjustmentRegisterEntitySuccessState(
              entity: entitiesSearched));
        } else {
          emit(OrderStockAdjustmentRegisterEntitySuccessState(entity: []));
        }
      } else {
        emit(OrderStockAdjustmentRegisterEntitySuccessState(entity: entities));
      }
    });
  }

  searchEventOrderStockAdjustment() {
    on<OrderStockAdjustmentRegisterSearchEvent>((event, emit) async {
      if (event.search.isNotEmpty) {
        var orderStockAdjustmentsSearched =
            orderStockAdjustments.where((element) {
          String name = element.nameEntity;
          int id = element.id;
          String date = element.dtRecord;
          return (name
                  .toLowerCase()
                  .trim()
                  .contains(event.search.toLowerCase().trim()) ||
              date
                  .toLowerCase()
                  .trim()
                  .contains(event.search.toLowerCase().trim()) ||
              id.toString() == event.search);
        }).toList();
        if (orderStockAdjustmentsSearched.isNotEmpty) {
          emit(OrderStockAdjustmentRegisterLoadedState(
              list: orderStockAdjustmentsSearched));
        } else {
          emit(OrderStockAdjustmentRegisterLoadedState(list: []));
        }
      } else {
        emit(OrderStockAdjustmentRegisterLoadedState(
            list: orderStockAdjustments));
      }
    });
  }

  changeDirection() {
    on<OrderStockAdjustmentRegisterChangeDirectionEvent>(
        (event, emit) async {});
  }
}
