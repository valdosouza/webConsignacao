import 'package:appweb/app/modules/order_bonus_register/data/model/order_bonus_register_items_model.dart';
import 'package:appweb/app/modules/order_bonus_register/data/model/order_bonus_register_model.dart';
import 'package:appweb/app/modules/order_bonus_register/domain/entity/order_bonus_register_items_entity.dart';

abstract class OrderBonusRegisterEvent {}

class OrderBonusRegisterGetListEvent extends OrderBonusRegisterEvent {}

class OrderBonusRegisterGetStocksEvent extends OrderBonusRegisterEvent {
  OrderBonusRegisterGetStocksEvent();
}

class OrderBonusRegisterGetProductsEvent extends OrderBonusRegisterEvent {
  OrderBonusRegisterGetProductsEvent();
}

class OrderBonusRegisterSearchProductsEvent extends OrderBonusRegisterEvent {
  final String search;
  OrderBonusRegisterSearchProductsEvent({required this.search});
}

class OrderBonusRegisterGetEntityEvent extends OrderBonusRegisterEvent {
  OrderBonusRegisterGetEntityEvent();
}

class OrderBonusRegisterSearchEntityEvent extends OrderBonusRegisterEvent {
  final String search;
  OrderBonusRegisterSearchEntityEvent({required this.search});
}

class OrderBonusRegisterSearchStocksEvent extends OrderBonusRegisterEvent {
  final String search;
  OrderBonusRegisterSearchStocksEvent({required this.search});
}

class OrderBonusRegisterSearchEvent extends OrderBonusRegisterEvent {
  String search;
  OrderBonusRegisterSearchEvent({
    required this.search,
  });
}

class OrderBonusRegisterItemEvent extends OrderBonusRegisterEvent {
  OrderBonusRegisterItemsEntity? item;
  OrderBonusRegisterItemEvent({this.item});
}

class OrderBonusRegisterPutEvent extends OrderBonusRegisterEvent {
  final OrderBonusRegisterModel model;

  OrderBonusRegisterPutEvent({required this.model});
}

class OrderBonusRegisterPostEvent extends OrderBonusRegisterEvent {
  final OrderBonusRegisterModel model;

  OrderBonusRegisterPostEvent({required this.model});
}

class OrderBonusRegisterDeleteEvent extends OrderBonusRegisterEvent {
  final OrderBonusRegisterModel model;

  OrderBonusRegisterDeleteEvent({required this.model});
}

class OrderClosureEvent extends OrderBonusRegisterEvent {
  OrderClosureEvent();
}

class OrderReopenEvent extends OrderBonusRegisterEvent {
  OrderReopenEvent();
}

class OrderBonusRegisterDesktopEvent extends OrderBonusRegisterEvent {
  final OrderBonusRegisterModel? model;
  OrderBonusRegisterDesktopEvent({this.model});
}

class OrderBonusRegisterMobileEvent extends OrderBonusRegisterEvent {
  final OrderBonusRegisterModel? model;
  OrderBonusRegisterMobileEvent({this.model});
}

class OrderBonusRegisterReturnEvent extends OrderBonusRegisterEvent {
  final int tabIndex;
  final OrderBonusRegisterItemsModel? item;
  OrderBonusRegisterReturnEvent({this.tabIndex = 0, this.item});
}

class OrderBonusRegisterChangeDirectionEvent extends OrderBonusRegisterEvent {
  OrderBonusRegisterChangeDirectionEvent();
}
