import 'package:equatable/equatable.dart';

abstract class StockListRegisterSate extends Equatable {
  const StockListRegisterSate();
}

class StockListRegisterInitial extends StockListRegisterSate {
  @override
  List<Object> get props => [];
}

class StockListRegisterLoadingState extends StockListRegisterSate {
  @override
  List<Object> get props => [];
}

class StockListRegisterLoadedState extends StockListRegisterSate {
  @override
  List<Object> get props => [];
}

class StockListRegisterSuccessState extends StockListRegisterSate {
  @override
  List<Object> get props => [];
}

class StockListRegisterLogoutState extends StockListRegisterSate {
  @override
  List<Object> get props => [];
}

class StockListRegisterErrorState extends StockListRegisterSate {
  final String error;

  const StockListRegisterErrorState(this.error);

  @override
  List<Object> get props => [error];
}
