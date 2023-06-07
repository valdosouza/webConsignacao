import 'package:appweb/app/modules/Core/data/model/salesman_list_model.dart';
import 'package:appweb/app/modules/region_register/data/model/region_model.dart';

abstract class RegionRegisterState {
  List<RegionRegisterModel> list;

  RegionRegisterState({
    required this.list,
  });
}

class RegionRegisterLoadingState extends RegionRegisterState {
  RegionRegisterLoadingState() : super(list: []);
}

class RegionRegisterLoadedState extends RegionRegisterState {
  RegionRegisterLoadedState({required List<RegionRegisterModel> list})
      : super(list: list);
}

class RegionRegisterErrorState extends RegionRegisterState {
  RegionRegisterErrorState({required List<RegionRegisterModel> list})
      : super(list: list);
}

class RegionRegisterInfoPageState extends RegionRegisterState {
  final RegionRegisterModel? model;
  RegionRegisterInfoPageState(
      {required List<RegionRegisterModel> list, this.model})
      : super(list: list);
}

class RegionRegisterAddSuccessState extends RegionRegisterState {
  RegionRegisterAddSuccessState({required List<RegionRegisterModel> list})
      : super(list: list);
}

class RegionRegisterAddErrorState extends RegionRegisterState {
  RegionRegisterAddErrorState({required List<RegionRegisterModel> list})
      : super(list: list);
}

class RegionRegisterEditSuccessState extends RegionRegisterState {
  RegionRegisterEditSuccessState({required List<RegionRegisterModel> list})
      : super(list: list);
}

class RegionRegisterEditErrorState extends RegionRegisterState {
  RegionRegisterEditErrorState({required List<RegionRegisterModel> list})
      : super(list: list);
}

/*------------------------Getlist - Salesman----------------------------------*/
class RegionRegisterGetSalesmanSuccessState extends RegionRegisterState {
  final List<SalesmanListModel> salesmans;

  RegionRegisterGetSalesmanSuccessState(
      List<RegionRegisterModel> list, this.salesmans)
      : super(list: list);
}

class RegionRegisterGetSalesmanErrorState extends RegionRegisterState {
  RegionRegisterGetSalesmanErrorState(List<RegionRegisterModel> list)
      : super(list: list);
}
