import 'package:appweb/app/modules/Core/data/model/stock_balance_model.dart';
import 'package:appweb/app/modules/Core/data/model/stock_list_model.dart';
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

  StockBalanceModel stockBalance = StockBalanceModel.empty();

  List<StockListModel> stockListList = [];

  StockBalanceBloc({
    required this.customergetlist,
    required this.salesmangetlist,
    required this.generalgetlist,
    required this.getlist,
    required this.stockListGetlist,
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
  }

  getList() {
    on<StockBalanceGetListEvent>((event, emit) async {
      emit(StockBalanceLoadingState());

      var response = await getlist
          .call(ParamsGetListStockBalance(tbStockListId: event.tbStockListId));

      response.fold((l) => emit(StockBalanceErrorState()), (r) {
        stockBalance = r;
        emit(StockBalanceLoadedState(item: r));
      });
    });
  }

  searchEvent() {
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

  customerGetList() {
    on<StockBalanceCustomerGetListEvent>((event, emit) async {
      emit(StockBalanceLoadingState());

      var response =
          await customergetlist.call(const ParamsGetListStockBalanceCustomer());

      response.fold((l) => emit(StockBalanceErrorState()), (r) {
        stockBalance = r;
        emit(StockBalanceCustomerLoadedState(item: r));
      });
    });
  }

  customerSearchEvent() {
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

  salesmanGetList() {
    on<StockBalanceSalesmanGetListEvent>((event, emit) async {
      emit(StockBalanceLoadingState());

      var response =
          await salesmangetlist.call(const ParamsGetListStockBalanceSalesman());

      response.fold((l) => emit(StockBalanceErrorState()), (r) {
        stockBalance = r;
        emit(StockBalanceSalesmanLoadedState(item: r));
      });
    });
  }

  salesmanSearchEvent() {
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

  generalGetList() {
    on<StockBalanceGeneralGetListEvent>((event, emit) async {
      emit(StockBalanceLoadingState());

      var response =
          await generalgetlist.call(const ParamsGetListStockBalanceGeneral());

      response.fold((l) => emit(StockBalanceErrorState()), (r) {
        stockBalance = r;
        emit(StockBalanceGeneralLoadedState(item: r));
      });
    });
  }

  generalSearchEvent() {
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

  getStocks() {
    on<StockBalanceGetStockListEvent>((event, emit) async {
      emit(StockBalanceLoadingState());

      final response = await stockListGetlist.call(const ParamsGetListStock());

      response.fold((l) => emit(StockBalanceGetStockListErrorState()), (r) {
        stockListList = r;
        emit(StockBalanceGetStockListSucessState(item: stockListList));
      });
    });
  }

  returnStockListPage() {
    on<StockBalanceReturnStockListPagEvent>((event, emit) async {
      emit(StockBalanceCustomerLoadedState(item: stockBalance));
    });
  }
}
