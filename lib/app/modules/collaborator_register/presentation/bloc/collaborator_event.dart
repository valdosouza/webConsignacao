// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class CollaboratorEvent {}

class CollaboratorLoadingEvent extends CollaboratorEvent {}

class CollaboratorSaveEvent extends CollaboratorEvent {}

class CollaboratorGetEvent extends CollaboratorEvent {
  final int collaboratorId;
  CollaboratorGetEvent({
    required this.collaboratorId,
  });
}

class CollaboratorPutEvent extends CollaboratorEvent {}

class CollaboratorGetStatesEvent extends CollaboratorEvent {}

class CollaboratorReturnEvent extends CollaboratorEvent {
  final int screenIndex;
  CollaboratorReturnEvent({
    required this.screenIndex,
  });
  
}

class CollaboratorCepEvent extends CollaboratorEvent {
  final String cep;

  CollaboratorCepEvent(this.cep);
}

class CollaboratorGetCitysEvent extends CollaboratorEvent {
  final String id;

  CollaboratorGetCitysEvent(this.id);
}

class CollaboratorGetLineBusinessEvent extends CollaboratorEvent{
  final int institution;

  CollaboratorGetLineBusinessEvent(this.institution);
}

class SearchStateEvent extends CollaboratorEvent {
  String search;

  SearchStateEvent({
    required this.search,
  });
}

class SearchCityEvent extends CollaboratorEvent {
  String search;

  SearchCityEvent({
    required this.search,
  });
}

class SearchLineBusinessEvent extends CollaboratorEvent {
  String search;

  SearchLineBusinessEvent({
    required this.search,
  });
}