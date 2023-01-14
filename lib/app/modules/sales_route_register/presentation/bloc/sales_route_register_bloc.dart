import 'package:appweb/app/modules/sales_route_register/data/model/sales_route_model.dart';
import 'package:appweb/app/modules/sales_route_register/domain/usecase/sales_route_register_delete.dart';
import 'package:appweb/app/modules/sales_route_register/domain/usecase/sales_route_register_get_list.dart';
import 'package:appweb/app/modules/sales_route_register/domain/usecase/sales_route_register_post.dart';
import 'package:appweb/app/modules/sales_route_register/domain/usecase/sales_route_register_put.dart';
import 'package:appweb/app/modules/sales_route_register/presentation/bloc/sales_route_register_event.dart';
import 'package:appweb/app/modules/sales_route_register/presentation/bloc/sales_route_register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SalesRouteRegisterBloc
    extends Bloc<SalesRouteRegisterEvent, SalesRouteRegisterState> {
  final SalesRouteRegisterGetlist getlist;
  final SalesRouteRegisterPost post;
  final SalesRouteRegisterPut put;
  final SalesRouteRegisterDelete delete;

  List<SalesRouteRegisterModel> list = [];

  SalesRouteRegisterBloc({
    required this.getlist,
    required this.post,
    required this.put,
    required this.delete,
  }) : super(SalesRouteRegisterLoadingState()) {
    getList();

    searchRouteSales();

    goToInfoPage();

    postFunction();

    putFunction();
  }

  getList() {
    on<SalesRouteRegisterGetListEvent>((event, emit) async {
      emit(SalesRouteRegisterLoadingState());

      var response = await getlist.call(ParamsSalesRouteGet());

      var result =
          response.fold((l) => SalesRouteRegisterErrorState(list: list), (r) {
        list = r;
        return SalesRouteRegisterLoadedState(list: r);
      });

      emit(result);
    });
  }

  searchRouteSales() {
    on<SalesRouteRegisterSearchEvent>((event, emit) async {
      if (event.search.isNotEmpty) {
        var listearched = list.where((element) {
          String name = element.description;
          return name
              .toLowerCase()
              .trim()
              .contains(event.search.toLowerCase().trim());
        }).toList();
        emit(SalesRouteRegisterLoadedState(list: listearched));
      } else {
        emit(SalesRouteRegisterLoadedState(list: list));
      }
    });
  }

  goToInfoPage() {
    on<SalesRouteRegisterInfoEvent>((event, emit) async {
      emit(SalesRouteRegisterInfoPageState(list: list, model: event.model));
    });
  }

  postFunction() {
    on<SalesRouteRegisterPostEvent>((event, emit) async {
      SalesRouteRegisterLoadingState();
      var response = await post.call(ParamsSalesRoutePost(model: event.model));

      var result = response.fold(
        (l) => SalesRouteRegisterAddErrorState(list: list),
        (r) {
          list.add(r);
          return SalesRouteRegisterAddSuccessState(list: list);
        },
      );
      emit(result);
    });
  }

  putFunction() {
    on<SalesRouteRegisterPutEvent>((event, emit) async {
      SalesRouteRegisterLoadingState();
      var response = await put.call(ParamsSalesRoutePut(model: event.model));

      var result = response.fold(
        (l) => SalesRouteRegisterEditErrorState(list: list),
        (r) {
          return SalesRouteRegisterEditSuccessState(list: list);
        },
      );
      emit(result);
    });
  }
}
