import 'package:appweb/app/modules/line_business_register/data/model/linebusiness_model.dart';

abstract class LinebusinessRegisterState {
  List<LinebusinessModel> list;

  LinebusinessRegisterState({
    required this.list,
  });
}

class LinebusinessLoadingState extends LinebusinessRegisterState {
  LinebusinessLoadingState() : super(list: []);
}

class LinebusinessLoadedState extends LinebusinessRegisterState {
  LinebusinessLoadedState({required List<LinebusinessModel> list})
      : super(list: list);
}

class LinebusinessErrorState extends LinebusinessRegisterState {
  LinebusinessErrorState({required List<LinebusinessModel> list})
      : super(list: list);
}

class LinebusinessInfoPageState extends LinebusinessRegisterState {
  final LinebusinessModel? model;
  LinebusinessInfoPageState({required List<LinebusinessModel> list, this.model})
      : super(list: list);
}

class LinebusinessAddSuccessState extends LinebusinessRegisterState {
  LinebusinessAddSuccessState({required List<LinebusinessModel> list})
      : super(list: list);
}

class LinebusinessAddErrorState extends LinebusinessRegisterState {
  LinebusinessAddErrorState({required List<LinebusinessModel> list})
      : super(list: list);
}

class LinebusinessEditSuccessState extends LinebusinessRegisterState {
  LinebusinessEditSuccessState({required List<LinebusinessModel> list})
      : super(list: list);
}

class LinebusinessEditErrorState extends LinebusinessRegisterState {
  LinebusinessEditErrorState({required List<LinebusinessModel> list})
      : super(list: list);
}
