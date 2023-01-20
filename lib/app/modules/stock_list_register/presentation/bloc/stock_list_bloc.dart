import 'package:appweb/app/core/shared/enum.dart';
import 'package:appweb/app/modules/Core/data/model/stock_list_model.dart';
import 'package:appweb/app/modules/stock_list_register/domain/usecase/stock_list_register_delete.dart';
import 'package:appweb/app/modules/stock_list_register/domain/usecase/stock_list_register_getlist.dart';
import 'package:appweb/app/modules/stock_list_register/domain/usecase/stock_list_register_post.dart';
import 'package:appweb/app/modules/stock_list_register/domain/usecase/stock_list_register_put.dart';
import 'package:appweb/app/modules/stock_list_register/presentation/bloc/stock_list_events.dart';
import 'package:appweb/app/modules/stock_list_register/presentation/bloc/stock_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StockListBloc extends Bloc<StockListEvent, StockListState> {
  final StockListRegisterGetlist getlist;
  final StockListRegisterPost post;
  final StockListRegisterPut put;
  final StockListRegisterDelete delete;

  List<StockListModel> modelList = [];
  StockListModel model = StockListModel.empty();
  OptionYesNo? optionYesNo = OptionYesNo.S;

  StockListBloc({
    required this.getlist,
    required this.post,
    required this.put,
    required this.delete,
  }) : super(StockListLoadingState()) {
    getList();

    search();

    stockListAdd();

    stockListEdit();

    postFunction();

    putFunction();
  }

  getList() {
    on<StockListGetListEvent>((event, emit) async {
      emit(StockListLoadingState());

      var response = await getlist.call(ParamsStockListGetList());

      var result =
          response.fold((l) => StockListErrorState(list: modelList), (r) {
        modelList = r;
        return StockListLoadedState(list: r);
      });

      emit(result);
    });
  }

  search() {
    on<StockListSearchEvent>((event, emit) async {
      if (event.search.isNotEmpty) {
        var searched = modelList.where((element) {
          String name = element.description;
          return name
              .toLowerCase()
              .trim()
              .contains(event.search.toLowerCase().trim());
        }).toList();
        emit(StockListLoadedState(list: searched));
      } else {
        emit(StockListLoadedState(list: modelList));
      }
    });
  }

  stockListAdd() {
    on<StockListAddEvent>((event, emit) async {
      model = StockListModel.empty();
      optionYesNo = OptionYesNo.S;
      emit(StockListInfoPageState(list: modelList));
    });
  }

  stockListEdit() {
    on<StockListEditEvent>((event, emit) async {
      (model.active == "S")
          ? optionYesNo = OptionYesNo.S
          : optionYesNo = OptionYesNo.N;
      emit(StockListInfoPageState(list: modelList));
    });
  }

  postFunction() {
    on<StockListPostEvent>((event, emit) async {
      emit(StockListLoadingState());
      var response = await post.call(ParamsStockListPost(model: model));

      var result = response.fold(
        (l) => StockListAddErrorState(list: modelList),
        (r) {
          modelList.add(r);
          return StockListAddSuccessState(list: modelList);
        },
      );
      emit(result);
    });
  }

  putFunction() {
    on<StockListPutEvent>((event, emit) async {
      emit(StockListLoadingState());
      var response = await put.call(ParamsStockListPut(model: model));

      var result = response.fold(
        (l) {
          return StockListEditErrorState(list: modelList);
        },
        (r) {
          return StockListEditSuccessState(list: modelList);
        },
      );
      emit(result);
    });
  }
}
