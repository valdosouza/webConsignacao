import 'package:appweb/app/modules/Core/data/model/city_model.dart';
import 'package:appweb/app/modules/Core/data/model/collaborator_list_model.dart';
import 'package:appweb/app/modules/Core/data/model/state_model.dart';
import 'package:appweb/app/modules/line_business_register/data/model/linebusiness_model.dart';

abstract class CollaboratorRegisterState {
  List<CollaboratorListModel> modelList;
  final int tabIndex;
  CollaboratorRegisterState({
    required this.modelList,
    required this.tabIndex,
  });
}

class CollaboratorRegisterReturnedState extends CollaboratorRegisterState {
  CollaboratorRegisterReturnedState({
    required List<CollaboratorListModel> modelList,
    required int tabIndex,
  }) : super(
          modelList: modelList,
          tabIndex: tabIndex,
        );
}

class CollaboratorRegisterLoadingState extends CollaboratorRegisterState {
  CollaboratorRegisterLoadingState({
    required int tabIndex,
  }) : super(
          modelList: [],
          tabIndex: tabIndex,
        );
}

class CollaboratorRegisterLoadedState extends CollaboratorRegisterState {
  CollaboratorRegisterLoadedState({
    required List<CollaboratorListModel> modelList,
    required int tabIndex,
  }) : super(
          modelList: modelList,
          tabIndex: tabIndex,
        );
}

class CollaboratorRegisterErrorState extends CollaboratorRegisterState {
  CollaboratorRegisterErrorState({
    required List<CollaboratorListModel> modelList,
    required int tabIndex,
  }) : super(
          modelList: modelList,
          tabIndex: tabIndex,
        );
}

class CollaboratorRegisterGetErrorState extends CollaboratorRegisterState {
  CollaboratorRegisterGetErrorState({
    required List<CollaboratorListModel> modelList,
    required int tabIndex,
  }) : super(
          modelList: modelList,
          tabIndex: tabIndex,
        );
}

class CollaboratorRegisterInfoPageState extends CollaboratorRegisterState {
  CollaboratorRegisterInfoPageState({
    required List<CollaboratorListModel> modelList,
    required int tabIndex,
  }) : super(
          modelList: modelList,
          tabIndex: tabIndex,
        );
}

class CollaboratorRegisterCepErrorState extends CollaboratorRegisterState {
  final String error;

  CollaboratorRegisterCepErrorState({
    required this.error,
    required int tabIndex,
    required List<CollaboratorListModel> modelList,
  }) : super(
          modelList: modelList,
          tabIndex: tabIndex,
        );
}

class CollaboratorRegisterCnpjErrorState extends CollaboratorRegisterState {
  final String error;
  CollaboratorRegisterCnpjErrorState({
    required this.error,
    required int tabIndex,
    required List<CollaboratorListModel> modelList,
  }) : super(
          modelList: modelList,
          tabIndex: tabIndex,
        );
}

class CollaboratorRegisterGetStatesSuccessState
    extends CollaboratorRegisterState {
  final List<StateModel> states;

  CollaboratorRegisterGetStatesSuccessState({
    required List<CollaboratorListModel> modelList,
    required int tabIndex,
    required this.states,
  }) : super(
          modelList: modelList,
          tabIndex: tabIndex,
        );
}

class CollaboratorRegisterGetStatesErrorState
    extends CollaboratorRegisterState {
  final String error;

  CollaboratorRegisterGetStatesErrorState({
    required List<CollaboratorListModel> modelList,
    required int tabIndex,
    required this.error,
  }) : super(modelList: modelList, tabIndex: tabIndex);
}

class CollaboratorRegisterGetCitySuccessState
    extends CollaboratorRegisterState {
  final List<CityModel> cities;

  CollaboratorRegisterGetCitySuccessState({
    required List<CollaboratorListModel> modelList,
    required this.cities,
    required int tabIndex,
  }) : super(modelList: modelList, tabIndex: tabIndex);
}

class CollaboratorRegisterGetCityErrorState extends CollaboratorRegisterState {
  final String error;

  CollaboratorRegisterGetCityErrorState({
    required List<CollaboratorListModel> modelList,
    required this.error,
    required int tabIndex,
  }) : super(modelList: modelList, tabIndex: tabIndex);
}

class CollaboratorRegisterPostSuccessState extends CollaboratorRegisterState {
  CollaboratorRegisterPostSuccessState({
    required List<CollaboratorListModel> modelList,
    required int tabIndex,
  }) : super(
          modelList: modelList,
          tabIndex: tabIndex,
        );
}

class CollaboratorRegisterPostErrorState extends CollaboratorRegisterState {
  final String error;

  CollaboratorRegisterPostErrorState({
    required List<CollaboratorListModel> modelList,
    required this.error,
    required int tabIndex,
  }) : super(
          modelList: modelList,
          tabIndex: tabIndex,
        );
}

class CollaboratorRegisterGetLinebusinessSuccessState
    extends CollaboratorRegisterState {
  final List<LinebusinessModel> linebusiness;

  CollaboratorRegisterGetLinebusinessSuccessState({
    required List<CollaboratorListModel> modellist,
    required this.linebusiness,
    required int tabIndex,
  }) : super(
          modelList: modellist,
          tabIndex: tabIndex,
        );
}

class CollaboratorRegisterGetLinebusinessErrorState
    extends CollaboratorRegisterState {
  CollaboratorRegisterGetLinebusinessErrorState({
    required List<CollaboratorListModel> modelList,
    required int tabIndex,
  }) : super(modelList: modelList, tabIndex: tabIndex);
}
