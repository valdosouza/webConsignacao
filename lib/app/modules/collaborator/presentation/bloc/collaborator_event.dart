// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:appweb/app/modules/collaborator_register/data/model/collaborator_model.dart';

abstract class CollaboratorEvent {}

class LoadCollaboratorEvent extends CollaboratorEvent {
  final int institution;
  LoadCollaboratorEvent({
    required this.institution,
  });
}

class SearchCollaboratorEvent extends CollaboratorEvent {
  String search;

  SearchCollaboratorEvent({
    required this.search,
  });
}

class DeleteCollaboratorEvent extends CollaboratorEvent {
  int collaboratorId;

  DeleteCollaboratorEvent({
    required this.collaboratorId,
  });
}

class CollaboratorInterationEvent extends CollaboratorEvent {
  CollaboratorModel? collaborator;

  CollaboratorInterationEvent({
    this.collaborator,
  });
}
