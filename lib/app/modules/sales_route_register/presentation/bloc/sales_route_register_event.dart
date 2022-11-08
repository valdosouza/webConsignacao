import 'package:appweb/app/modules/sales_route_register/data/model/sales_route_model.dart';

abstract class SalesRouteRegisterEvent {}

class SalesRouteRegisterGetListEvent extends SalesRouteRegisterEvent {}

class SalesRouteRegisterSearchEvent extends SalesRouteRegisterEvent {
  String search;

  SalesRouteRegisterSearchEvent({
    required this.search,
  });
}

class SalesRouteRegisterPutEvent extends SalesRouteRegisterEvent {
  final SalesRouteRegisterModel model;

  SalesRouteRegisterPutEvent({required this.model});
}

class SalesRouteRegisterPostEvent extends SalesRouteRegisterEvent {
  final SalesRouteRegisterModel model;

  SalesRouteRegisterPostEvent({required this.model});
}

class SalesRouteRegisterInfoEvent extends SalesRouteRegisterEvent {
  final SalesRouteRegisterModel? model;
  SalesRouteRegisterInfoEvent({this.model});
}
