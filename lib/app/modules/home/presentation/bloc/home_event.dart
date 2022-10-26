abstract class HomeEvent {}

class HomeGetFinancialEvent extends HomeEvent {
  final String initialDate;
  final String finalDate;
  final String terminal;

  HomeGetFinancialEvent({
    required this.initialDate,
    required this.finalDate,
    required this.terminal,
  });
}

class HomeLogoutEvent extends HomeEvent {}
