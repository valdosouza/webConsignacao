import 'package:appweb/app/modules/collaborator_register/data/model/collaborator_model.dart';

abstract class CollaboratorState {
  List<CollaboratorModel> collaboratorList;

  CollaboratorState({
    required this.collaboratorList,
  });
}

class CollaboratorInitialState extends CollaboratorState {
  CollaboratorInitialState() : super(collaboratorList: []);
}

class CollaboratorLoadingState extends CollaboratorState {
  CollaboratorLoadingState() : super(collaboratorList: []);
}

class CollaboratorGetlistSuccessState extends CollaboratorState {
  CollaboratorGetlistSuccessState({
    required List<CollaboratorModel> collaboratorList,
  }) : super(collaboratorList: collaboratorList);
}

class CollaboratorSuccessState extends CollaboratorState {
  CollaboratorSuccessState({
    required List<CollaboratorModel> collaboratorList,
  }) : super(collaboratorList: collaboratorList);
}

class CollaboratorEditSuccessState extends CollaboratorState {
  CollaboratorEditSuccessState(
      {required List<CollaboratorModel> collaboratorList})
      : super(collaboratorList: collaboratorList);
}

class CollaboratorAddSuccessState extends CollaboratorState {
  CollaboratorAddSuccessState(
      {required List<CollaboratorModel> collaboratorList})
      : super(collaboratorList: collaboratorList);
}

class CollaboratorGetlistErrorState extends CollaboratorState {
  CollaboratorGetlistErrorState() : super(collaboratorList: []);
}

class CollaboratorPutErrorState extends CollaboratorState {
  CollaboratorPutErrorState({required List<CollaboratorModel> collaboratorList})
      : super(collaboratorList: collaboratorList);
}

class CollaboratorAddErrorState extends CollaboratorState {
  CollaboratorAddErrorState({required List<CollaboratorModel> collaboratorList})
      : super(collaboratorList: collaboratorList);
}

class CollaboratorErrorState extends CollaboratorState {
  CollaboratorErrorState() : super(collaboratorList: []);
}

class CollaboratorDeleteSuccessState extends CollaboratorState {
  CollaboratorDeleteSuccessState(
      {required List<CollaboratorModel> collaboratorList})
      : super(collaboratorList: collaboratorList);
}

class CollaboratorDeleteErrorState extends CollaboratorState {
  CollaboratorDeleteErrorState(
      {required List<CollaboratorModel> collaboratorList})
      : super(collaboratorList: collaboratorList);
}

class CollaboratorInterationPageState extends CollaboratorState {
  final CollaboratorModel? collaborator;
  CollaboratorInterationPageState({
    this.collaborator,
  }) : super(collaboratorList: []);
}
