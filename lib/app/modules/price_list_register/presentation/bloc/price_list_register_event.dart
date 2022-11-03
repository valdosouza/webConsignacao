import 'package:appweb/app/modules/price_list_register/data/model/price_list_register_model.dart';

abstract class PriceListRegisterEvent {}

class PriceListRegisterGetListEvent extends PriceListRegisterEvent {}

class PriceListRegisterSearchEvent extends PriceListRegisterEvent {
  String search;

  PriceListRegisterSearchEvent({
    required this.search,
  });
}

class PriceListRegisterEditEvent extends PriceListRegisterEvent {
  final PriceListRegisterModel model;

  PriceListRegisterEditEvent({required this.model});
}

class PriceListRegisterAddEvent extends PriceListRegisterEvent {
  final PriceListRegisterModel price;

  PriceListRegisterAddEvent({required this.price});
}

class PriceListRegisterInfoEvent extends PriceListRegisterEvent {
  final PriceListRegisterModel? model;
  PriceListRegisterInfoEvent({this.model});
}
