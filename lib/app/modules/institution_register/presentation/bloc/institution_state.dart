import 'package:appweb/app/modules/Core/data/model/city_model.dart';
import 'package:appweb/app/modules/Core/data/model/state_model.dart';

abstract class InstitutionState {
  const InstitutionState();
}

class InstitutionInitialState extends InstitutionState {}

class InstitutionLoadingState extends InstitutionState {}

class InstitutionLoadedState extends InstitutionState {}

class InstitutionPostSuccessState extends InstitutionState {}

class InstitutionPutSuccessState extends InstitutionState {}

class InstitutionReturnedState extends InstitutionState {}

class InstitutionGetErrorState extends InstitutionState {
  final String error;

  const InstitutionGetErrorState(this.error);
}

class InstitutionPostErrorState extends InstitutionState {
  final String error;

  const InstitutionPostErrorState(this.error);
}

class InstitutionPutErrorState extends InstitutionState {
  final String error;

  const InstitutionPutErrorState(this.error);
}

class InstitutionDeleteErrorState extends InstitutionState {
  final String error;

  const InstitutionDeleteErrorState(this.error);
}

class InstitutionCepErrorState extends InstitutionState {
  final String error;

  const InstitutionCepErrorState(this.error);
}

class InstitutionCnpjErrorState extends InstitutionState {
  final String error;

  const InstitutionCnpjErrorState(this.error);
}

class InstitutionGetStatesSuccessState extends InstitutionState {
  final List<StateModel> states;

  const InstitutionGetStatesSuccessState({required this.states});
}

class InstitutionGetStatesErrorState extends InstitutionState {
  final String error;

  const InstitutionGetStatesErrorState(this.error);
}

class InstitutionGetCitySuccessState extends InstitutionState {
  final List<CityModel> cities;

  const InstitutionGetCitySuccessState({required this.cities});
}

class InstitutionGetCityErrorState extends InstitutionState {
  final String error;

  const InstitutionGetCityErrorState(this.error);
}
