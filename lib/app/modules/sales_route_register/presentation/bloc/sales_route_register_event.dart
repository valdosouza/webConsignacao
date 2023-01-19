abstract class SalesRouteRegisterEvent {}

class SalesRouteRegisterGetListEvent extends SalesRouteRegisterEvent {}

class SalesRouteRegisterSearchEvent extends SalesRouteRegisterEvent {
  String search;

  SalesRouteRegisterSearchEvent({
    required this.search,
  });
}

class SalesRouteRegisterPutEvent extends SalesRouteRegisterEvent {}

class SalesRouteRegisterPostEvent extends SalesRouteRegisterEvent {}

class SalesRouteRegisterAddEvent extends SalesRouteRegisterEvent {}

class SalesRouteRegisterEditEvent extends SalesRouteRegisterEvent {}
