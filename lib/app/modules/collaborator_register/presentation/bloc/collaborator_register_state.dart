import 'package:appweb/app/modules/Core/data/model/city_model.dart';
import 'package:appweb/app/modules/Core/data/model/collaborator_list_model.dart';
import 'package:appweb/app/modules/Core/data/model/state_model.dart';
import 'package:appweb/app/modules/collaborator_register/data/model/collaborator_main_model.dart';
import 'package:appweb/app/modules/line_business_register/data/model/linebusiness_model.dart';

abstract class CollaboratorRegisterState {
  List<CollaboratorListModel> modelList;

  CollaboratorRegisterState({
    required this.modelList,
  });
}

class CollaboratorRegisterReturnedState extends CollaboratorRegisterState {
  CollaboratorRegisterReturnedState(
      {required List<CollaboratorListModel> modelList})
      : super(modelList: modelList);
}

class CollaboratorRegisterLoadingState extends CollaboratorRegisterState {
  CollaboratorRegisterLoadingState() : super(modelList: []);
}

class CollaboratorRegisterLoadedState extends CollaboratorRegisterState {
  CollaboratorRegisterLoadedState({
    required List<CollaboratorListModel> modelList,
  }) : super(modelList: modelList);
}

class CollaboratorRegisterErrorState extends CollaboratorRegisterState {
  CollaboratorRegisterErrorState({
    required List<CollaboratorListModel> modelList,
  }) : super(modelList: modelList);
}

class CollaboratorRegisterGetErrorState extends CollaboratorRegisterState {
  CollaboratorRegisterGetErrorState({
    required List<CollaboratorListModel> modelList,
  }) : super(modelList: modelList);
}

class CollaboratorRegisterInfoPageState extends CollaboratorRegisterState {
  final CollaboratorMainModel model;
  final int tabIndex;
  CollaboratorRegisterInfoPageState({
    required List<CollaboratorListModel> modelList,
    required this.model,
    required this.tabIndex,
  }) : super(modelList: modelList);
}

class CollaboratorRegisterCepErrorState extends CollaboratorRegisterState {
  final String error;

  CollaboratorRegisterCepErrorState(
      List<CollaboratorListModel> modelList, this.error)
      : super(modelList: modelList);
}

class CollaboratorRegisterCnpjErrorState extends CollaboratorRegisterState {
  final String error;

  CollaboratorRegisterCnpjErrorState(
      List<CollaboratorListModel> modelList, this.error)
      : super(modelList: modelList);
}

class CollaboratorRegisterGetStatesSuccessState
    extends CollaboratorRegisterState {
  final List<StateModel> states;

  CollaboratorRegisterGetStatesSuccessState(
      {required List<CollaboratorListModel> modelList, required this.states})
      : super(modelList: modelList);
}

class CollaboratorRegisterGetStatesErrorState
    extends CollaboratorRegisterState {
  final String error;

  CollaboratorRegisterGetStatesErrorState(
      List<CollaboratorListModel> modelList, this.error)
      : super(modelList: modelList);
}

class CollaboratorRegisterGetCitySuccessState
    extends CollaboratorRegisterState {
  final List<CityModel> cities;

  CollaboratorRegisterGetCitySuccessState(
      {required List<CollaboratorListModel> modelList, required this.cities})
      : super(modelList: modelList);
}

class CollaboratorRegisterGetCityErrorState extends CollaboratorRegisterState {
  final String error;

  CollaboratorRegisterGetCityErrorState(
      List<CollaboratorListModel> modelList, this.error)
      : super(modelList: modelList);
}

class CollaboratorRegisterPostAddSuccessState
    extends CollaboratorRegisterState {
  CollaboratorRegisterPostAddSuccessState(List<CollaboratorListModel> modelList)
      : super(modelList: modelList);
}

class CollaboratorRegisterPostEditSuccessState
    extends CollaboratorRegisterState {
  CollaboratorRegisterPostEditSuccessState(
      List<CollaboratorListModel> modelList)
      : super(modelList: modelList);
}

class CollaboratorRegisterPostAddErrorState extends CollaboratorRegisterState {
  final String error;

  CollaboratorRegisterPostAddErrorState(
      List<CollaboratorListModel> modelList, this.error)
      : super(modelList: modelList);
}

class CollaboratorRegisterPostEditErrorState extends CollaboratorRegisterState {
  final String error;

  CollaboratorRegisterPostEditErrorState(
      List<CollaboratorListModel> modelList, this.error)
      : super(modelList: modelList);
}

class CollaboratorRegisterGetLinebusinessSuccessState
    extends CollaboratorRegisterState {
  final List<LinebusinessModel> linebusiness;

  CollaboratorRegisterGetLinebusinessSuccessState(
      {required List<CollaboratorListModel> modellist,
      required this.linebusiness})
      : super(modelList: modellist);
}

class CollaboratorRegisterGetLinebusinessErrorState
    extends CollaboratorRegisterState {
  CollaboratorRegisterGetLinebusinessErrorState(
      {required List<CollaboratorListModel> modelList})
      : super(modelList: modelList);
}
