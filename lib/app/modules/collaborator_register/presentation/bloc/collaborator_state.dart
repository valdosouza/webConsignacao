import 'package:appweb/app/modules/collaborator_register/data/model/city_model.dart';
import 'package:appweb/app/modules/collaborator_register/data/model/state_model.dart';
import 'package:appweb/app/modules/line_business_register/data/model/line_business_model.dart';

abstract class CollaboratorState {
  const CollaboratorState();
}

class CollaboratorInitialState extends CollaboratorState {}

class CollaboratorLoadingState extends CollaboratorState {}

class CollaboratorLoadedState extends CollaboratorState {}

class CollaboratorPostSuccessState extends CollaboratorState {}

class CollaboratorPutSuccessState extends CollaboratorState {}

class CollaboratorDeleteSuccesseState extends CollaboratorState {}

class CollaboratorGetSuccesseState extends CollaboratorState {}

class CollaboratorGetCitySuccessState extends CollaboratorState {
  final List<CityModel> citys;

  const CollaboratorGetCitySuccessState({required this.citys});
}

class CollaboratorReturnedState extends CollaboratorState {
  final int returnTo;
  const CollaboratorReturnedState({required this.returnTo});
}

class CollaboratorGetStatesSuccessState extends CollaboratorState {
  final List<StateModel> states;

  const CollaboratorGetStatesSuccessState({required this.states});
}

class CollaboratorGetLineBusinessSuccessState extends CollaboratorState {
  final List<LineBusinessModel> lineBusiness;

  const CollaboratorGetLineBusinessSuccessState({required this.lineBusiness});
}

class CollaboratorPostErrorState extends CollaboratorState {
  final String error;

  const CollaboratorPostErrorState(this.error);
}

class CollaboratorPutErrorState extends CollaboratorState {
  final String error;

  const CollaboratorPutErrorState(this.error);
}

class CollaboratorDeleteErrorState extends CollaboratorState {
  final String error;

  const CollaboratorDeleteErrorState(this.error);
}

class CollaboratorCepErrorState extends CollaboratorState {
  final String error;

  const CollaboratorCepErrorState(this.error);
}

class CollaboratorGetStatesErrorState extends CollaboratorState {
  final String error;

  const CollaboratorGetStatesErrorState(this.error);
}

class CollaboratorGetCityErrorState extends CollaboratorState {
  final String error;

  const CollaboratorGetCityErrorState(this.error);
}

class CollaboratorGetLineBusinessErrorState extends CollaboratorState {
  final String error;

  const CollaboratorGetLineBusinessErrorState(this.error);
}

class CollaboratorGetErrorState extends CollaboratorState {
  final String error;

  const CollaboratorGetErrorState(this.error);
}
