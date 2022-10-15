import 'package:equatable/equatable.dart';

abstract class StockListState extends Equatable {
  const StockListState();
}

class StockListInitial extends StockListState {
  @override
  List<Object> get props => [];
}

class StockListLoadingState extends StockListState {
  @override
  List<Object> get props => [];
}

class StockListLoaded extends StockListState {
  @override
  List<Object> get props => [];
}

class StockListErrorState extends StockListState {
  final String error;

  const StockListErrorState(this.error);

  @override
  List<Object> get props => [error];
}
