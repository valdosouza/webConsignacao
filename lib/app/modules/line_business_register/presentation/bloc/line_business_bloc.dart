import 'package:appweb/app/modules/line_business_register/data/models/line_business_model.dart';
import 'package:appweb/app/modules/line_business_register/domain/usecases/line_business_delete.dart';
import 'package:appweb/app/modules/line_business_register/domain/usecases/line_business_getlist.dart';
import 'package:appweb/app/modules/line_business_register/domain/usecases/line_business_post.dart';
import 'package:appweb/app/modules/line_business_register/domain/usecases/line_business_put.dart';
import 'package:appweb/app/modules/line_business_register/presentation/bloc/line_business_events.dart';
import 'package:appweb/app/modules/line_business_register/presentation/bloc/line_business_states.dart';

import 'package:bloc/bloc.dart';

class LineBusinessBloc extends Bloc<LineBusinessEvent, LineBusinessState> {
  final LineBusinessGetlist getlist;
  final LineBusinessDelete delete;
  final LineBusinessPost post;
  final LineBusinessPut put;

  List<LineBusinessModel> list = [];

  LineBusinessBloc({
    required this.getlist,
    required this.delete,
    required this.post,
    required this.put,
  }) : super(LineBusinessInitialState()) {
    on<LoadLineBusinessEvent>((event, emit) async {
      LineBusinessInitialState();
      var response = await getlist.call(const Params(institutionId: 1));
      var result = response.fold(
        (l) => LineBusinessErrorState(),
        (r) {
          list = r;
          return LineBusinessSuccessState(lineBusinessList: r);
        },
      );
      emit(result);
    });

    on<SearchLineBusinessEvent>((event, emit) async {
      if (event.search.isNotEmpty) {
        var clienstSearched = list.where((element) {
          String name = element.description;
          return name
              .toLowerCase()
              .trim()
              .contains(event.search.toLowerCase().trim());
        }).toList();
        if (clienstSearched.isEmpty) {}
        emit(LineBusinessSuccessState(lineBusinessList: clienstSearched));
      } else {
        emit(LineBusinessSuccessState(lineBusinessList: list));
      }
    });

    on<DeleteLineBusinessEvent>((event, emit) async {
      LineBusinessInitialState();
      var response = await delete
          .call(DeleteLineBusinessParams(idLineBusiness: event.lineBusinessId));
      var result = response.fold(
        (l) => LineBusinessDeleteErrorState(lineBusinessList: list),
        (r) {
          list.removeWhere((element) => element.id == event.lineBusinessId);
          return LineBusinessDeleteSuccessState(lineBusinessList: list);
        },
      );
      emit(result);
    });

    on<LineBusinessInterationEvent>((event, emit) async {
      emit(LineBusinessInterationPageState(
          lineBusinessList: list, lineBusiness: event.lineBusiness));
    });

    on<AddLineBusinessEvent>((event, emit) async {
      LineBusinessInitialState();
      var response = await post
          .call(PostLineBusinessParams(lineBusinessId: event.lineBusiness));
      var result = response.fold(
        (l) => LineBusinessAddErrorState(lineBusinessList: list),
        (r) => LineBusinessAddSuccessState(
          lineBusinessList: list,
        ),
      );
      emit(result);
    });

    on<EditLineBusinessEvent>((event, emit) async {
      LineBusinessInitialState();
      var response = await put
          .call(PutLineBusinessParams(businessModel: event.lineBusiness));
      var result = response.fold(
        (l) => LineBusinessPutErrorState(lineBusinessList: list),
        (r) => LineBusinessPutErrorState(lineBusinessList: list),
      );
      emit(result);
    });
  }
}
