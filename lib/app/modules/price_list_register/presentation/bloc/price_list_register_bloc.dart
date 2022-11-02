import 'package:appweb/app/modules/price_list_register/data/model/price_list_register_model.dart';
import 'package:appweb/app/modules/price_list_register/domain/usecase/price_list_register_delete.dart';
import 'package:appweb/app/modules/price_list_register/domain/usecase/price_list_register_edit.dart';
import 'package:appweb/app/modules/price_list_register/domain/usecase/price_list_register_get_list.dart';
import 'package:appweb/app/modules/price_list_register/domain/usecase/price_list_register_post.dart';
import 'package:appweb/app/modules/price_list_register/presentation/bloc/price_list_register_event.dart';
import 'package:appweb/app/modules/price_list_register/presentation/bloc/price_list_register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PriceListRegisterBloc
    extends Bloc<PriceListRegisterEvent, PriceListRegisterState> {
  final PriceListRegisterGetlist getlist;
  final PriceListRegisterPost post;
  final PriceListRegisterEdit put;
  final PriceListRegisterDelete delete;

  List<PriceListRegisterModel> prices = [];

  PriceListRegisterBloc({
    required this.getlist,
    required this.post,
    required this.put,
    required this.delete,
  }) : super(PriceListRegisterLoadingState()) {
    getList();

    searchPrices();
  }

  getList() {
    on<PriceListRegisterGetListEvent>((event, emit) async {
      emit(PriceListRegisterLoadingState());

      var response = await getlist.call(ParamsPriceListGet(id: 1));

      var result = response
          .fold((l) => PriceListRegisterErrorState(prices: prices), (r) {
        prices = r;
        return PriceListRegisterLoadedState(prices: r);
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
        emit(PriceListRegisterLoadedState(prices: priceSearched));
      } else {
        emit(PriceListRegisterLoadedState(prices: prices));
      }
    });
  }
}
