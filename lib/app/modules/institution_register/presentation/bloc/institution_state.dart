import 'package:equatable/equatable.dart';

abstract class InstitutionState extends Equatable {
  const InstitutionState();
}

class InstitutionInitialState extends InstitutionState {
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

class InstitutionPostSuccessState extends InstitutionState {
  @override
  List<Object> get props => [];
}

class InstitutionPutSuccessState extends InstitutionState {
  @override
  List<Object> get props => [];
}

class InstitutionGetErrorState extends InstitutionState {
  final String error;

  const InstitutionGetErrorState(this.error);

  @override
  List<Object> get props => [error];
}

class InstitutionPostErrorState extends InstitutionState {
  final String error;

  const InstitutionPostErrorState(this.error);

  @override
  List<Object> get props => [error];
}

class InstitutionPutErrorState extends InstitutionState {
  final String error;

  const InstitutionPutErrorState(this.error);

  @override
  List<Object> get props => [error];
}

class InstitutionDeleteErrorState extends InstitutionState {
  final String error;

  const InstitutionDeleteErrorState(this.error);

  @override
  List<Object> get props => [error];
}

class InstitutionCepErrorState extends InstitutionState {
  final String error;

  const InstitutionCepErrorState(this.error);

  @override
  List<Object> get props => [error];
}

class InstitutionCnpjErrorState extends InstitutionState {
  final String error;

  const InstitutionCnpjErrorState(this.error);

  @override
  List<Object> get props => [error];
}
