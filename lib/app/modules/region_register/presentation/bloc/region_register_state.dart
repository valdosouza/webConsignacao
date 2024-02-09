import 'package:appweb/app/modules/Core/data/model/salesman_list_model.dart';
import 'package:appweb/app/modules/Core/data/model/region_model.dart';

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
  RegionRegisterLoadedState({required super.list});
}

class RegionRegisterErrorState extends RegionRegisterState {
  RegionRegisterErrorState({required super.list});
}

class RegionRegisterInfoPageState extends RegionRegisterState {
  final RegionRegisterModel? model;
  RegionRegisterInfoPageState({required super.list, this.model});
}

class RegionRegisterAddSuccessState extends RegionRegisterState {
  RegionRegisterAddSuccessState({required super.list});
}

class RegionRegisterAddErrorState extends RegionRegisterState {
  RegionRegisterAddErrorState({required super.list});
}

class RegionRegisterEditSuccessState extends RegionRegisterState {
  RegionRegisterEditSuccessState({required super.list});
}

class RegionRegisterEditErrorState extends RegionRegisterState {
  RegionRegisterEditErrorState({required super.list});
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
