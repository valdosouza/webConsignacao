import 'package:appweb/app/modules/product_register/data/model/product_register_model.dart';

abstract class ProductRegisterState {
  List<ProductRegisterModel> list;

  ProductRegisterState({
    required this.list,
  });
}

class ProductRegisterLoadingState extends ProductRegisterState {
  ProductRegisterLoadingState() : super(list: []);
}

class ProductRegisterLoadedState extends ProductRegisterState {
  ProductRegisterLoadedState({required List<ProductRegisterModel> list})
      : super(list: list);
}

class ProductRegisterErrorState extends ProductRegisterState {
  ProductRegisterErrorState({required List<ProductRegisterModel> list})
      : super(list: list);
}

class ProductRegisterInfoPageState extends ProductRegisterState {
  final ProductRegisterModel? model;
  ProductRegisterInfoPageState(
      {required List<ProductRegisterModel> list, this.model})
      : super(list: list);
}

class ProductRegisterPostSuccessState extends ProductRegisterState {
  ProductRegisterPostSuccessState({required List<ProductRegisterModel> list})
      : super(list: list);
}

class ProductRegisterPostErrorState extends ProductRegisterState {
  ProductRegisterPostErrorState({required List<ProductRegisterModel> list})
      : super(list: list);
}

class ProductRegisterPutSuccessState extends ProductRegisterState {
  ProductRegisterPutSuccessState({required List<ProductRegisterModel> list})
      : super(list: list);
}

class ProductRegisterPutErrorState extends ProductRegisterState {
  ProductRegisterPutErrorState({required List<ProductRegisterModel> list})
      : super(list: list);
}
