import 'package:appweb/app/modules/institution_register/data/model/institution_model.dart';

abstract class InstitutionEvent {}

class InstitutionSaveEvent extends InstitutionEvent {
  InstitutionModel model;

  InstitutionSaveEvent({
    required this.model,
  });
}

class InstitutionGetEvent extends InstitutionEvent {}

class InstitutionPutEvent extends InstitutionEvent {
  InstitutionModel model;

  InstitutionPutEvent({
    required this.model,
  });
}

class InstitutionCepEvent extends InstitutionEvent {
  final String cep;

  InstitutionCepEvent(this.cep);
}

class InstitutionCnpjEvent extends InstitutionEvent {
  final String cnpj;

  InstitutionCnpjEvent(this.cnpj);
}

class InstitutionGetStatesEvent extends InstitutionEvent {}

class InstitutionGetCitiesEvent extends InstitutionEvent {
  final int tbStateId;

  InstitutionGetCitiesEvent(this.tbStateId);
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
