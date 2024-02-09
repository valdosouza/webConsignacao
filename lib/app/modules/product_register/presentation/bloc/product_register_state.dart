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
  ProductRegisterLoadedState({required super.list});
}

class ProductRegisterErrorState extends ProductRegisterState {
  ProductRegisterErrorState({required super.list});
}

class ProductRegisterInfoPageState extends ProductRegisterState {
  ProductRegisterInfoPageState({required super.list});
}

class ProductRegisterGetErrorState extends ProductRegisterState {
  ProductRegisterGetErrorState({required super.list});
}

class ProductRegisterPostSuccessState extends ProductRegisterState {
  ProductRegisterPostSuccessState({required super.list});
}

class ProductRegisterPostErrorState extends ProductRegisterState {
  ProductRegisterPostErrorState({required super.list});
}

class ProductRegisterPutSuccessState extends ProductRegisterState {
  ProductRegisterPutSuccessState({required super.list});
}

class ProductRegisterPutErrorState extends ProductRegisterState {
  ProductRegisterPutErrorState({required super.list});
}
