// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:appweb/app/modules/collaborator_register/data/model/collaborator_model.dart';
import 'package:bloc/bloc.dart';

import 'package:appweb/app/modules/collaborator/presentation/bloc/collaborator_event.dart';
import 'package:appweb/app/modules/collaborator/presentation/bloc/collaborator_state.dart';
import 'package:appweb/app/modules/collaborator_register/domain/usecase/collaborator_getlist_usecase.dart';

class CollaboratorBloc extends Bloc<CollaboratorEvent, CollaboratorState> {
  final CollaboratorGetlist getlist;
  List<CollaboratorModel> collaborators = [];

  CollaboratorBloc({required this.getlist})
      : super(CollaboratorInitialState()) {
    on<LoadCollaboratorEvent>((event, emit) async {
      final result =
          await getlist.call(ParamsGetlist(institution: event.institution));
      result.fold((l) {
        emit(CollaboratorGetlistErrorState());
      }, (r) {
        collaborators = r;
        emit(CollaboratorGetlistSuccessState(collaboratorList: collaborators));
      });
    });
    on<SearchCollaboratorEvent>((event, emit) {
        if (event.search.isNotEmpty) {
        var collaboratorSearched = collaborators.where((element) {
          String name = element.entity!.nameCompany;
          return name
              .toLowerCase()
              .trim()
              .contains(event.search.toLowerCase().trim());
        }).toList();
        if (collaboratorSearched.isEmpty) {}
        emit(CollaboratorGetlistSuccessState(
            collaboratorList: collaboratorSearched));
      } else {
        emit(CollaboratorGetlistSuccessState(
            collaboratorList: collaborators));
      }
    });
    on<DeleteCollaboratorEvent>((event, emit) {});
    on<CollaboratorInterationEvent>((event, emit) {
      emit(CollaboratorInterationPageState(collaborator: event.collaborator));
    });
  }
}
