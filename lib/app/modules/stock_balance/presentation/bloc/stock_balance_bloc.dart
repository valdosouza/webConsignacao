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
  StockBalanceModel stockBalanceTemp = StockBalanceModel.empty();

  List<StockListModel> stockListList = [];
  int pageStockBalance = 0;
  String search = "";
  int tbStockListId = 0;

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

    salesmamLiabilityGetList();
    generalSearchEvent();
    getList();
    searchEvent();
    getStocks();
    returnStockListPage();
  }

  getList() {
    on<StockBalanceGetListEvent>((event, emit) async {
      emit(StockBalanceLoadingState());

      if (event.params.page == 0) {
        stockBalance.items.clear();
        stockBalanceTemp.items.clear;
        pageStockBalance = 1;
      } else {
        pageStockBalance += 1;
      }
      tbStockListId = event.params.tbStockListId;
      event.params.page = pageStockBalance;

      var response = await getlist.call(event.params);

      response.fold((l) => emit(StockBalanceErrorState()), (r) {
        stockBalance.nameStockList = r.nameStockList;
        stockBalance.tbStockListId = r.tbStockListId;
        stockBalance.items += r.items;
        emit(GetListByStockListLoadedState());
      });
    });
  }

  searchEvent() {
    on<StockBalanceSearchEvent>((event, emit) async {
      if (stockBalanceTemp.items.length < stockBalance.items.length) {
        stockBalanceTemp = stockBalance;
      } else {
        stockBalance = stockBalanceTemp;
      }
      if (search.isNotEmpty) {
        stockBalance.items = stockBalance.items
            .where(
              (element) => element.nameMerchandise
                  .toLowerCase()
                  .trim()
                  .contains(search.toLowerCase().trim()),
            )
            .toList();
      }
      emit(StockBalanceSearchSucessState());
    });
  }

  customerGetList() {
    on<StockBalanceCustomerGetListEvent>((event, emit) async {
      emit(StockBalanceLoadingState());

      var response =
          await customergetlist.call(const ParamsGetListStockBalanceCustomer());

      response.fold((l) => emit(StockBalanceErrorState()), (r) {
        stockBalance = r;
        emit(GetListByCustomerLoadedState());
      });
    });
  }

  customerSearchEvent() {
    on<StockBalanceCustomerSearchEvent>((event, emit) async {});
  }

  salesmanGetList() {
    on<StockBalanceSalesmanGetListEvent>((event, emit) async {
      emit(StockBalanceLoadingState());
      if (event.params.page == 0) {
        stockBalance.items.clear();
        stockBalanceTemp.items.clear;
        pageStockBalance = 1;
      } else {
        pageStockBalance += 1;
      }
      event.params.page = pageStockBalance;
      var response = await salesmangetlist.call(event.params);

      response.fold((l) => emit(StockBalanceErrorState()), (r) {
        stockBalance.items += r.items;
        emit(GetListBySalesmanLoadedState());
      });
    });
  }

  salesmanSearchEvent() {
    on<StockBalanceSalesmanSearchEvent>((event, emit) async {});
  }

  salesmamLiabilityGetList() {
    on<StockBalanceGeneralGetListEvent>((event, emit) async {
      emit(StockBalanceLoadingState());

      var response =
          await generalgetlist.call(const ParamsGetListStockBalanceGeneral());

      response.fold((l) => emit(StockBalanceErrorState()), (r) {
        stockBalance = r;
        emit(GetListBySalesmanLoadedState());
      });
    });
  }

  generalSearchEvent() {
    on<StockBalanceGeneralSearchEvent>((event, emit) async {});
  }

  getStocks() {
    on<GetStockListEvent>((event, emit) async {
      emit(StockBalanceLoadingState());

      final response = await stockListGetlist.call(const ParamsGetListStock());

      response.fold((l) => emit(StockBalanceGetStockListErrorState()), (r) {
        stockListList = r;

        emit(GetStockListLoadedState());
      });
    });
  }

  returnStockListPage() {
    on<StockBalanceReturnStockListPagEvent>((event, emit) async {
      emit(GetStockListLoadedState());
    });
  }
}
