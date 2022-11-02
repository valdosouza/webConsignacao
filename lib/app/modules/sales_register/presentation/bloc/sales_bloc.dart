import 'package:appweb/app/modules/sales_register/data/models/sales_model.dart';
import 'package:appweb/app/modules/sales_register/domain/usecases/sales_register_post.dart';
import 'package:appweb/app/modules/sales_register/presentation/bloc/sales_events.dart';
import 'package:appweb/app/modules/sales_register/presentation/bloc/sales_states.dart';
import 'package:bloc/bloc.dart';

class SalesBloc extends Bloc<SalesEvent, SalesState> {
  final SalesPost post;

  List<SalesModel> salesModel = [];

  SalesBloc({required this.post}) : super(SalesInitialState()) {
    on<LoadSalesEvent>((event, emit) async {
      SalesInitialState();
    });
    on<AddSalesEvent>(
      (event, emit) async {
        SalesInitialState();
        var response = await post.call(SalesParams(model: event.salesModel));
        var result = response.fold(
          (l) => SalesAddErrorSate(listSalesModel: salesModel),
          (r) => SalesAddSuccessSate(listSalesModel: salesModel),
        );
        emit(result);
      },
    );
  }
}
