import 'package:appweb/app/modules/sales_route_register/data/model/sales_route_model.dart';

abstract class SalesRouteRegisterState {
  List<SalesRouteRegisterModel> list;

  SalesRouteRegisterState({
    required this.list,
  });
}

class SalesRouteRegisterLoadingState extends SalesRouteRegisterState {
  SalesRouteRegisterLoadingState() : super(list: []);
}

class SalesRouteRegisterLoadedState extends SalesRouteRegisterState {
  SalesRouteRegisterLoadedState({required super.list});
}

class SalesRouteRegisterErrorState extends SalesRouteRegisterState {
  SalesRouteRegisterErrorState({required super.list});
}

class SalesRouteRegisterInfoPageState extends SalesRouteRegisterState {
  final SalesRouteRegisterModel? model;
  SalesRouteRegisterInfoPageState({required super.list, this.model});
}

class SalesRouteRegisterAddSuccessState extends SalesRouteRegisterState {
  SalesRouteRegisterAddSuccessState({required super.list});
}

class SalesRouteRegisterAddErrorState extends SalesRouteRegisterState {
  SalesRouteRegisterAddErrorState({required super.list});
}

class SalesRouteRegisterEditSuccessState extends SalesRouteRegisterState {
  SalesRouteRegisterEditSuccessState({required super.list});
}

class SalesRouteRegisterEditErrorState extends SalesRouteRegisterState {
  SalesRouteRegisterEditErrorState({required super.list});
}
