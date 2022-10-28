import 'package:appweb/app/modules/customer_register/data/model/consumer_main_model.dart';

abstract class CustomerRegisterEvent {}

class CustomerRegisterGetListEvent extends CustomerRegisterEvent {}

class CustomerRegisterSearchEvent extends CustomerRegisterEvent {
  String search;

  CustomerRegisterSearchEvent({required this.search});
}

class CustomerRegisterInfoEvent extends CustomerRegisterEvent {
  final CustomerMainModel model;
  CustomerRegisterInfoEvent({required this.model});
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

class CustomerRegisterReturnEvent extends CustomerRegisterEvent {}

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
