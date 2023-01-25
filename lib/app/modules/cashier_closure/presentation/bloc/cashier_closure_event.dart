abstract class CashierClosureEvent {}

class CashierClosureGetClosureOnSearchEvent extends CashierClosureEvent {
  final String value;
  CashierClosureGetClosureOnSearchEvent({required this.value});
}

class CashierClosureGetClosureEvent extends CashierClosureEvent {
  CashierClosureGetClosureEvent({required this.date});
  final String date;
}

class CashierClosureGetForClosureEvent extends CashierClosureEvent {
  CashierClosureGetForClosureEvent({required this.date});
  final String date;
}

class CashierClosureGetClosurePreviouslyEvent extends CashierClosureEvent {}

class CashierClosurePostClosureEvent extends CashierClosureEvent {}

class CashierClosureGetCurrentDateEvent extends CashierClosureEvent {}
