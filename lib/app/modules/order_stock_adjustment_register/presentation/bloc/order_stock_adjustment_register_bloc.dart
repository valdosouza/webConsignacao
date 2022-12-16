import 'package:appweb/app/modules/Core/data/model/entity_model.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/data/model/order_stock_adjustment_register_model.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/data/model/product_model.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/data/model/stock_list_model.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/domain/usecase/entities_list_getlist.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/domain/usecase/order_stock_adjustment_register_delete.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/domain/usecase/order_stock_adjustment_register_get.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/domain/usecase/order_stock_adjustment_register_get_list.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/domain/usecase/order_stock_adjustment_register_post.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/domain/usecase/order_stock_adjustment_register_put.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/domain/usecase/product_get_list.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/domain/usecase/stock_list_getlist.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/bloc/order_stock_adjustment_register_event.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/bloc/order_stock_adjustment_register_state.dart';
import 'package:bloc/bloc.dart';

class OrderStockAdjustmentRegisterBloc
    extends Bloc<OrderStockAdjustmentRegisterEvent, OrderStockAdjustmentRegisterState> {
  final OrderStockAdjustmentRegisterGet getOrderStockAdjustment;
  final OrderStockAdjustmentRegisterGetlist getlistOrderStockAdjustment;
  final OrderStockAdjustmentRegisterPost postOrderStockAdjustment;
  final OrderStockAdjustmentRegisterPut putOrderStockAdjustment;
  final OrderStockAdjustmentRegisterDelete deleteOrderStockAdjustment;
  final ProductGetlist productGetlist;
  final StockListGetlist stockListGetlist;
  final EntitiesListGetlist entitiesListGetlist;

  List<OrderStockAdjustmentRegisterModel> orderStockAdjustments = [];
  OrderStockAdjustmentRegisterModel orderStockAdjustment = OrderStockAdjustmentRegisterModel();
  List<ProductModel> products = [];
  List<StockListModel> stocks = [];
  List<EntityModel> entities = [];
  StockListModel sotck = StockListModel();
  bool edit = false;

  OrderStockAdjustmentRegisterBloc({
    required this.getOrderStockAdjustment,
    required this.getlistOrderStockAdjustment,
    required this.postOrderStockAdjustment,
    required this.putOrderStockAdjustment,
    required this.deleteOrderStockAdjustment,
    required this.productGetlist,
    required this.stockListGetlist,
    required this.entitiesListGetlist,
  }) : super(OrderStockAdjustmentRegisterLoadingState()) {
    getList();

    goToOrderStockAdjustmentDesktopPage();

    // goToOrderStockAdjustmentMobilePage();

    postOrderStockAdjustmentAction();

    putOrderStockAdjustmentAction();

    deleteOrderStockAdjustmentAction();

    getProducts();

    getStocks();

    getEntities();

    searchEventProducts();

    searchEventStocks();

    searchEventEntities();

    searchEventOrderStockAdjustment();

    on<OrderStockAdjustmentRegisterReturnEvent>(
        (event, emit) => emit(OrderStockAdjustmentRegisterInfoPageState(list: [])));
  }

  getList() {
    on<OrderStockAdjustmentRegisterGetListEvent>((event, emit) async {
      emit(OrderStockAdjustmentRegisterLoadingState());

      var response = await getlistOrderStockAdjustment
          .call(ParamsGetlistOrderStockAdjustmentRegister(id: 1));

      response.fold(
          (l) =>
              emit(OrderStockAdjustmentRegisterErrorState(list: orderStockAdjustments)),
          (r) {
        orderStockAdjustments = r;
        emit(OrderStockAdjustmentRegisterLoadedState(list: r));
      });
    });
  }

  postOrderStockAdjustmentAction() {
    on<OrderStockAdjustmentRegisterPostEvent>((event, emit) async {
      emit(OrderStockAdjustmentRegisterLoadingState());

      var response = await postOrderStockAdjustment
          .call(ParamsPostOrderStockAdjustmentRegister(model: event.model));

      response.fold(
          (l) => emit(
              OrderStockAdjustmentRegisterPostErrorState(list: orderStockAdjustments)),
          (r) {
        orderStockAdjustments.add(r);
        emit(OrderStockAdjustmentRegisterPostSuccessState(list: orderStockAdjustments));
      });
    });
  }

  putOrderStockAdjustmentAction() {
    on<OrderStockAdjustmentRegisterPutEvent>((event, emit) async {
      emit(OrderStockAdjustmentRegisterLoadingState());

      var response = await putOrderStockAdjustment
          .call(ParamsPutOrderStockAdjustmentRegister(model: event.model));

      response.fold(
          (l) => event.model.id != 0
              ? emit(
                  OrderStockAdjustmentRegisterPutErrorState(list: orderStockAdjustments))
              : emit(
                  OrderStockAdjustmentRegisterPutErrorState(list: orderStockAdjustments)),
          (r) {
        orderStockAdjustments.removeWhere((element) => element.id == r.id);
        orderStockAdjustments.add(r);
        emit(OrderStockAdjustmentRegisterPutSuccessState(list: orderStockAdjustments));
      });
    });
  }

  deleteOrderStockAdjustmentAction() {
    on<OrderStockAdjustmentRegisterDeleteEvent>((event, emit) async {
      emit(OrderStockAdjustmentRegisterLoadingState());

      var response = await deleteOrderStockAdjustment
          .call(ParamsDeleteOrderStockAdjustmentRegister(id: event.model.id));

      response.fold(
          (l) => emit(
              OrderStockAdjustmentRegisterDeleteErrorState(list: orderStockAdjustments)),
          (r) {
        orderStockAdjustments.removeWhere((element) => element.id == event.model.id);
        emit(OrderStockAdjustmentRegisterDeleteSuccessState(list: orderStockAdjustments));
      });
    });
  }

  goToOrderStockAdjustmentDesktopPage() {
    on<OrderStockAdjustmentRegisterDesktopEvent>((event, emit) async {
      if (event.model != null) {
        emit(OrderStockAdjustmentRegisterLoadingState());

        final response = await getOrderStockAdjustment.call(
            ParamsGetOrderStockAdjustmentRegister(
                id: event.model!.id, intitutionId: 1));

        response.fold(
            (l) => emit(
                OrderStockAdjustmentRegisterGetErrorState(list: orderStockAdjustments)),
            (r) {
          orderStockAdjustment = r;
          emit(OrderStockAdjustmentRegisterInfoPageState(list: []));
        });
      } else {
        orderStockAdjustment =
            OrderStockAdjustmentRegisterModel();
        emit(OrderStockAdjustmentRegisterInfoPageState(list: []));
      }
    });
  }

  getProducts() {
    on<OrderStockAdjustmentRegisterGetProductsEvent>((event, emit) async {
      emit(OrderStockAdjustmentRegisterLoadingState());

      final response = await productGetlist
          .call(ParamsGetlistProduct(id: event.tbInstitutionId));

      response.fold((l) => emit(OrderStockAdjustmentRegisterProductErrorState()),
          (r) {
        products = r;
        emit(OrderStockAdjustmentRegisterProductSuccessState(products: r));
      });
    });
  }

  getStocks() {
    on<OrderStockAdjustmentRegisterGetStocksEvent>((event, emit) async {
      emit(OrderStockAdjustmentRegisterLoadingState());

      final response = await stockListGetlist
          .call(ParamsGetListStock(institutionId: event.tbInstitutionId));

      response.fold((l) => emit(OrderStockAdjustmentRegisterStockErrorState()), (r) {
        stocks = r;
        emit(OrderStockAdjustmentRegisterStockSuccessState(stock: r));
      });
    });
  }

  getEntities() {
    on<OrderStockAdjustmentRegisterGetEntityEvent>((event, emit) async {
      emit(OrderStockAdjustmentRegisterLoadingState());

      final response = await entitiesListGetlist
          .call(ParamsGetListEntities());

      response.fold((l) => emit(OrderStockAdjustmentRegisterEntityErrorState()), (r) {
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
        emit(OrderStockAdjustmentRegisterProductSuccessState(products: products));
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
          emit(OrderStockAdjustmentRegisterStockSuccessState(stock: stockSearched));
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
          emit(OrderStockAdjustmentRegisterEntitySuccessState(entity: entitiesSearched));
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
        var orderStockAdjustmentsSearched = orderStockAdjustments.where((element) {
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
        emit(OrderStockAdjustmentRegisterLoadedState(list: orderStockAdjustments));
      }
    });
  }
}