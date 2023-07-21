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
  PriceListRegisterLoadedState({required List<PriceListModel> list})
      : super(list: list);
}

class PriceListRegisterErrorState extends PriceListRegisterState {
  PriceListRegisterErrorState({required List<PriceListModel> list})
      : super(list: list);
}

class PriceListRegisterInfoPageState extends PriceListRegisterState {
  final PriceListModel? model;
  PriceListRegisterInfoPageState(
      {required List<PriceListModel> list, this.model})
      : super(list: list);
}

class PriceListRegisterAddSuccessState extends PriceListRegisterState {
  PriceListRegisterAddSuccessState({required List<PriceListModel> list})
      : super(list: list);
}

class PriceListRegisterAddErrorState extends PriceListRegisterState {
  PriceListRegisterAddErrorState({required List<PriceListModel> list})
      : super(list: list);
}

class PriceListRegisterEditSuccessState extends PriceListRegisterState {
  PriceListRegisterEditSuccessState({required List<PriceListModel> list})
      : super(list: list);
}

class PriceListRegisterEditErrorState extends PriceListRegisterState {
  PriceListRegisterEditErrorState({required List<PriceListModel> list})
      : super(list: list);
}
