import 'package:appweb/app/modules/Core/data/model/stock_balance_model.dart';
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
  List<StockBalanceModel> stockBalance = [];

  StockBalanceBloc({
    required this.customergetlist,
    required this.salesmangetlist,
    required this.generalgetlist,
  }) : super(StockBalanceLoadingState()) {
    customerGetList();
    customerSearchEvent();
    salesmanGetList();
    salesmanSearchEvent();
    generalGetList();
    generalSearchEvent();
  }

  customerGetList() {
    on<StockBalanceCustomerGetListEvent>((event, emit) async {
      emit(StockBalanceCustomerLoadingState());

      var response = await customergetlist.call(
          const ParamsGetListStockBalanceCustomer(
              institutionId: 1, tbSalesmanId: 2));

      response.fold(
          (l) => emit(StockBalanceCustomerErrorState(list: stockBalance)), (r) {
        stockBalance = r;
        emit(StockBalanceCustomerLoadedState(list: r));
      });
    });
  }

  customerSearchEvent() {
    on<StockBalanceCustomerSearchEvent>((event, emit) async {
      if (event.search.isNotEmpty) {
        var stockBalanceSearched = stockBalance.where((element) {
          String name = element.nameMerchandise;
          return (name
              .toLowerCase()
              .trim()
              .contains(event.search.toLowerCase().trim()));
        }).toList();
        if (stockBalanceSearched.isNotEmpty) {
          emit(StockBalanceCustomerLoadedState(list: stockBalanceSearched));
        } else {
          emit(StockBalanceCustomerLoadedState(list: []));
        }
      } else {
        emit(StockBalanceCustomerLoadedState(list: stockBalance));
      }
    });
  }

  salesmanGetList() {
    on<StockBalanceSalesmanGetListEvent>((event, emit) async {
      emit(StockBalanceSalesmanLoadingState());

      var response = await salesmangetlist.call(
          const ParamsGetListStockBalanceSalesman(
              institutionId: 1, tbSalesmanId: 2));

      response.fold(
          (l) => emit(StockBalanceSalesmanErrorState(list: stockBalance)), (r) {
        stockBalance = r;
        emit(StockBalanceSalesmanLoadedState(list: r));
      });
    });
  }

  salesmanSearchEvent() {
    on<StockBalanceSalesmanSearchEvent>((event, emit) async {
      if (event.search.isNotEmpty) {
        var stockBalanceSearched = stockBalance.where((element) {
          String name = element.nameMerchandise;
          return (name
              .toLowerCase()
              .trim()
              .contains(event.search.toLowerCase().trim()));
        }).toList();
        if (stockBalanceSearched.isNotEmpty) {
          emit(StockBalanceSalesmanLoadedState(list: stockBalanceSearched));
        } else {
          emit(StockBalanceSalesmanLoadedState(list: []));
        }
      } else {
        emit(StockBalanceSalesmanLoadedState(list: stockBalance));
      }
    });
  }

  generalGetList() {
    on<StockBalanceGeneralGetListEvent>((event, emit) async {
      emit(StockBalanceGeneralLoadingState());

      var response = await generalgetlist.call(
          const ParamsGetListStockBalanceGeneral(
              institutionId: 1, tbSalesmanId: 2));

      response.fold(
          (l) => emit(StockBalanceGeneralErrorState(list: stockBalance)), (r) {
        stockBalance = r;
        emit(StockBalanceGeneralLoadedState(list: r));
      });
    });
  }

  generalSearchEvent() {
    on<StockBalanceGeneralSearchEvent>((event, emit) async {
      if (event.search.isNotEmpty) {
        var stockBalanceSearched = stockBalance.where((element) {
          String name = element.nameMerchandise;
          return (name
              .toLowerCase()
              .trim()
              .contains(event.search.toLowerCase().trim()));
        }).toList();
        if (stockBalanceSearched.isNotEmpty) {
          emit(StockBalanceGeneralLoadedState(list: stockBalanceSearched));
        } else {
          emit(StockBalanceGeneralLoadedState(list: []));
        }
      } else {
        emit(StockBalanceGeneralLoadedState(list: stockBalance));
      }
    });
  }
}
