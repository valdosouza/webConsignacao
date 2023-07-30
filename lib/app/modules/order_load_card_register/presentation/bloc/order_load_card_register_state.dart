import 'package:appweb/app/modules/order_consignment_register/data/model/order_consignment_list_model.dart';
import 'package:appweb/app/modules/order_load_card_register/data/model/order_load_card_main_model.dart';

abstract class OrderLoadCardRegisterState {}

class OrderLoadCardRegisterLoadingState extends OrderLoadCardRegisterState {}

class OrderLoadCardGetItemsErrorState extends OrderLoadCardRegisterState {
  final String error;

  OrderLoadCardGetItemsErrorState(this.error);
}

class OrderLoadCardGetListErrorState extends OrderLoadCardRegisterState {
  final String error;

  OrderLoadCardGetListErrorState(this.error);
}

class GetListByUserErrorState extends OrderLoadCardRegisterState {
  final String error;

  GetListByUserErrorState(this.error);
}

class OrderLoadCardGetLoadedState extends OrderLoadCardRegisterState {
  final OrderLoadCardMainModel orderLoadCard;

  OrderLoadCardGetLoadedState({required this.orderLoadCard});
}

class OrderLoadCardGetErrorState extends OrderLoadCardRegisterState {
  final String error;

  OrderLoadCardGetErrorState(this.error);
}

class OrderLoadCardGetItemsLoadedState extends OrderLoadCardRegisterState {}

class OrderLoadCardGetListLoadedState extends OrderLoadCardRegisterState {}

class GetListByUserLoadedState extends OrderLoadCardRegisterState {
  final List<OrderConsignmetListModel> orderList;

  GetListByUserLoadedState({required this.orderList});
}

class OrderLoadCardPostErrorState extends OrderLoadCardRegisterState {
  final String error;
  OrderLoadCardPostErrorState({
    required this.error,
  });
}

class OrderLoadCardCardPostSucessState extends OrderLoadCardRegisterState {}

class OrderLoadCardRegisterCalcDoneState extends OrderLoadCardRegisterState {}

class OrderLoadCardRegisterCleanDoneState extends OrderLoadCardRegisterState {}

class OrderLoadCardRegisterInfoPageState extends OrderLoadCardRegisterState {}

class OrderClosureSuccessState extends OrderLoadCardRegisterState {
  final String msg;
  OrderClosureSuccessState({
    required this.msg,
  });
}

class OrderClosureErrorState extends OrderLoadCardRegisterState {
  final String error;

  OrderClosureErrorState({required this.error});
}

class ReturnToLoadCardState extends OrderLoadCardRegisterState {}
