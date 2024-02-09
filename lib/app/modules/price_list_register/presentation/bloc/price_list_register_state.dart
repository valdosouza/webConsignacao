import 'package:appweb/app/modules/price_list_register/data/model/price_list_model.dart';

abstract class PriceListRegisterState {
  List<PriceListModel> list;

  PriceListRegisterState({
    required this.list,
  });
}

class PriceListRegisterLoadingState extends PriceListRegisterState {
  PriceListRegisterLoadingState() : super(list: []);
}

class PriceListRegisterLoadedState extends PriceListRegisterState {
  PriceListRegisterLoadedState({required super.list});
}

class PriceListRegisterErrorState extends PriceListRegisterState {
  PriceListRegisterErrorState({required super.list});
}

class PriceListRegisterInfoPageState extends PriceListRegisterState {
  final PriceListModel? model;
  PriceListRegisterInfoPageState({required super.list, this.model});
}

class PriceListRegisterAddSuccessState extends PriceListRegisterState {
  PriceListRegisterAddSuccessState({required super.list});
}

class PriceListRegisterAddErrorState extends PriceListRegisterState {
  PriceListRegisterAddErrorState({required super.list});
}

class PriceListRegisterEditSuccessState extends PriceListRegisterState {
  PriceListRegisterEditSuccessState({required super.list});
}

class PriceListRegisterEditErrorState extends PriceListRegisterState {
  PriceListRegisterEditErrorState({required super.list});
}
