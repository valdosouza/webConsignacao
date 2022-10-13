import 'package:equatable/equatable.dart';

abstract class StockState extends Equatable {
  const StockState();
}

class StockInitial extends StockState {
  @override
  List<Object> get props => [];
}

class StockLoadingState extends StockState {
  @override
  List<Object> get props => [];
}

class StockLoadedState extends StockState {
  @override
  List<Object> get props => [];
}

class StockSuccessState extends StockState {
  @override
  List<Object> get props => [];
}

class StockLogoutState extends StockState {
  @override
  List<Object> get props => [];
}

class StockErrorState extends StockState {
  final String error;

  const StockErrorState(this.error);

  @override
  List<Object> get props => [error];
}
