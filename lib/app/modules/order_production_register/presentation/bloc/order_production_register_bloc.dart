import 'package:appweb/app/modules/Core/data/model/product_list_model.dart';
import 'package:appweb/app/modules/order_production_register/data/model/order_production_register_model.dart';
import 'package:appweb/app/modules/Core/data/model/stock_list_model.dart';
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

  OrderProductionRegisterBloc({
    required this.getOrderProduction,
    required this.getlistOrderProduction,
    required this.postOrderProduction,
    required this.putOrderProduction,
    required this.deleteOrderProduction,
    required this.productGetlist,
    required this.stockListGetlist,
  }) : super(OrderLoadingState()) {
    getList();

    orderNew();

    orderEdit();

    orderReturn();

    postOrder();

    putOrder();

    deleteOrder();

    getProducts();

    getStocks();

    searchEventProducts();

    searchEventStocks();

    searchOrderProduction();
  }

  getList() {
    on<OrderGetListEvent>((event, emit) async {
      emit(OrderLoadingState());

      var response = await getlistOrderProduction
          .call(ParamsGetlistOrderProductionRegister());

      response.fold((l) => emit(OrderGetErrorState()), (r) {
        orderProductions = r;
        emit(OrderGetLoadedState());
      });
    });
  }

  postOrder() {
    on<OrderPostEvent>((event, emit) async {
      emit(OrderLoadingState());

      var response = await postOrderProduction
          .call(ParamsPostOrderProductionRegister(model: orderProduction));

      response.fold((l) => emit(OrderPostErrorState()), (r) {
        orderProductions.add(r);
        emit(OrderPostSuccessState());
      });
    });
  }

  putOrder() {
    on<OrderPutEvent>((event, emit) async {
      emit(OrderLoadingState());

      var response = await putOrderProduction
          .call(ParamsPutOrderProductionRegister(model: orderProduction));

      response.fold((l) => emit(OrderPutErrorState()), (r) {
        orderProductions[
            orderProductions.indexWhere((element) => element.id == r.id)] = r;
        emit(OrderPutSuccessState());
      });
    });
  }

  deleteOrder() {
    on<OrderDeleteEvent>((event, emit) async {
      emit(OrderLoadingState());

      var response = await deleteOrderProduction
          .call(ParamsDeleteOrderProductionRegister(id: orderProduction.id));

      response.fold((l) => emit(OrderDeleteErrorState()), (r) {
        orderProductions
            .removeWhere((element) => element.id == orderProduction.id);
        emit(OrderDeleteSuccessState());
      });
    });
  }

  orderNew() {
    on<OrderAddEvent>((event, emit) async {
      emit(OrderLoadingState());

      orderProduction = OrderProductionRegisterModel.isEmpty();
      emit(OrderInfoPageState());
    });
  }

  orderEdit() {
    on<OrderEditEvent>((event, emit) async {
      emit(OrderLoadingState());

      emit(OrderInfoPageState());
    });
  }

  orderReturn() {
    on<OrderReturnEvent>((event, emit) async {
      emit(OrderLoadingState());

      emit(OrderInfoPageState());
    });
  }

  getProducts() {
    on<OrderGetProductsEvent>((event, emit) async {
      emit(OrderLoadingState());

      final response = await productGetlist.call(ParamsGetlistProduct());

      response.fold((l) => emit(OrderGetProductErrorState()), (r) {
        products = r;
        emit(OrderGetProductSucessState());
      });
    });
  }

  getStocks() {
    on<OrderGetStocksEvent>((event, emit) async {
      emit(OrderLoadingState());

      final response = await stockListGetlist.call(const ParamsGetListStock());

      response.fold((l) => emit(OrderGetStockErrorState()), (r) {
        stocks = r;
        emit(OrderGetStockSucessState());
      });
    });
  }

  searchEventProducts() {
    on<OrderSearchProductsEvent>((event, emit) async {
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
          emit(OrderSearchProductSucessState());
        } else {
          emit(OrderSearchProductSucessState());
        }
      } else {
        emit(OrderSearchProductSucessState());
      }
    });
  }

  searchEventStocks() {
    on<OrderSearchStocksEvent>((event, emit) async {
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
          emit(OrderSearchStockSucessState());
        } else {
          emit(OrderSearchStockSucessState());
        }
      } else {
        emit(OrderSearchStockSucessState());
      }
    });
  }

  searchOrderProduction() {
    on<OrderSearchEvent>((event, emit) async {
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
          emit(OrderSearchSucessState());
        } else {
          emit(OrderSearchSucessState());
        }
      } else {
        emit(OrderSearchSucessState());
      }
    });
  }
}
