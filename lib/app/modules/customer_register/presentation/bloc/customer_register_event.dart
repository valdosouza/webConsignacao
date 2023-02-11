import 'package:appweb/app/modules/customer_register/data/model/customer_main_model.dart';

abstract class CustomerRegisterEvent {}

class CustomerRegisterGetListEvent extends CustomerRegisterEvent {}

class CustomerRegisterSearchEvent extends CustomerRegisterEvent {
  String search;

  CustomerRegisterSearchEvent({required this.search});
}

class CustomerRegisterDesktopEvent extends CustomerRegisterEvent {
  final int? id;
  CustomerRegisterDesktopEvent({this.id});
}

class CustomerRegisterMobileNewEvent extends CustomerRegisterEvent {}

class CustomerRegisterMobileEditEvent extends CustomerRegisterEvent {
  final int tbCustomerId;

  CustomerRegisterMobileEditEvent({required this.tbCustomerId});
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
  final int tbStateId;

  CustomerRegisterGetCitysEvent(this.tbStateId);
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

class CustomerRegisterPostByDesktopEvent extends CustomerRegisterEvent {
  CustomerMainModel model;

  CustomerRegisterPostByDesktopEvent({
    required this.model,
  });
}

class CustomerRegisterPostByMobileEvent extends CustomerRegisterEvent {
  CustomerMainModel model;

  CustomerRegisterPostByMobileEvent({
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

class CustomerRegisterGetSalesRouteEvent extends CustomerRegisterEvent {}

class CustomerRegisterSearchSalesRouteEvent extends CustomerRegisterEvent {
  String search;

  CustomerRegisterSearchSalesRouteEvent({
    required this.search,
  });
}
