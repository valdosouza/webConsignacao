abstract class StockState {}

class InitState extends StockState {}

class LoadingState extends StockState {}

class ValidateOrderLoadState extends StockState {
  final String msg;

  ValidateOrderLoadState({required this.msg});
}
