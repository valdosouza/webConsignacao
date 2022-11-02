abstract class PriceListRegisterEvent {}

class PriceListRegisterGetListEvent extends PriceListRegisterEvent {}

class PriceListRegisterSearchEvent extends PriceListRegisterEvent {
  String search;

  PriceListRegisterSearchEvent({
    required this.search,
  });
}
