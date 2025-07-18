import 'package:appweb/app/core/shared/enum.dart';
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

  List<PriceListModel> modelList = [];
  PriceListModel model = PriceListModel.empty();
  OptionYesNo? optionYesNo = OptionYesNo.S;

  PriceListRegisterBloc({
    required this.getlist,
    required this.post,
    required this.put,
    required this.delete,
  }) : super(PriceListRegisterLoadingState()) {
    getList();

    search();

    priceListAdd();

    priceListEdit();

    postFunction();

    putFunction();
  }

  void getList() {
    on<PriceListRegisterGetListEvent>((event, emit) async {
      emit(PriceListRegisterLoadingState());

      var response = await getlist.call(ParamsPriceListGet());

      var result = response
          .fold((l) => PriceListRegisterErrorState(list: modelList), (r) {
        modelList = r;
        return PriceListRegisterLoadedState(list: r);
      });

      emit(result);
    });
  }

  void search() {
    on<PriceListRegisterSearchEvent>((event, emit) async {
      if (event.search.isNotEmpty) {
        var searched = modelList.where((element) {
          String name = element.description;
          return name
              .toLowerCase()
              .trim()
              .contains(event.search.toLowerCase().trim());
        }).toList();
        emit(PriceListRegisterLoadedState(list: searched));
      } else {
        emit(PriceListRegisterLoadedState(list: modelList));
      }
    });
  }

  void priceListAdd() {
    on<PriceListRegisterAddEvent>((event, emit) async {
      model = PriceListModel.empty();
      optionYesNo = OptionYesNo.S;
      emit(PriceListRegisterInfoPageState(list: modelList));
    });
  }

  void priceListEdit() {
    on<PriceListRegisterEditEvent>((event, emit) async {
      (model.active == "S")
          ? optionYesNo = OptionYesNo.S
          : optionYesNo = OptionYesNo.N;
      emit(PriceListRegisterInfoPageState(list: modelList));
    });
  }

  void postFunction() {
    on<PriceListRegisterPostEvent>((event, emit) async {
      emit(PriceListRegisterLoadingState());
      var response = await post.call(ParamsPriceListPost(model: model));

      var result = response.fold(
        (l) => PriceListRegisterAddErrorState(list: modelList),
        (r) {
          modelList.add(r);
          return PriceListRegisterAddSuccessState(list: modelList);
        },
      );
      emit(result);
    });
  }

  void putFunction() {
    on<PriceListRegisterPutEvent>((event, emit) async {
      emit(PriceListRegisterLoadingState());
      var response = await put.call(ParamsPriceListPut(model: model));

      var result = response.fold(
        (l) => PriceListRegisterEditErrorState(list: modelList),
        (r) {
          return PriceListRegisterEditSuccessState(list: modelList);
        },
      );
      emit(result);
    });
  }
}
