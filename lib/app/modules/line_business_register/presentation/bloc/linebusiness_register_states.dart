import 'package:appweb/app/modules/line_business_register/data/model/linebusiness_model.dart';

abstract class LinebusinessRegisterState {
  List<LinebusinessModel> list;

  LinebusinessRegisterState({
    required this.list,
  });
}

class LinebusinessRegisterLoadingState extends LinebusinessRegisterState {
  LinebusinessRegisterLoadingState() : super(list: []);
}

class LinebusinessRegisterLoadedState extends LinebusinessRegisterState {
  LinebusinessRegisterLoadedState({required List<LinebusinessModel> list})
      : super(list: list);
}

class LinebusinessRegisterErrorState extends LinebusinessRegisterState {
  LinebusinessRegisterErrorState({required List<LinebusinessModel> list})
      : super(list: list);
}

class LinebusinessRegisterInfoPageState extends LinebusinessRegisterState {
  final LinebusinessModel? model;
  LinebusinessRegisterInfoPageState(
      {required List<LinebusinessModel> list, this.model})
      : super(list: list);
}

class LinebusinessRegisterAddSuccessState extends LinebusinessRegisterState {
  LinebusinessRegisterAddSuccessState({required List<LinebusinessModel> list})
      : super(list: list);
}

class LinebusinessRegisterAddErrorState extends LinebusinessRegisterState {
  LinebusinessRegisterAddErrorState({required List<LinebusinessModel> list})
      : super(list: list);
}

class LinebusinessRegisterEditSuccessState extends LinebusinessRegisterState {
  LinebusinessRegisterEditSuccessState({required List<LinebusinessModel> list})
      : super(list: list);
}

class LinebusinessRegisterEditErrorState extends LinebusinessRegisterState {
  LinebusinessRegisterEditErrorState({required List<LinebusinessModel> list})
      : super(list: list);
}
