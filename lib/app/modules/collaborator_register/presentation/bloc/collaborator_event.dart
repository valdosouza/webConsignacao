abstract class CollaboratorEvent {}

class CollaboratorSaveEvent extends CollaboratorEvent {}

class CollaboratorGetEvent extends CollaboratorEvent {}

class CollaboratorPutEvent extends CollaboratorEvent {}

class CollaboratorCepEvent extends CollaboratorEvent {
  final String cep;

  CollaboratorCepEvent(this.cep);
}

class CollaboratorCnpjEvent extends CollaboratorEvent {
  final String cnpj;

  CollaboratorCnpjEvent(this.cnpj);
}

class CollaboratorGetStatesEvent extends CollaboratorEvent {}

class CollaboratorGetCitysEvent extends CollaboratorEvent {
  final String id;

  CollaboratorGetCitysEvent(this.id);
}

class CollaboratorGetLineBusinessEvent extends CollaboratorEvent{
  final int institution;

  CollaboratorGetLineBusinessEvent(this.institution);
}

class CollaboratorReturnEvent extends CollaboratorEvent {}

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
