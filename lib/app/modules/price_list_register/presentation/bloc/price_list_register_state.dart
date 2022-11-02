import 'package:appweb/app/modules/price_list_register/data/model/price_list_register_model.dart';

abstract class PriceListRegisterState {
  List<PriceListRegisterModel> prices;

  PriceListRegisterState({
    required this.prices,
  });
}

class PriceListRegisterLoadingState extends PriceListRegisterState {
  PriceListRegisterLoadingState() : super(prices: []);
}

class PriceListRegisterLoadedState extends PriceListRegisterState {
  PriceListRegisterLoadedState({required List<PriceListRegisterModel> prices})
      : super(prices: prices);
}

class PriceListRegisterErrorState extends PriceListRegisterState {
  PriceListRegisterErrorState({required List<PriceListRegisterModel> prices})
      : super(prices: prices);
}
