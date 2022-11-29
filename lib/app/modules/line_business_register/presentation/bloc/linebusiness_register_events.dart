import 'package:appweb/app/modules/line_business_register/data/model/linebusiness_model.dart';

abstract class LinebusinessRegisterEvent {}

class LinebusinessRegisterGetListEvent extends LinebusinessRegisterEvent {}

class LinebusinessRegisterSearchEvent extends LinebusinessRegisterEvent {
  String search;

  LinebusinessRegisterSearchEvent({
    required this.search,
  });
}

class LinebusinessRegisterPutEvent extends LinebusinessRegisterEvent {
  final LinebusinessModel model;

  LinebusinessRegisterPutEvent({required this.model});
}

class LinebusinessRegisterPostEvent extends LinebusinessRegisterEvent {
  final LinebusinessModel model;

  LinebusinessRegisterPostEvent({required this.model});
}

class LinebusinessRegisterInfoEvent extends LinebusinessRegisterEvent {
  final LinebusinessModel? model;
  LinebusinessRegisterInfoEvent({this.model});
}
