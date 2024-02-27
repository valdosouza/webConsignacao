import 'package:appweb/app/core/shared/enum.dart';
import 'package:appweb/app/modules/Core/data/model/salesman_list_model.dart';
import 'package:appweb/app/modules/Core/domain/usecase/get_salesman.dart';
import 'package:appweb/app/modules/Core/data/model/region_model.dart';
import 'package:appweb/app/modules/region_register/domain/usecase/region_register_delete.dart';
import 'package:appweb/app/modules/region_register/domain/usecase/region_register_get_list.dart';
import 'package:appweb/app/modules/region_register/domain/usecase/region_register_post.dart';
import 'package:appweb/app/modules/region_register/domain/usecase/region_register_put.dart';
import 'package:appweb/app/modules/region_register/presentation/bloc/region_register_event.dart';
import 'package:appweb/app/modules/region_register/presentation/bloc/region_register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegionRegisterBloc
    extends Bloc<RegionRegisterEvent, RegionRegisterState> {
  final RegionRegisterGetlist getlist;
  final RegionRegisterPost post;
  final RegionRegisterPut put;
  final RegionRegisterDelete delete;
  final GetSalesman getSalesmans;

  List<RegionModel> list = [];
  List<SalesmanListModel> salesmans = [];
  RegionModel model = RegionModel.empty();
  OptionYesNo? optionYesNo = OptionYesNo.S;

  RegionRegisterBloc({
    required this.getlist,
    required this.post,
    required this.put,
    required this.delete,
    required this.getSalesmans,
  }) : super(RegionRegisterLoadingState()) {
    getList();

    searchRouteSales();

    regionAdd();

    regionEdit();

    postFunction();

    putFunction();

    getSalesmansList();

    on<RegionRegisterReturnEvent>((event, emit) =>
        emit(RegionRegisterInfoPageState(model: model, list: list)));
  }

  getList() {
    on<RegionRegisterGetListEvent>((event, emit) async {
      emit(RegionRegisterLoadingState());

      var response = await getlist.call(ParamsRegionGet());

      var result =
          response.fold((l) => RegionRegisterErrorState(list: list), (r) {
        list = r;
        return RegionRegisterLoadedState(list: r);
      });

      emit(result);
    });
  }

  searchRouteSales() {
    on<RegionRegisterSearchEvent>((event, emit) async {
      if (event.search.isNotEmpty) {
        var listearched = list.where((element) {
          String name = element.description;
          return name
              .toLowerCase()
              .trim()
              .contains(event.search.toLowerCase().trim());
        }).toList();
        emit(RegionRegisterLoadedState(list: listearched));
      } else {
        emit(RegionRegisterLoadedState(list: list));
      }
    });
  }

  regionAdd() {
    on<RegionRegisterAddEvent>((event, emit) async {
      model = RegionModel.empty();
      optionYesNo = OptionYesNo.S;
      emit(RegionRegisterInfoPageState(list: list));
    });
  }

  regionEdit() {
    on<RegionRegisterEditEvent>((event, emit) async {
      (model.active == "S")
          ? optionYesNo = OptionYesNo.S
          : optionYesNo = OptionYesNo.N;
      emit(RegionRegisterInfoPageState(list: list));
    });
  }

  postFunction() {
    on<RegionRegisterPostEvent>((event, emit) async {
      emit(RegionRegisterLoadingState());
      var response = await post.call(ParamsRegionPost(model: model));

      var result = response.fold(
        (l) => RegionRegisterAddErrorState(list: list),
        (r) {
          list.add(r);
          return RegionRegisterAddSuccessState(list: list);
        },
      );
      emit(result);
    });
  }

  putFunction() {
    on<RegionRegisterPutEvent>((event, emit) async {
      emit(RegionRegisterLoadingState());
      var response = await put.call(ParamsRegionPut(model: model));

      var result = response.fold(
        (l) => RegionRegisterEditErrorState(list: list),
        (r) {
          return RegionRegisterEditSuccessState(list: list);
        },
      );
      emit(result);
    });
  }

  getSalesmansList() {
    on<RegionRegisterGetSalesmanEvent>((event, emit) async {
      emit(RegionRegisterLoadingState());

      var response = await getSalesmans.call(ParamsSalesmanListGet());

      response.fold((l) => emit(RegionRegisterGetSalesmanErrorState(list)),
          (r) {
        salesmans = r;
        emit(RegionRegisterGetSalesmanSuccessState(list, r));
      });
    });
  }
}
