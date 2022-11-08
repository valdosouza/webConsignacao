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
  SalesRouteRegisterLoadedState({required List<SalesRouteRegisterModel> list})
      : super(list: list);
}

class SalesRouteRegisterErrorState extends SalesRouteRegisterState {
  SalesRouteRegisterErrorState({required List<SalesRouteRegisterModel> list})
      : super(list: list);
}

class SalesRouteRegisterInfoPageState extends SalesRouteRegisterState {
  final SalesRouteRegisterModel? model;
  SalesRouteRegisterInfoPageState(
      {required List<SalesRouteRegisterModel> list, this.model})
      : super(list: list);
}

class SalesRouteRegisterAddSuccessState extends SalesRouteRegisterState {
  SalesRouteRegisterAddSuccessState(
      {required List<SalesRouteRegisterModel> list})
      : super(list: list);
}

class SalesRouteRegisterAddErrorState extends SalesRouteRegisterState {
  SalesRouteRegisterAddErrorState({required List<SalesRouteRegisterModel> list})
      : super(list: list);
}

class SalesRouteRegisterEditSuccessState extends SalesRouteRegisterState {
  SalesRouteRegisterEditSuccessState(
      {required List<SalesRouteRegisterModel> list})
      : super(list: list);
}

class SalesRouteRegisterEditErrorState extends SalesRouteRegisterState {
  SalesRouteRegisterEditErrorState(
      {required List<SalesRouteRegisterModel> list})
      : super(list: list);
}
