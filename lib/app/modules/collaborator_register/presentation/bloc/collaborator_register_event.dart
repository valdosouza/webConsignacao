import 'package:appweb/app/modules/collaborator_register/data/model/collaborator_main_model.dart';

abstract class CollaboratorRegisterEvent {}

class CollaboratorRegisterGetListEvent extends CollaboratorRegisterEvent {}

class CollaboratorRegisterSearchEvent extends CollaboratorRegisterEvent {
  String search;

  CollaboratorRegisterSearchEvent({required this.search});
}

class CollaboratorRegisterInfoEvent extends CollaboratorRegisterEvent {
  final int? id;
  CollaboratorRegisterInfoEvent({this.id});
}

class CollaboratorRegisterCepEvent extends CollaboratorRegisterEvent {
  final String cep;

  CollaboratorRegisterCepEvent(this.cep);
}

class CollaboratorRegisterCnpjEvent extends CollaboratorRegisterEvent {
  final String cnpj;

  CollaboratorRegisterCnpjEvent(this.cnpj);
}

class CollaboratorRegisterGetStatesEvent extends CollaboratorRegisterEvent {}

class CollaboratorRegisterGetCitysEvent extends CollaboratorRegisterEvent {
  final int tbStateId;

  CollaboratorRegisterGetCitysEvent(this.tbStateId);
}

class CollaboratorRegisterReturnEvent extends CollaboratorRegisterEvent {
  int index;
  CollaboratorRegisterReturnEvent({
    required this.index,
  });
}

class CollaboratorRegisterSearchStateEvent extends CollaboratorRegisterEvent {
  String search;

  CollaboratorRegisterSearchStateEvent({
    required this.search,
  });
}

class CollaboratorRegisterSearchCityEvent extends CollaboratorRegisterEvent {
  String search;

  CollaboratorRegisterSearchCityEvent({
    required this.search,
  });
}

class CollaboratorRegisterPostEvent extends CollaboratorRegisterEvent {
  CollaboratorMainModel model;

  CollaboratorRegisterPostEvent({
    required this.model,
  });
}

class CollaboratorRegisterGetLineBusinessEvent
    extends CollaboratorRegisterEvent {}

class CollaboratorRegisterSearchLinebusinessEvent
    extends CollaboratorRegisterEvent {
  String search;

  CollaboratorRegisterSearchLinebusinessEvent({
    required this.search,
  });
}
