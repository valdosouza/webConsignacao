import 'package:appweb/app/modules/sales_route_register/data/models/sales_model.dart';
import 'package:appweb/app/modules/sales_route_register/domain/usecases/sales_register_delete.dart';
import 'package:appweb/app/modules/sales_route_register/domain/usecases/sales_register_get.dart';
import 'package:appweb/app/modules/sales_route_register/domain/usecases/sales_register_post.dart';
import 'package:appweb/app/modules/sales_route_register/domain/usecases/sales_register_put.dart';
import 'package:appweb/app/modules/sales_route_register/presentation/bloc/sales_events.dart';
import 'package:appweb/app/modules/sales_route_register/presentation/bloc/sales_states.dart';
import 'package:bloc/bloc.dart';

class SalesBloc extends Bloc<SalesEvent, SalesState> {
  final SalesPost post;
  final SalesRegisterPut put;
  final SalesRegisterDelete delete;
  final SalesRegisterGetlist getlist;

  List<SalesModel> salesModel = [];

  SalesBloc({
    required this.put,
    required this.post,
    required this.delete,
    required this.getlist,
  }) : super(SalesInitialState()) {
    on<LoadSalesEvent>((event, emit) async {
      SalesInitialState();
      var response = await getlist.call(const Params(institutionId: 1));
      var result = response.fold(
        (l) => SalesErrorState(),
        (r) {
          salesModel = r;
          return SalesSuccessState(listSalesModel: r);
        },
      );
      emit(result);
    });

    on<SearchSalesEvent>((event, emit) async {
      if (event.search.isNotEmpty) {
        var clienstSearched = salesModel.where((element) {
          String name = element.description;
          return name
              .toLowerCase()
              .trim()
              .contains(event.search.toLowerCase().trim());
        }).toList();
        if (clienstSearched.isEmpty) {}
        emit(SalesSuccessState(listSalesModel: clienstSearched));
      } else {
        emit(SalesSuccessState(listSalesModel: salesModel));
      }
    });

    on<DeleteSalesEvent>((event, emit) async {
      SalesInitialState();
      var response =
          await delete.call(DeleteSalesRegisterParams(salesId: event.salesId));
      var result = response.fold(
        (l) => SalesDeleteErrorState(salesModelList: salesModel),
        (r) {
          salesModel.removeWhere((element) => element.id == event.salesId);
          return SalesDeleteErrorState(salesModelList: salesModel);
        },
      );
      emit(result);
    });

    on<SalesInteractionEvent>(
      (event, emit) async {
        emit(SalesInterationPageState(
            salesList: salesModel, salesModel: event.salesModel));
      },
    );

    on<AddSalesEvent>((event, emit) async {
      SalesInitialState();
      var response = await post.call(SalesParams(model: event.salesModel));
      var result = response.fold(
        (l) => SalesAddErrorState(salesModel: salesModel),
        (r) => SalesAddSuccessState(listSalesModel: salesModel),
      );
      emit(result);
    });

    on<EditSalesEvent>((event, emit) async {
      SalesInitialState();
      var response =
          await put.call(PutSaleSregisterParams(salesParams: event.salesModel));
      var result = response.fold(
        (l) => SalesPutErrorState(salesModelList: salesModel),
        (r) => SalesEditSuccessState(salesList: salesModel),
      );
      emit(result);
    });
  }
}
