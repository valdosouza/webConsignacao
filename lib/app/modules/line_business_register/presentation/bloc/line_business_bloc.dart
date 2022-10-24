import 'package:appweb/app/modules/line_business_register/data/models/line_business_model.dart';
import 'package:appweb/app/modules/line_business_register/domain/usecases/line_business_add.dart';
import 'package:appweb/app/modules/line_business_register/domain/usecases/line_business_put.dart';
import 'package:appweb/app/modules/line_business_register/presentation/bloc/line_business_events.dart';
import 'package:appweb/app/modules/line_business_register/presentation/bloc/line_business_states.dart';
import 'package:bloc/bloc.dart';

import '../../domain/usecases/line_business_delete.dart';
import '../../domain/usecases/line_business_getlist.dart';

class LineBusinessBloc extends Bloc<LineBusinessEvent, LineBusinessState> {
  final LineBusinessGetlist getlistLineBusiness;
  final LineBusinessDelete deleteLineBusiness;
  final LineBusinessAdd addLineBusiness;
  final LineBusinessPut putLineBusiness;

  late List<LineBusinessModel> lineBusinessModel;

  LineBusinessBloc(
      {required this.addLineBusiness,
      required this.deleteLineBusiness,
      required this.getlistLineBusiness,
      required this.putLineBusiness})
      : super(LineBusinessInitialState()) {
    on<LineBusinessGetlistEvent>((event, emit) async {
      final response = await getlistLineBusiness
          .call(GetlistLineBusinessParams(idInstitution: event.idInstitution));
      final result = response.fold((l) => LineBusinessGetlistErrorState(), (r) {
        lineBusinessModel = r;
        return LineBusinessGetlistSuccessEvent(lineBusiness: lineBusinessModel);
      });
      emit(result);
    });
    on<LineBusinessAddEvent>((event, emit) async {
      final response = await addLineBusiness.call(AddLineBusinessParams(businessModel: event.lineBusinessModel));
      final result = response.fold((l) => LineBusinessAddErrorState(lineBusiness: lineBusinessModel), (r) {
        return LineBusinessAddSuccessState();
      });
      emit(result);
    });
    on<LineBusinessPutEvent>((event, emit) async {
      final response = await putLineBusiness
          .call(PutLineBusinessParams(businessModel: event.lineBusinessModel));
      final result = response.fold((l) => LineBusinessPutErrorState(lineBusiness: lineBusinessModel), (r) {
        return LineBusinessPutSuccessState();
      });
      emit(result);
    });
    on<LineBusinessDeleteEvent>((event, emit) async {
      final response = await deleteLineBusiness
          .call(DeleteLineBusinessParams(idLineBusiness: event.idLineBusiness));
      final result = response.fold((l) => LineBusinessDeleteErrorState(lineBusiness: lineBusinessModel), (r) {
        lineBusinessModel.removeWhere((element) => element.id == event.idLineBusiness);
        return LineBusinessDeleteErrorState(lineBusiness: lineBusinessModel);
      });
      emit(result);
    });
    on<LineBusinessSearchEvent>((event, emit) async {
      String search = event.search.trim().toUpperCase();
      List<LineBusinessModel> searchedLineBusinesss = lineBusinessModel.where((element) {
        bool containsSearchedLineBusiness =
            element.description.trim().toUpperCase().contains(search);
        return containsSearchedLineBusiness;
      }).toList();
      emit(LineBusinessSearchState(lineBusiness: searchedLineBusinesss));
    });
  }
}
