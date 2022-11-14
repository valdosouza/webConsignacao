import 'package:appweb/app/modules/price_list_register/data/model/price_list_model.dart';
import 'package:appweb/app/modules/price_list_register/domain/usecase/price_list_register_delete.dart';
import 'package:appweb/app/modules/price_list_register/domain/usecase/price_list_register_get_list.dart';
import 'package:appweb/app/modules/price_list_register/domain/usecase/price_list_register_post.dart';
import 'package:appweb/app/modules/price_list_register/domain/usecase/price_list_register_put.dart';
import 'package:appweb/app/modules/price_list_register/presentation/bloc/price_list_register_event.dart';
import 'package:appweb/app/modules/price_list_register/presentation/bloc/price_list_register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PriceListRegisterBloc
    extends Bloc<PriceListRegisterEvent, PriceListRegisterState> {
  final PriceListRegisterGetlist getlist;
  final PriceListRegisterPost post;
  final PriceListRegisterPut put;
  final PriceListRegisterDelete delete;

  List<PriceListModel> prices = [];

  PriceListRegisterBloc({
    required this.getlist,
    required this.post,
    required this.put,
    required this.delete,
  }) : super(PriceListRegisterLoadingState()) {
    getList();

    searchPrices();

    goToInfoPage();

    addFunction();

    editFunction();
  }

  getList() {
    on<PriceListRegisterGetListEvent>((event, emit) async {
      emit(PriceListRegisterLoadingState());

      var response = await getlist.call(ParamsPriceListGet(id: 1));

      var result =
          response.fold((l) => PriceListRegisterErrorState(list: prices), (r) {
        prices = r;
        return PriceListRegisterLoadedState(list: r);
      });

      emit(result);
    });
  }

  searchPrices() {
    on<PriceListRegisterSearchEvent>((event, emit) async {
      if (event.search.isNotEmpty) {
        var priceSearched = prices.where((element) {
          String name = element.description;
          return name
              .toLowerCase()
              .trim()
              .contains(event.search.toLowerCase().trim());
        }).toList();
        emit(PriceListRegisterLoadedState(list: priceSearched));
      } else {
        emit(PriceListRegisterLoadedState(list: prices));
      }
    });
  }

  goToInfoPage() {
    on<PriceListRegisterInfoEvent>((event, emit) async {
      emit(PriceListRegisterInfoPageState(list: prices, model: event.model));
    });
  }

  addFunction() {
    on<PriceListRegisterPostEvent>((event, emit) async {
      emit(PriceListRegisterLoadingState());
      var response = await post.call(ParamsPriceListPost(model: event.model));

      var result = response.fold(
        (l) => PriceListRegisterAddErrorState(list: prices),
        (r) {
          prices.add(r);
          return PriceListRegisterAddSuccessState(list: prices);
        },
      );
      emit(result);
    });
  }

  editFunction() {
    on<PriceListRegisterPutEvent>((event, emit) async {
      emit(PriceListRegisterLoadingState());
      var response = await put.call(ParamsPriceListPut(model: event.model));

      var result = response.fold(
        (l) => PriceListRegisterEditErrorState(list: prices),
        (r) {
          return PriceListRegisterEditSuccessState(list: prices);
        },
      );
      emit(result);
    });
  }
}
