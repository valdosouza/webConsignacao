import 'package:appweb/app/core/shared/utils/custom_date.dart';
import 'package:appweb/app/modules/cashier_statement_summary/data/model/params.dart';
import 'package:appweb/app/modules/cashier_statement_summary/data/model/salesman_model.dart';
import 'package:appweb/app/modules/cashier_statement_summary/data/model/summary_model.dart';
import 'package:appweb/app/modules/cashier_statement_summary/domain/usecase/get.dart';
import 'package:appweb/app/modules/cashier_statement_summary/domain/usecase/get_salesmans.dart';
import 'package:appweb/app/modules/cashier_statement_summary/presentation/bloc/event.dart';
import 'package:appweb/app/modules/cashier_statement_summary/presentation/bloc/state.dart';
import 'package:bloc/bloc.dart';

class CashierStatementSummaryBloc
    extends Bloc<CashierStatementSummaryEvent, CashierStatementSummaryState> {
  final Get get;
  final GetSalesmans getSalesmans;

  List<SummaryModel> summaryList = [];
  List<SalesmanModel> salesmanList = [];
  int tbSalesmanId = 0;
  String nameSalesman = "";

  int year = CustomDate().getYear(DateTime.now());
  String month = CustomDate().getMonth(CustomDate.newDate());

  CashierStatementSummaryBloc({
    required this.get,
    required this.getSalesmans,
  }) : super(InitialState()) {
    _get();
    _getSalesmanList();
    _goBackToMainForm();
  }

  void _get() {
    on<GetEvent>((event, emit) async {
      emit(LoadingState());
      var response = await get.call(Params(
        tbInstitutionId: 0,
        month: month,
        year: year,
        tbSalesmanId: tbSalesmanId,
      ));

      var result = response.fold((l) {
        return ErrorState(msg: l.toString());
      }, (r) {
        summaryList = r;
        return GetLoadedState();
      });
      emit(result);
    });
  }

  void _getSalesmanList() {
    on<GetSalesmanListEvent>((event, emit) async {
      emit(LoadingState());
      var response = await getSalesmans.call("");

      var result = response.fold((l) {
        return ErrorState(msg: l.toString());
      }, (r) {
        salesmanList = r;
        return GetSalesmanLoadedState();
      });
      emit(result);
    });
  }

  void _goBackToMainForm() {
    on<MainFormEvent>((event, emit) async {
      emit(LoadingState());
      summaryList;
      emit(MainFormLoadedState());
    });
  }
}
