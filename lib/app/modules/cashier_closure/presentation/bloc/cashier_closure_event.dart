part of 'cashier_closure_bloc.dart';

abstract class CashierClosureEvent {
  const CashierClosureEvent();
}

class CashierClosureGetClosureOnSearchEvent extends CashierClosureEvent {
  const CashierClosureGetClosureOnSearchEvent({required this.value});
  final String value;
}

class CashierClosureGetClosureEvent extends CashierClosureEvent {
  const CashierClosureGetClosureEvent({
    required this.date,
  });
  final String date;
}

class CashierClosureGetClosurePreviouslyEvent extends CashierClosureEvent {
  const CashierClosureGetClosurePreviouslyEvent();
}

class CashierClosurePostClosureEvent extends CashierClosureEvent {
  const CashierClosurePostClosureEvent();
}
