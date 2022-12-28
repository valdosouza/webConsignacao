abstract class ProductEvent {}

class ProductPriceListMobileEvent extends ProductEvent {
  final int id;
  ProductPriceListMobileEvent({required this.id});
}

class ProductSearchPriceListMobileEvent extends ProductEvent {
  final String search;
  ProductSearchPriceListMobileEvent({required this.search});
}
