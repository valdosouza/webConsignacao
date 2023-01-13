import 'package:appweb/app/modules/Core/data/model/product_list_model.dart';
import 'package:appweb/app/modules/order_production_register/data/model/order_production_register_model.dart';
import 'package:appweb/app/modules/order_production_register/data/model/stock_list_model.dart';
import 'package:appweb/app/modules/order_production_register/domain/usecase/order_production_register_delete.dart';
import 'package:appweb/app/modules/order_production_register/domain/usecase/order_production_register_get.dart';
import 'package:appweb/app/modules/order_production_register/domain/usecase/order_production_register_get_list.dart';
import 'package:appweb/app/modules/order_production_register/domain/usecase/order_production_register_post.dart';
import 'package:appweb/app/modules/order_production_register/domain/usecase/order_production_register_put.dart';
import 'package:appweb/app/modules/order_production_register/domain/usecase/product_get_list.dart';
import 'package:appweb/app/modules/order_production_register/domain/usecase/stock_list_getlist.dart';
import 'package:appweb/app/modules/order_production_register/presentation/bloc/order_production_register_event.dart';
import 'package:appweb/app/modules/order_production_register/presentation/bloc/order_production_register_state.dart';
import 'package:bloc/bloc.dart';

class OrderProductionRegisterBloc
    extends Bloc<OrderProductionRegisterEvent, OrderProductionRegisterState> {
  final OrderProductionRegisterGet getOrderProduction;
  final OrderProductionRegisterGetlist getlistOrderProduction;
  final OrderProductionRegisterPost postOrderProduction;
  final OrderProductionRegisterPut putOrderProduction;
  final OrderProductionRegisterDelete deleteOrderProduction;
  final ProductGetlist productGetlist;
  final StockListGetlist stockListGetlist;

  List<OrderProductionRegisterModel> orderProductions = [];
  OrderProductionRegisterModel orderProduction =
      OrderProductionRegisterModel.isEmpty();
  List<ProductListModel> products = [];
  List<StockListModel> stocks = [];
  bool edit = false;

  OrderProductionRegisterBloc({
    required this.getOrderProduction,
    required this.getlistOrderProduction,
    required this.postOrderProduction,
    required this.putOrderProduction,
    required this.deleteOrderProduction,
    required this.productGetlist,
    required this.stockListGetlist,
  }) : super(OrderProductionRegisterLoadingState()) {
    getList();

    goToOrderProductionDesktopPage();

    // goToOrderProductionMobilePage();

    postOrderProductionAction();

    putOrderProductionAction();

    deleteOrderProductionAction();

    getProducts();

    getStocks();

    searchEventProducts();

    searchEventStocks();

    searchEventOrderProduction();

    on<OrderProductionRegisterReturnEvent>(
        (event, emit) => emit(OrderProductionRegisterInfoPageState(list: [])));
  }

  getList() {
    on<OrderProductionRegisterGetListEvent>((event, emit) async {
      emit(OrderProductionRegisterLoadingState());

      var response = await getlistOrderProduction
          .call(ParamsGetlistOrderProductionRegister(id: 1));

      response.fold(
          (l) =>
              emit(OrderProductionRegisterErrorState(list: orderProductions)),
          (r) {
        orderProductions = r;
        emit(OrderProductionRegisterLoadedState(list: r));
      });
    });
  }

  postOrderProductionAction() {
    on<OrderProductionRegisterPostEvent>((event, emit) async {
      emit(OrderProductionRegisterLoadingState());

      var response = await postOrderProduction
          .call(ParamsPostOrderProductionRegister(model: event.model));

      response.fold(
          (l) => emit(
              OrderProductionRegisterPostErrorState(list: orderProductions)),
          (r) {
        orderProductions.add(r);
        emit(OrderProductionRegisterPostSuccessState(list: orderProductions));
      });
    });
  }

  putOrderProductionAction() {
    on<OrderProductionRegisterPutEvent>((event, emit) async {
      emit(OrderProductionRegisterLoadingState());

      var response = await putOrderProduction
          .call(ParamsPutOrderProductionRegister(model: event.model));

      response.fold(
          (l) => event.model.id != 0
              ? emit(
                  OrderProductionRegisterPutErrorState(list: orderProductions))
              : emit(
                  OrderProductionRegisterPutErrorState(list: orderProductions)),
          (r) {
        orderProductions[
            orderProductions.indexWhere((element) => element.id == r.id)] = r;
        emit(OrderProductionRegisterPutSuccessState(list: orderProductions));
      });
    });
  }

  deleteOrderProductionAction() {
    on<OrderProductionRegisterDeleteEvent>((event, emit) async {
      emit(OrderProductionRegisterLoadingState());

      var response = await deleteOrderProduction
          .call(ParamsDeleteOrderProductionRegister(id: event.model.id));

      response.fold(
          (l) => emit(
              OrderProductionRegisterDeleteErrorState(list: orderProductions)),
          (r) {
        orderProductions.removeWhere((element) => element.id == event.model.id);
        emit(OrderProductionRegisterDeleteSuccessState(list: orderProductions));
      });
    });
  }

  goToOrderProductionDesktopPage() {
    on<OrderProductionRegisterDesktopEvent>((event, emit) async {
      emit(OrderProductionRegisterLoadingState());

      orderProduction = OrderProductionRegisterModel.isEmpty();
      emit(OrderProductionRegisterInfoPageState(list: []));
    });
  }

  getProducts() {
    on<OrderProductionRegisterGetProductsEvent>((event, emit) async {
      emit(OrderProductionRegisterLoadingState());

      final response = await productGetlist
          .call(ParamsGetlistProduct(id: event.tbInstitutionId));

      response.fold((l) => emit(OrderProductionRegisterProductErrorState()),
          (r) {
        products = r;
        emit(OrderProductionRegisterProductSuccessState(products: r));
      });
    });
  }

  getStocks() {
    on<OrderProductionRegisterGetStocksEvent>((event, emit) async {
      emit(OrderProductionRegisterLoadingState());

      final response = await stockListGetlist
          .call(ParamsGetListStock(institutionId: event.tbInstitutionId));

      response.fold((l) => emit(OrderProductionRegisterStockErrorState()), (r) {
        stocks = r;
        emit(OrderProductionRegisterStockSuccessState(stock: r));
      });
    });
  }

  searchEventProducts() {
    on<OrderProductionRegisterSearchProductsEvent>((event, emit) async {
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
          emit(OrderProductionRegisterProductSuccessState(
              products: productstSearched));
        } else {
          emit(OrderProductionRegisterProductSuccessState(products: []));
        }
      } else {
        emit(OrderProductionRegisterProductSuccessState(products: products));
      }
    });
  }

  searchEventStocks() {
    on<OrderProductionRegisterSearchStocksEvent>((event, emit) async {
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
          emit(OrderProductionRegisterStockSuccessState(stock: stockSearched));
        } else {
          emit(OrderProductionRegisterStockSuccessState(stock: []));
        }
      } else {
        emit(OrderProductionRegisterStockSuccessState(stock: stocks));
      }
    });
  }

  searchEventOrderProduction() {
    on<OrderProductionRegisterSearchEvent>((event, emit) async {
      if (event.search.isNotEmpty) {
        var orderProductionsSearched = orderProductions.where(
          (element) {
            String name = element.nameMerchandise;
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
          },
        ).toList();
        if (orderProductionsSearched.isNotEmpty) {
          emit(OrderProductionRegisterLoadedState(
              list: orderProductionsSearched));
        } else {
          emit(OrderProductionRegisterLoadedState(list: []));
        }
      } else {
        emit(OrderProductionRegisterLoadedState(list: orderProductions));
      }
    });
  }
}
