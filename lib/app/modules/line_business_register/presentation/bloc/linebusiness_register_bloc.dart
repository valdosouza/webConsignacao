import 'package:appweb/app/modules/line_business_register/data/model/linebusiness_model.dart';
import 'package:appweb/app/modules/line_business_register/domain/usecase/linebusiness_register_delete.dart';
import 'package:appweb/app/modules/line_business_register/domain/usecase/linebusiness_register_getlist.dart';
import 'package:appweb/app/modules/line_business_register/domain/usecase/linebusiness_register_post.dart';
import 'package:appweb/app/modules/line_business_register/domain/usecase/linebusiness_register_put.dart';
import 'package:appweb/app/modules/line_business_register/presentation/bloc/linebusiness_register_events.dart';
import 'package:appweb/app/modules/line_business_register/presentation/bloc/linebusiness_register_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LinebusinessRegisterBloc
    extends Bloc<LinebusinessRegisterEvent, LinebusinessRegisterState> {
  final LinebusinessRegisterGetlist getlist;
  final LinebusinessRegisterPost post;
  final LinebusinessRegisterPut put;
  final LinebusinessRegisterDelete delete;

  List<LinebusinessModel> model = [];

  LinebusinessRegisterBloc({
    required this.getlist,
    required this.post,
    required this.put,
    required this.delete,
  }) : super(LinebusinessRegisterLoadingState()) {
    getList();

    searchPrices();

    goToInfoPage();

    addFunction();

    editFunction();
  }

  getList() {
    on<LinebusinessRegisterGetListEvent>((event, emit) async {
      emit(LinebusinessRegisterLoadingState());

      var response =
          await getlist.call(ParamsLinebusinessRegisterGet(tbInstitutionId: 1));

      var result = response
          .fold((l) => LinebusinessRegisterErrorState(list: model), (r) {
        model = r;
        return LinebusinessRegisterLoadedState(list: r);
      });

      emit(result);
    });
  }

  searchPrices() {
    on<LinebusinessRegisterSearchEvent>((event, emit) async {
      if (event.search.isNotEmpty) {
        var priceSearched = model.where((element) {
          String name = element.description;
          return name
              .toLowerCase()
              .trim()
              .contains(event.search.toLowerCase().trim());
        }).toList();
        emit(LinebusinessRegisterLoadedState(list: priceSearched));
      } else {
        emit(LinebusinessRegisterLoadedState(list: model));
      }
    });
  }

  goToInfoPage() {
    on<LinebusinessRegisterInfoEvent>((event, emit) async {
      emit(LinebusinessRegisterInfoPageState(list: model, model: event.model));
    });
  }

  addFunction() {
    on<LinebusinessRegisterPostEvent>((event, emit) async {
      LinebusinessRegisterLoadingState();
      var response =
          await post.call(ParamsLinebusinessPost(model: event.model));

      var result = response.fold(
        (l) => LinebusinessRegisterAddErrorState(list: model),
        (r) {
          model.add(r);
          return LinebusinessRegisterAddSuccessState(list: model);
        },
      );
      emit(result);
    });
  }

  editFunction() {
    on<LinebusinessRegisterPutEvent>((event, emit) async {
      LinebusinessRegisterLoadingState();
      var response = await put.call(ParamsLinebusinessPut(model: event.model));

      var result = response.fold(
        (l) => LinebusinessRegisterEditErrorState(list: model),
        (r) {
          return LinebusinessRegisterEditSuccessState(list: model);
        },
      );
      emit(result);
    });
  }
}
