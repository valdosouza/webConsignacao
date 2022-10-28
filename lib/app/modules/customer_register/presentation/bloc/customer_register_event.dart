import 'package:appweb/app/modules/customer_register/data/model/consumer_main_model.dart';

abstract class CustomerRegisterEvent {}

class CustomerRegisterGetListEvent extends CustomerRegisterEvent {}

class CustomerRegisterSearchEvent extends CustomerRegisterEvent {
  String search;

  CustomerRegisterSearchEvent({required this.search});
}

class CustomerRegisterInfoEvent extends CustomerRegisterEvent {
  final CustomerMainModel? model;
  CustomerRegisterInfoEvent({this.model});
}
