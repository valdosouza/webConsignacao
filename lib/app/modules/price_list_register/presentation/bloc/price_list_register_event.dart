import 'package:appweb/app/modules/price_list_register/data/model/price_list_model.dart';

abstract class PriceListRegisterEvent {}

class PriceListRegisterGetListEvent extends PriceListRegisterEvent {}

class PriceListRegisterSearchEvent extends PriceListRegisterEvent {
  String search;

  PriceListRegisterSearchEvent({
    required this.search,
  });
}

class PriceListRegisterPutEvent extends PriceListRegisterEvent {
  final PriceListModel model;

  PriceListRegisterPutEvent({required this.model});
}

class PriceListRegisterPostEvent extends PriceListRegisterEvent {
  final PriceListModel model;

  PriceListRegisterPostEvent({required this.model});
}

class PriceListRegisterInfoEvent extends PriceListRegisterEvent {
  final PriceListModel? model;
  PriceListRegisterInfoEvent({this.model});
}
