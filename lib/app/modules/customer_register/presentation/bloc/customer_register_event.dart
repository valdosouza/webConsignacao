import 'package:appweb/app/modules/customer_register/data/model/customer_main_model.dart';

abstract class CustomerRegisterEvent {}

class CustomerRegisterGetListEvent extends CustomerRegisterEvent {}

class CustomerRegisterSearchEvent extends CustomerRegisterEvent {
  String search;

  CustomerRegisterSearchEvent({required this.search});
}

class CustomerRegisterInfoEvent extends CustomerRegisterEvent {
  final int? id;
  CustomerRegisterInfoEvent({this.id});
}

class CustomerRegisterCepEvent extends CustomerRegisterEvent {
  final String cep;

  CustomerRegisterCepEvent(this.cep);
}

class CustomerRegisterCnpjEvent extends CustomerRegisterEvent {
  final String cnpj;

  CustomerRegisterCnpjEvent(this.cnpj);
}

class CustomerRegisterGetStatesEvent extends CustomerRegisterEvent {}

class CustomerRegisterGetCitysEvent extends CustomerRegisterEvent {
  final String id;

  CustomerRegisterGetCitysEvent(this.id);
}

class CustomerRegisterReturnEvent extends CustomerRegisterEvent {
  int index;
  CustomerRegisterReturnEvent({
    required this.index,
  });
}

class CustomerRegisterSearchStateEvent extends CustomerRegisterEvent {
  String search;

  CustomerRegisterSearchStateEvent({
    required this.search,
  });
}

class CustomerRegisterSearchCityEvent extends CustomerRegisterEvent {
  String search;

  CustomerRegisterSearchCityEvent({
    required this.search,
  });
}

class CustomerRegisterPostEvent extends CustomerRegisterEvent {
  CustomerMainModel model;

  CustomerRegisterPostEvent({
    required this.model,
  });
}

class CustomerRegisterGetSalesmanEvent extends CustomerRegisterEvent {}

class CustomerRegisterSearchSalesmanEvent extends CustomerRegisterEvent {
  String search;

  CustomerRegisterSearchSalesmanEvent({
    required this.search,
  });
}
