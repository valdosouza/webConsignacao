import 'package:appweb/app/core/shared/enum.dart';
import 'package:appweb/app/modules/line_business_register/data/model/linebusiness_model.dart';
import 'package:appweb/app/modules/line_business_register/domain/usecase/linebusiness_register_delete.dart';
import 'package:appweb/app/modules/line_business_register/domain/usecase/linebusiness_register_getlist.dart';
import 'package:appweb/app/modules/line_business_register/domain/usecase/linebusiness_register_post.dart';
import 'package:appweb/app/modules/line_business_register/domain/usecase/linebusiness_register_put.dart';
import 'package:appweb/app/modules/line_business_register/presentation/bloc/linebusiness_register_event.dart';
import 'package:appweb/app/modules/line_business_register/presentation/bloc/linebusiness_register_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class LinebusinessRegisterBloc
    extends Bloc<LinebusinessregisterEvent, LinebusinessRegisterState> {
  final LinebusinessRegisterGetlist getlist;
  final LinebusinessRegisterPost post;
  final LinebusinessRegisterPut put;
  final LinebusinessRegisterDelete delete;

  List<LinebusinessModel> modelList = [];
  LinebusinessModel model = LinebusinessModel.empty();
  OptionYesNo? optionYesNo = OptionYesNo.S;

  LinebusinessRegisterBloc({
    required this.getlist,
    required this.post,
    required this.put,
    required this.delete,
  }) : super(LinebusinessLoadingState()) {
    getList();

    search();

    linebusinessAdd();

    linebusinessEdit();

    postFunction();

    putFunction();
  }

  getList() {
    on<LinebusinessGetListEvent>((event, emit) async {
      emit(LinebusinessLoadingState());

      var response = await getlist.call(ParamsLinebusinessRegisterGet());

      var result =
          response.fold((l) => LinebusinessErrorState(list: modelList), (r) {
        modelList = r;
        return LinebusinessLoadedState(list: r);
      });

      emit(result);
    });
  }

  search() {
    on<LinebusinessSearchEvent>((event, emit) async {
      if (event.search.isNotEmpty) {
        var searched = modelList.where((element) {
          String name = element.description;
          return name
              .toLowerCase()
              .trim()
              .contains(event.search.toLowerCase().trim());
        }).toList();
        emit(LinebusinessLoadedState(list: searched));
      } else {
        emit(LinebusinessLoadedState(list: modelList));
      }
    });
  }

  linebusinessAdd() {
    on<LinebusinessAddEvent>((event, emit) async {
      model = LinebusinessModel.empty();
      optionYesNo = OptionYesNo.S;
      emit(LinebusinessInfoPageState(list: modelList));
    });
  }

  linebusinessEdit() {
    on<LinebusinessEditEvent>((event, emit) async {
      (model.active == "S")
          ? optionYesNo = OptionYesNo.S
          : optionYesNo = OptionYesNo.N;
      emit(LinebusinessInfoPageState(list: modelList));
    });
  }

  postFunction() {
    on<LinebusinessPostEvent>((event, emit) async {
      emit(LinebusinessLoadingState());
      var response = await post.call(ParamsLinebusinessPost(model: model));

      var result = response.fold(
        (l) => LinebusinessAddErrorState(list: modelList),
        (r) {
          modelList.add(r);
          return LinebusinessAddSuccessState(list: modelList);
        },
      );
      emit(result);
    });
  }

  putFunction() {
    on<LinebusinessPutEvent>((event, emit) async {
      emit(LinebusinessLoadingState());
      var response = await put.call(ParamsLinebusinessPut(model: model));

      var result = response.fold(
        (l) => LinebusinessEditErrorState(list: modelList),
        (r) {
          return LinebusinessEditSuccessState(list: modelList);
        },
      );
      emit(result);
    });
  }
}
