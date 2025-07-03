import 'package:appweb/app/modules/Core/data/model/stock_balance_model.dart';
import 'package:appweb/app/modules/Core/data/model/stock_list_model.dart';
import 'package:appweb/app/modules/stock_balance/data/model/stock_balance_by_product_model.dart';
import 'package:appweb/app/modules/stock_balance/domain/usecase/customer_all_by_products.dart';
import 'package:appweb/app/modules/stock_balance/domain/usecase/stock_balance_getlist.dart';
import 'package:appweb/app/modules/stock_balance/domain/usecase/stock_list_getlist.dart';
import 'package:appweb/app/modules/stock_balance/domain/usecase/stock_balance_customer_getlist.dart';
import 'package:appweb/app/modules/stock_balance/domain/usecase/stock_balance_general_getlist.dart';
import 'package:appweb/app/modules/stock_balance/domain/usecase/stock_balance_salesman_getlist.dart';

import 'package:appweb/app/modules/stock_balance/presentation/bloc/stock_balance_event.dart';
import 'package:appweb/app/modules/stock_balance/presentation/bloc/stock_balance_state.dart';
import 'package:bloc/bloc.dart';

class StockBalanceBloc extends Bloc<StockBalanceEvent, StockBalanceState> {
  final StockBalanceCustomerGetlist customergetlist;
  final StockBalanceSalesmanGetlist salesmangetlist;
  final StockBalanceGeneralGetlist generalgetlist;
  final StockBalanceGetlist getlist;
  final StockListGetlist stockListGetlist;
  final CustomerAllByProducts customerAllByProducts;

  StockBalanceModel stockBalance = StockBalanceModel.empty();

  List<StockListModel> stockListList = [];
  StockBalanceByProductModel stockBalanceByProduct =
      StockBalanceByProductModel.empty();

  StockBalanceByProductModel filterStockBalanceByProduct =
      StockBalanceByProductModel.empty();

  String nameCustomer = "";
  bool balanceDivergent = false;

  StockBalanceBloc({
    required this.customergetlist,
    required this.salesmangetlist,
    required this.generalgetlist,
    required this.getlist,
    required this.stockListGetlist,
    required this.customerAllByProducts,
  }) : super(StockBalanceLoadingState()) {
    customerGetList();
    customerSearchEvent();
    salesmanGetList();
    salesmanSearchEvent();
    generalGetList();
    generalSearchEvent();
    getList();
    searchEvent();
    getStocks();
    returnStockListPage();
    _customerAllByProducts();
    _filterCustomer();
    _filterBalanceDivergent();
  }

  void getList() {
    on<StockBalanceGetListEvent>((event, emit) async {
      emit(StockBalanceLoadingState());

      var response = await getlist
          .call(ParamsGetListStockBalance(tbStockListId: event.tbStockListId));

      response.fold((l) => emit(ErrorState(msg: l.toString())), (r) {
        stockBalance = r;
        emit(StockBalanceLoadedState(item: r));
      });
    });
  }

  void searchEvent() {
    on<StockBalanceSearchEvent>((event, emit) async {
      if (event.search.isNotEmpty) {
        StockBalanceModel stockBalanceSearched = StockBalanceModel.empty();
        stockBalanceSearched.items = stockBalance.items.where((element) {
          String name = element.nameMerchandise;
          return (name
              .toLowerCase()
              .trim()
              .contains(event.search.toLowerCase().trim()));
        }).toList();
        if (stockBalanceSearched.items.isNotEmpty) {
          emit(StockBalanceCustomerLoadedState(item: stockBalanceSearched));
        } else {
          emit(StockBalanceCustomerLoadedState(item: stockBalance));
        }
      } else {
        emit(StockBalanceCustomerLoadedState(item: stockBalance));
      }
    });
  }

  void customerGetList() {
    on<StockBalanceCustomerGetListEvent>((event, emit) async {
      emit(StockBalanceLoadingState());

      var response =
          await customergetlist.call(const ParamsGetListStockBalanceCustomer());

      response.fold((l) => emit(ErrorState(msg: l.toString())), (r) {
        stockBalance = r;
        emit(StockBalanceCustomerLoadedState(item: r));
      });
    });
  }

  void customerSearchEvent() {
    on<StockBalanceCustomerSearchEvent>((event, emit) async {
      if (event.search.isNotEmpty) {
        StockBalanceModel stockBalanceSearched = StockBalanceModel.empty();
        stockBalanceSearched.items = stockBalance.items.where((element) {
          String name = element.nameMerchandise;
          return (name
              .toLowerCase()
              .trim()
              .contains(event.search.toLowerCase().trim()));
        }).toList();
        if (stockBalanceSearched.items.isNotEmpty) {
          emit(StockBalanceCustomerLoadedState(item: stockBalanceSearched));
        } else {
          emit(StockBalanceCustomerLoadedState(item: stockBalance));
        }
      } else {
        emit(StockBalanceCustomerLoadedState(item: stockBalance));
      }
    });
  }

  void salesmanGetList() {
    on<StockBalanceSalesmanGetListEvent>((event, emit) async {
      emit(StockBalanceLoadingState());

      var response =
          await salesmangetlist.call(const ParamsGetListStockBalanceSalesman());

      response.fold((l) => emit(ErrorState(msg: l.toString())), (r) {
        stockBalance = r;
        emit(StockBalanceSalesmanLoadedState(item: r));
      });
    });
  }

  void salesmanSearchEvent() {
    on<StockBalanceSalesmanSearchEvent>((event, emit) async {
      if (event.search.isNotEmpty) {
        StockBalanceModel stockBalanceSearched = StockBalanceModel.empty();
        stockBalanceSearched.items = stockBalance.items.where((element) {
          String name = element.nameMerchandise;
          return (name
              .toLowerCase()
              .trim()
              .contains(event.search.toLowerCase().trim()));
        }).toList();
        if (stockBalanceSearched.items.isNotEmpty) {
          emit(StockBalanceSalesmanLoadedState(item: stockBalanceSearched));
        } else {
          emit(StockBalanceSalesmanLoadedState(item: stockBalance));
        }
      } else {
        emit(StockBalanceSalesmanLoadedState(item: stockBalance));
      }
    });
  }

  void generalGetList() {
    on<StockBalanceGeneralGetListEvent>((event, emit) async {
      emit(StockBalanceLoadingState());

      var response =
          await generalgetlist.call(const ParamsGetListStockBalanceGeneral());

      response.fold((l) => emit(ErrorState(msg: l.toString())), (r) {
        stockBalance = r;
        emit(StockBalanceGeneralLoadedState(item: r));
      });
    });
  }

  void generalSearchEvent() {
    on<StockBalanceGeneralSearchEvent>((event, emit) async {
      if (event.search.isNotEmpty) {
        StockBalanceModel stockBalanceSearched = StockBalanceModel.empty();
        stockBalanceSearched.items = stockBalance.items.where((element) {
          String name = element.nameMerchandise;
          return (name
              .toLowerCase()
              .trim()
              .contains(event.search.toLowerCase().trim()));
        }).toList();
        if (stockBalanceSearched.items.isNotEmpty) {
          emit(StockBalanceGeneralLoadedState(item: stockBalanceSearched));
        } else {
          emit(StockBalanceGeneralLoadedState(item: stockBalance));
        }
      } else {
        emit(StockBalanceGeneralLoadedState(item: stockBalance));
      }
    });
  }

  void getStocks() {
    on<StockBalanceGetStockListEvent>((event, emit) async {
      emit(StockBalanceLoadingState());

      final response = await stockListGetlist.call(const ParamsGetListStock());

      response.fold((l) => emit(ErrorState(msg: l.toString())), (r) {
        stockListList = r;
        emit(StockBalanceGetStockListSucessState(item: stockListList));
      });
    });
  }

  void returnStockListPage() {
    on<StockBalanceReturnStockListPagEvent>((event, emit) async {
      emit(StockBalanceCustomerLoadedState(item: stockBalance));
    });
  }

  void _customerAllByProducts() {
    on<GetStockBalanceAllCutomerByProductEvent>((event, emit) async {
      emit(StockBalanceLoadingState());

      final response = await customerAllByProducts.call(event.params);

      response.fold((l) => emit(ErrorState(msg: l.toString())), (r) {
        stockBalanceByProduct = r;
        emit(StockBalanceAllCustomerByProductLoadedState(
            list: stockBalanceByProduct));
      });
    });
  }

  void _filterCustomer() {
    on<FilterCustomerEvent>((event, emit) async {
      if (nameCustomer.isNotEmpty) {
        filterStockBalanceByProduct.nameProduct =
            stockBalanceByProduct.nameProduct;
        filterStockBalanceByProduct.tbMerchandiseId =
            stockBalanceByProduct.tbMerchandiseId;
        filterStockBalanceByProduct.items = stockBalanceByProduct.items
            .where((x) => x.nameCustomer
                .toLowerCase()
                .contains(nameCustomer.toLowerCase()))
            .toList();
        emit(StockBalanceAllCustomerByProductLoadedState(
            list: filterStockBalanceByProduct));
      } else {
        emit(StockBalanceAllCustomerByProductLoadedState(
            list: stockBalanceByProduct));
      }
    });
  }

  void _filterBalanceDivergent() {
    on<FilterBalanceDivergentEvent>((event, emit) async {
      if (balanceDivergent) {
        filterStockBalanceByProduct.nameProduct =
            stockBalanceByProduct.nameProduct;
        filterStockBalanceByProduct.tbMerchandiseId =
            stockBalanceByProduct.tbMerchandiseId;
        filterStockBalanceByProduct.items = stockBalanceByProduct.items
            .where((x) => x.quantity % 18 != 0)
            .toList();
        emit(StockBalanceAllCustomerByProductLoadedState(
            list: filterStockBalanceByProduct));
      } else {
        emit(StockBalanceAllCustomerByProductLoadedState(
            list: stockBalanceByProduct));
      }
    });
  }
}
