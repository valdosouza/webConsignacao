abstract class InstitutionEvent {}

class InstitutionSaveEvent extends InstitutionEvent {}

class InstitutionGetEvent extends InstitutionEvent {}

class InstitutionPutEvent extends InstitutionEvent {}

class InstitutionCepEvent extends InstitutionEvent {
  final String cep;

  InstitutionCepEvent(this.cep);
}

class InstitutionCnpjEvent extends InstitutionEvent {
  final String cnpj;

  InstitutionCnpjEvent(this.cnpj);
}

class InstitutionGetStatesEvent extends InstitutionEvent {}

class InstitutionGetCitysEvent extends InstitutionEvent {
  final String id;

  InstitutionGetCitysEvent(this.id);
}

class InstitutionReturnEvent extends InstitutionEvent {}

class SearchStateEvent extends InstitutionEvent {
  String search;

  SearchStateEvent({
    required this.search,
  });
}

class SearchCityEvent extends InstitutionEvent {
  String search;

  SearchCityEvent({
    required this.search,
  });
}
