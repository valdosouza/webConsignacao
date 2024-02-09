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
  LinebusinessLoadedState({required super.list});
}

class LinebusinessErrorState extends LinebusinessRegisterState {
  LinebusinessErrorState({required super.list});
}

class LinebusinessInfoPageState extends LinebusinessRegisterState {
  final LinebusinessModel? model;
  LinebusinessInfoPageState({required super.list, this.model});
}

class LinebusinessAddSuccessState extends LinebusinessRegisterState {
  LinebusinessAddSuccessState({required super.list});
}

class LinebusinessAddErrorState extends LinebusinessRegisterState {
  LinebusinessAddErrorState({required super.list});
}

class LinebusinessEditSuccessState extends LinebusinessRegisterState {
  LinebusinessEditSuccessState({required super.list});
}

class LinebusinessEditErrorState extends LinebusinessRegisterState {
  LinebusinessEditErrorState({required super.list});
}
