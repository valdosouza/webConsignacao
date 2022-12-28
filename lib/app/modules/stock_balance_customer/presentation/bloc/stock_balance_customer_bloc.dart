import 'package:appweb/app/modules/Core/data/model/stock_balance_model.dart';
import 'package:appweb/app/modules/stock_balance_customer/domain/usecase/stock_balance_customer_getlist.dart';
import 'package:appweb/app/modules/stock_balance_customer/presentation/bloc/stock_balance_customer_event.dart';
import 'package:appweb/app/modules/stock_balance_customer/presentation/bloc/stock_balance_customer_state.dart';
import 'package:bloc/bloc.dart';

class StockBalanceCustomerBloc
    extends Bloc<StockBalanceCustomerEvent, StockBalanceCustomerState> {
  final StockBalanceCustomerGetlist getlist;

  List<StockBalanceModel> sotckBalance = [];

  StockBalanceCustomerBloc({
    required this.getlist,
  }) : super(StockBalanceCustomerLoadingState()) {
    getList();
  }

  getList() {
    on<StockBalanceCustomerGetListEvent>((event, emit) async {
      emit(StockBalanceCustomerLoadingState());

      var response =
          await getlist.call(const ParamsGetListStockBalance(institutionId: 1, salesmanId: 1));

      response.fold(
          (l) => emit(StockBalanceCustomerErrorState(list: sotckBalance)), (r) {
        sotckBalance = r;
        emit(StockBalanceCustomerLoadedState(list: r));
      });
    });
  }
}
