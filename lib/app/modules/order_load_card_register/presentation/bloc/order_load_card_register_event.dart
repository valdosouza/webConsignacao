abstract class OrderLoadCardRegisterEvent {}

class OrderLoadCardRegisterGetCardEvent extends OrderLoadCardRegisterEvent {
  final int tbSalesmanId;

  OrderLoadCardRegisterGetCardEvent({required this.tbSalesmanId});
}

class OrderLoadCardRegisterGetListCardEvent extends OrderLoadCardRegisterEvent {
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
