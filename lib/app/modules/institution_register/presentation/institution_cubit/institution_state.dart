import 'package:equatable/equatable.dart';

abstract class InstitutionState extends Equatable {
  const InstitutionState();
}

class InstitutionInitial extends InstitutionState {
  @override
  List<Object> get props => [];
}

class InstitutionLoadingState extends InstitutionState {
  @override
  List<Object> get props => [];
}

class InstitutionLoadedState extends InstitutionState {
  @override
  List<Object> get props => [];
}

class InstitutionSuccessState extends InstitutionState {
  @override
  List<Object> get props => [];
}

class InstitutionLogoutState extends InstitutionState {
  @override
  List<Object> get props => [];
}

class InstitutionErrorState extends InstitutionState {
  final String error;

  const InstitutionErrorState(this.error);

  @override
  List<Object> get props => [error];
}
