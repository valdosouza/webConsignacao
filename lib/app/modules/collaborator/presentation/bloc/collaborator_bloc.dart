// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:appweb/app/modules/collaborator_register/data/model/collaborator_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:appweb/app/modules/collaborator/presentation/bloc/collaborator_event.dart';
import 'package:appweb/app/modules/collaborator/presentation/bloc/collaborator_state.dart';
import 'package:appweb/app/modules/collaborator_register/domain/usecase/collaborator_getlist_usecase.dart';
import 'package:appweb/app/modules/collaborator_register/presentation/bloc/collaborator_bloc.dart';

class CollaboratorBloc extends Bloc<CollaboratorEvent, CollaboratorState> {
  final CollaboratorGetlist getlist;

  CollaboratorBloc({required this.getlist})
      : super(CollaboratorInitialState()) {
    on<LoadCollaboratorEvent>((event, emit) async {
      final result =
          await getlist.call(ParamsGetlist(institution: event.institution));
      result.fold((l) {
        emit(CollaboratorGetlistErrorState());
      }, (r) {
        List<CollaboratorModel> collaborators = r;
        emit(CollaboratorGetlistSuccessState(collaboratorList: collaborators));
      });
    });
    on<SearchCollaboratorEvent>((event, emit) {});
    on<DeleteCollaboratorEvent>((event, emit) {});
    on<CollaboratorInterationEvent>((event, emit) {
      emit(CollaboratorInterationPageState(collaborator: event.collaborator));
    });
  }
}
