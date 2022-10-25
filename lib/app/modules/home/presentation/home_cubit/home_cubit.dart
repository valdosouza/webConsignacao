import 'package:appweb/app/modules/home/data/model/home_sales_payment_type_model.dart';
import 'package:appweb/app/modules/home/domain/usecase/get_financial_closed_usecase.dart';
import 'package:appweb/app/modules/home/presentation/home_cubit/home_state.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetFinancialClosedUseCase getFinancialClosedUseCase;

  HomeCubit({required this.getFinancialClosedUseCase}) : super(HomeInitial());

  Future<void> getFinancialClosed(
    String initialDate,
    String finalDate,
    String terminal,
  ) async {
    try {
      emit(HomeLoadingState());

      final result = await getFinancialClosedUseCase(Params(
        initialDate: initialDate,
        finalDate: finalDate,
        terminal: terminal,
      ));
      final List<HomeSalesPaymentTypeModel> list =
          (result as Right).value as List<HomeSalesPaymentTypeModel>;

      emit(HomeLoadedState(list));
    } catch (e) {
      emit(
          const HomeErrorState('Erro ao Listar Vendas por Forma de Pagamento'));
    }
  }

  Future<void> logOut() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.setString('token', '');
    emit(HomeLogoutState());
  }
}
