abstract class OrderLoadCardRegisterEvent {}

class OrderLoadCardRegisterGetCardEvent extends OrderLoadCardRegisterEvent {
  final int tbSalesmanId;

  OrderLoadCardRegisterGetCardEvent({required this.tbSalesmanId});
}

class OrderLoadCardRegisterGetListCardEvent
    extends OrderLoadCardRegisterEvent {}

class GetListByUserEvent extends OrderLoadCardRegisterEvent {}

class ReturnToLoadCardEvent extends OrderLoadCardRegisterEvent {}

class SearchEvent extends OrderLoadCardRegisterEvent {
  String search;

  SearchEvent({
    required this.search,
  });
}

class GetOrderLoadCard extends OrderLoadCardRegisterEvent {
  final int orderId;
  GetOrderLoadCard({
    required this.orderId,
  });
}

class OrderLoadCardPostEvent extends OrderLoadCardRegisterEvent {}

class OrderLoadCardRegisterClearEvent extends OrderLoadCardRegisterEvent {}

class OrderLoadCardRegisterSearchEvent extends OrderLoadCardRegisterEvent {
  final String search;
  OrderLoadCardRegisterSearchEvent({
    required this.search,
  });
}

class OrderClosureEvent extends OrderLoadCardRegisterEvent {}
