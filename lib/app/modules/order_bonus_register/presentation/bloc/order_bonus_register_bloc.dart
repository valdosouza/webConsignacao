import 'package:appweb/app/core/shared/utils/custom_date.dart';
import 'package:appweb/app/modules/Core/data/model/entity_list_model.dart';
import 'package:appweb/app/modules/Core/data/model/order_status_model.dart';
import 'package:appweb/app/modules/Core/data/model/product_list_model.dart';
import 'package:appweb/app/modules/order_bonus_register/data/model/order_bonus_register_items_model.dart';
import 'package:appweb/app/modules/order_bonus_register/data/model/order_bonus_register_model.dart';
import 'package:appweb/app/modules/Core/data/model/stock_list_model.dart';
import 'package:appweb/app/modules/order_bonus_register/domain/usecase/entities_list_getlist.dart';
import 'package:appweb/app/modules/order_bonus_register/domain/usecase/order_bonus_register_closure.dart';
import 'package:appweb/app/modules/order_bonus_register/domain/usecase/order_bonus_register_delete.dart';
import 'package:appweb/app/modules/order_bonus_register/domain/usecase/order_bonus_register_get.dart';
import 'package:appweb/app/modules/order_bonus_register/domain/usecase/order_bonus_register_get_list.dart';
import 'package:appweb/app/modules/order_bonus_register/domain/usecase/order_bonus_register_post.dart';
import 'package:appweb/app/modules/order_bonus_register/domain/usecase/order_bonus_register_put.dart';
import 'package:appweb/app/modules/order_bonus_register/domain/usecase/order_bonus_register_reopen.dart';
import 'package:appweb/app/modules/order_bonus_register/domain/usecase/product_get_list.dart';
import 'package:appweb/app/modules/order_bonus_register/domain/usecase/stock_list_getlist.dart';
import 'package:appweb/app/modules/order_bonus_register/presentation/bloc/order_bonus_register_event.dart';
import 'package:appweb/app/modules/order_bonus_register/presentation/bloc/order_bonus_register_state.dart';
import 'package:bloc/bloc.dart';

class OrderBonusRegisterBloc
    extends Bloc<OrderBonusRegisterEvent, OrderBonusRegisterState> {
  final OrderBonusRegisterGet getOrderBonus;
  final OrderBonusRegisterGetlist getlistOrderBonus;
  final OrderBonusRegisterPost postOrderBonus;
  final OrderBonusRegisterPut putOrderBonus;
  final OrderBonusRegisterDelete deleteOrderBonus;
  final OrderBonusRegisterClosure closureOrderBonus;
  final OrderBonusRegisterReopen reopenOrderBonus;

  final ProductGetlist productGetlist;
  final StockListGetlist stockListGetlist;
  final EntitiesListGetlist entitiesListGetlist;

  List<OrderBonusRegisterModel> orderBonuss = [];
  OrderBonusRegisterModel orderBonus = OrderBonusRegisterModel();
  List<ProductListModel> products = [];
  List<StockListModel> stocks = [];
  List<EntityListModel> entities = [];
  StockListModel stock = StockListModel.empty();
  OrderBonusRegisterItemsModel item = OrderBonusRegisterItemsModel.empty();
  bool edit = false;

  OrderStatusModel modelStatus = OrderStatusModel.empty();

  OrderBonusRegisterBloc({
    required this.getOrderBonus,
    required this.getlistOrderBonus,
    required this.postOrderBonus,
    required this.putOrderBonus,
    required this.deleteOrderBonus,
    required this.closureOrderBonus,
    required this.reopenOrderBonus,
    required this.productGetlist,
    required this.stockListGetlist,
    required this.entitiesListGetlist,
  }) : super(OrderBonusRegisterLoadingState()) {
    getList();

    goToOrderBonusDesktopPage();

    // goToOrderBonusMobilePage();
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

    searchEventOrderBonus();

    changeDirection();

    on<OrderBonusRegisterReturnEvent>((event, emit) {
      if (event.item != null) {
        orderBonus.items.removeWhere(
            (element) => element.tbProductId == event.item!.tbProductId);
        orderBonus.items.add(event.item!);
      }
      emit(OrderBonusRegisterInfoPageState(list: [], tabIndex: event.tabIndex));
    });
  }

  formatItems() {
    if (stock.id != 0) {
      int index = 1;
      int orderId = orderBonus.id;
      orderBonus.items = orderBonus.items.map((e) {
        e.id = index++;
        e.tbOrderId = orderId;
        e.tbStockListId = stock.id;
        e.nameStockList = stock.description;
        return e;
      }).toList();
    }
  }

  getList() {
    on<OrderBonusRegisterGetListEvent>((event, emit) async {
      emit(OrderBonusRegisterLoadingState());

      var response =
          await getlistOrderBonus.call(ParamsGetlistOrderBonusRegister());

      response.fold(
          (l) => emit(OrderBonusRegisterErrorState(list: orderBonuss)), (r) {
        orderBonuss = r;
        emit(OrderBonusRegisterLoadedState(list: r));
      });
    });
  }

  postOrder() {
    on<OrderBonusRegisterPostEvent>((event, emit) async {
      emit(OrderBonusRegisterLoadingState());
      formatItems();
      var response = await postOrderBonus
          .call(ParamsPostOrderBonusRegister(model: event.model));

      response.fold(
          (l) => emit(OrderBonusRegisterPostErrorState(list: orderBonuss)),
          (r) {
        orderBonuss.add(r);
        emit(OrderBonusRegisterPostSuccessState(list: orderBonuss));
      });
    });
  }

  putOrder() {
    on<OrderBonusRegisterPutEvent>((event, emit) async {
      emit(OrderBonusRegisterLoadingState());
      formatItems();
      var response = await putOrderBonus
          .call(ParamsPutOrderBonusRegister(model: event.model));

      response.fold(
          (l) => event.model.id != 0
              ? emit(OrderBonusRegisterPutErrorState(list: orderBonuss))
              : emit(OrderBonusRegisterPutErrorState(list: orderBonuss)), (r) {
        orderBonuss = orderBonuss.map((element) {
          if (element.id == r.id) {
            element = r;
          }
          return element;
        }).toList();

        emit(OrderBonusRegisterPutSuccessState(list: orderBonuss));
      });
    });
  }

  deleteOrder() {
    on<OrderBonusRegisterDeleteEvent>((event, emit) async {
      emit(OrderBonusRegisterLoadingState());

      var response = await deleteOrderBonus
          .call(ParamsDeleteOrderBonusRegister(id: event.model.id));

      response.fold(
          (l) => emit(OrderBonusRegisterDeleteErrorState(list: orderBonuss)),
          (r) {
        orderBonuss.removeWhere((element) => element.id == event.model.id);
        emit(OrderBonusRegisterDeleteSuccessState(list: orderBonuss));
      });
    });
  }

  closureOrder() {
    on<OrderClosureEvent>((event, emit) async {
      emit(OrderBonusRegisterLoadingState());
      modelStatus.tbInstitutionId = orderBonus.tbInstitutionId;
      modelStatus.id = orderBonus.id;
      modelStatus.dtRecord = CustomDate.newDate();
      var response = await closureOrderBonus
          .call(ParamsOrderBonusClosure(model: modelStatus));

      response.fold((l) {
        emit(OrderClosureErrorState(
          list: orderBonuss,
        ));
      }, (r) {
        orderBonuss[orderBonuss
                .indexWhere((element) => element.id == modelStatus.id)]
            .status = "F";
        emit(OrderClosureSuccessState(list: orderBonuss, result: r));
      });
    });
  }

  reopenOrder() {
    on<OrderReopenEvent>((event, emit) async {
      emit(OrderBonusRegisterLoadingState());
      modelStatus.tbInstitutionId = orderBonus.tbInstitutionId;
      modelStatus.id = orderBonus.id;
      modelStatus.dtRecord = CustomDate.newDate();

      var response = await reopenOrderBonus
          .call(ParamsOrderBonusReopen(model: modelStatus));

      response.fold(
          (l) => emit(OrderClosureErrorState(
                list: orderBonuss,
              )), (r) {
        orderBonuss[orderBonuss
                .indexWhere((element) => element.id == modelStatus.id)]
            .status = "A";

        emit(OrderReopenSuccessState(list: orderBonuss, result: r));
      });
    });
  }

  goToOrderBonusDesktopPage() {
    on<OrderBonusRegisterDesktopEvent>((event, emit) async {
      if (event.model != null) {
        emit(OrderBonusRegisterLoadingState());

        final response = await getOrderBonus
            .call(ParamsGetOrderBonusRegister(id: event.model!.id));

        response.fold(
            (l) => emit(OrderBonusRegisterGetErrorState(list: orderBonuss)),
            (r) {
          orderBonus = r;
          if (r.items.isNotEmpty) {
            stock.description = r.items.first.description;
            stock.id = r.items.first.tbStockListId;
          }
          emit(OrderBonusRegisterInfoPageState(list: [], tabIndex: 0));
        });
      } else {
        orderBonus = OrderBonusRegisterModel();
        emit(OrderBonusRegisterInfoPageState(list: [], tabIndex: 0));
      }
    });
  }

  goToItemsPage() {
    on<OrderBonusRegisterItemEvent>((event, emit) async {
      if (event.item != null) {
        emit(OrderBonusRegisterLoadingState());
        item = event.item! as OrderBonusRegisterItemsModel;
        emit(OrderBonusRegisterItemPage(item: item));
      } else {
        item = OrderBonusRegisterItemsModel.empty();
        emit(OrderBonusRegisterItemPage(item: item));
      }
    });
  }

  getProducts() {
    on<OrderBonusRegisterGetProductsEvent>((event, emit) async {
      emit(OrderBonusRegisterLoadingState());

      final response = await productGetlist.call(ParamsGetlistProduct());

      response.fold((l) => emit(OrderBonusRegisterProductErrorState()), (r) {
        products = r;
        emit(OrderBonusRegisterProductSuccessState(products: r));
      });
    });
  }

  getStocks() {
    on<OrderBonusRegisterGetStocksEvent>((event, emit) async {
      emit(OrderBonusRegisterLoadingState());

      final response = await stockListGetlist.call(const ParamsGetListStock());

      response.fold((l) => emit(OrderBonusRegisterStockErrorState()), (r) {
        stocks = r;
        emit(OrderBonusRegisterStockSuccessState(stock: r));
      });
    });
  }

  getEntities() {
    on<OrderBonusRegisterGetEntityEvent>((event, emit) async {
      emit(OrderBonusRegisterLoadingState());

      final response = await entitiesListGetlist.call(ParamsGetListEntities());

      response.fold((l) => emit(OrderBonusRegisterEntityErrorState()), (r) {
        entities = r;
        emit(OrderBonusRegisterEntitySuccessState(entity: r));
      });
    });
  }

  searchEventProducts() {
    on<OrderBonusRegisterSearchProductsEvent>((event, emit) async {
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
          emit(OrderBonusRegisterProductSuccessState(
              products: productstSearched));
        } else {
          emit(OrderBonusRegisterProductSuccessState(products: []));
        }
      } else {
        emit(OrderBonusRegisterProductSuccessState(products: products));
      }
    });
  }

  searchEventStocks() {
    on<OrderBonusRegisterSearchStocksEvent>((event, emit) async {
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
          emit(OrderBonusRegisterStockSuccessState(stock: stockSearched));
        } else {
          emit(OrderBonusRegisterStockSuccessState(stock: []));
        }
      } else {
        emit(OrderBonusRegisterStockSuccessState(stock: stocks));
      }
    });
  }

  searchEventEntities() {
    on<OrderBonusRegisterSearchEntityEvent>((event, emit) async {
      if (event.search.isNotEmpty) {
        var entitiesSearched = entities.where((element) {
          String name = element.nickTrade;
          int id = element.id;
          return (name
                  .toLowerCase()
                  .trim()
                  .contains(event.search.toLowerCase().trim()) ||
              id.toString() == event.search);
        }).toList();
        if (entitiesSearched.isNotEmpty) {
          emit(OrderBonusRegisterEntitySuccessState(entity: entitiesSearched));
        } else {
          emit(OrderBonusRegisterEntitySuccessState(entity: []));
        }
      } else {
        emit(OrderBonusRegisterEntitySuccessState(entity: entities));
      }
    });
  }

  searchEventOrderBonus() {
    on<OrderBonusRegisterSearchEvent>((event, emit) async {
      if (event.search.isNotEmpty) {
        var orderBonussSearched = orderBonuss.where((element) {
          String name = element.nameCustomer;
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
        if (orderBonussSearched.isNotEmpty) {
          emit(OrderBonusRegisterLoadedState(list: orderBonussSearched));
        } else {
          emit(OrderBonusRegisterLoadedState(list: []));
        }
      } else {
        emit(OrderBonusRegisterLoadedState(list: orderBonuss));
      }
    });
  }

  changeDirection() {
    on<OrderBonusRegisterChangeDirectionEvent>((event, emit) async {});
  }
}
