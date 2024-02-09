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
    required super.modelList,
    required super.tabIndex,
  });
}

class CollaboratorRegisterLoadingState extends CollaboratorRegisterState {
  CollaboratorRegisterLoadingState({
    required super.tabIndex,
  }) : super(
          modelList: [],
        );
}

class CollaboratorRegisterLoadedState extends CollaboratorRegisterState {
  CollaboratorRegisterLoadedState({
    required super.modelList,
    required super.tabIndex,
  });
}

class CollaboratorRegisterErrorState extends CollaboratorRegisterState {
  CollaboratorRegisterErrorState({
    required super.modelList,
    required super.tabIndex,
  });
}

class CollaboratorRegisterGetErrorState extends CollaboratorRegisterState {
  CollaboratorRegisterGetErrorState({
    required super.modelList,
    required super.tabIndex,
  });
}

class CollaboratorRegisterInfoPageState extends CollaboratorRegisterState {
  CollaboratorRegisterInfoPageState({
    required super.modelList,
    required super.tabIndex,
  });
}

class CollaboratorRegisterCepErrorState extends CollaboratorRegisterState {
  final String error;

  CollaboratorRegisterCepErrorState({
    required this.error,
    required super.tabIndex,
    required super.modelList,
  });
}

class CollaboratorRegisterCnpjErrorState extends CollaboratorRegisterState {
  final String error;
  CollaboratorRegisterCnpjErrorState({
    required this.error,
    required super.tabIndex,
    required super.modelList,
  });
}

class CollaboratorRegisterGetStatesSuccessState
    extends CollaboratorRegisterState {
  final List<StateModel> states;

  CollaboratorRegisterGetStatesSuccessState({
    required super.modelList,
    required super.tabIndex,
    required this.states,
  });
}

class CollaboratorRegisterGetStatesErrorState
    extends CollaboratorRegisterState {
  final String error;

  CollaboratorRegisterGetStatesErrorState({
    required super.modelList,
    required super.tabIndex,
    required this.error,
  });
}

class CollaboratorRegisterGetCitySuccessState
    extends CollaboratorRegisterState {
  final List<CityModel> cities;

  CollaboratorRegisterGetCitySuccessState({
    required super.modelList,
    required this.cities,
    required super.tabIndex,
  });
}

class CollaboratorRegisterGetCityErrorState extends CollaboratorRegisterState {
  final String error;

  CollaboratorRegisterGetCityErrorState({
    required super.modelList,
    required this.error,
    required super.tabIndex,
  });
}

class CollaboratorRegisterPostSuccessState extends CollaboratorRegisterState {
  CollaboratorRegisterPostSuccessState({
    required super.modelList,
    required super.tabIndex,
  });
}

class CollaboratorRegisterPostErrorState extends CollaboratorRegisterState {
  final String error;

  CollaboratorRegisterPostErrorState({
    required super.modelList,
    required this.error,
    required super.tabIndex,
  });
}

class CollaboratorRegisterGetLinebusinessSuccessState
    extends CollaboratorRegisterState {
  final List<LinebusinessModel> linebusiness;

  CollaboratorRegisterGetLinebusinessSuccessState({
    required List<CollaboratorListModel> modellist,
    required this.linebusiness,
    required super.tabIndex,
  }) : super(
          modelList: modellist,
        );
}

class CollaboratorRegisterGetLinebusinessErrorState
    extends CollaboratorRegisterState {
  CollaboratorRegisterGetLinebusinessErrorState({
    required super.modelList,
    required super.tabIndex,
  });
}
