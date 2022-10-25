import 'package:appweb/app/modules/home/domain/usecase/get_financial_closed_usecase.dart';
import 'package:appweb/app/modules/home/presentation/bloc/home_event.dart';
import 'package:appweb/app/modules/home/presentation/bloc/home_state.dart';
import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetFinancialClosedUseCase getFinancialClosedUseCase;
  HomeBloc({required this.getFinancialClosedUseCase}) : super(HomeInitial()) {
    on<HomeGetFinancialEvent>((event, emit) async {
      emit(HomeLoadingState());
      final result = await getFinancialClosedUseCase(Params(
        initialDate: event.initialDate,
        finalDate: event.finalDate,
        terminal: event.terminal,
      ));

      result.fold(
          (l) => emit(const HomeErrorState(
              'Erro ao Listar Vendas por Forma de Pagamento')),
          (r) => HomeLoadedState(r));
    });

    on<HomeLogoutEvent>((event, emit) async {
      final SharedPreferences sp = await SharedPreferences.getInstance();
      await sp.setString('token', '');
      emit(HomeLogoutState());
    });
  }
}
