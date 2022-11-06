import 'package:appweb/app/modules/product_register/data/model/product_register_main_model.dart';
import 'package:appweb/app/modules/product_register/data/model/product_register_model.dart';

abstract class ProductRegisterEvent {}

class ProductRegisterGetListEvent extends ProductRegisterEvent {}

class ProductRegisterSearchEvent extends ProductRegisterEvent {
  String search;

  ProductRegisterSearchEvent({
    required this.search,
  });
}

class ProductRegisterPutEvent extends ProductRegisterEvent {
  final ProductRegisterMainModel model;

  ProductRegisterPutEvent({required this.model});
}

class ProductRegisterPostEvent extends ProductRegisterEvent {
  final ProductRegisterMainModel model;

  ProductRegisterPostEvent({required this.model});
}

class ProductRegisterInfoEvent extends ProductRegisterEvent {
  final ProductRegisterModel? model;
  ProductRegisterInfoEvent({this.model});
}
