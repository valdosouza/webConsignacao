part of 'cashier_closure_bloc.dart';

abstract class CashierClosureEvent extends Equatable {
  const CashierClosureEvent();

  @override
  List<Object> get props => [];
}

class CashierClosureGetClosureOnSearchEvent extends CashierClosureEvent {
  const CashierClosureGetClosureOnSearchEvent({required this.value});
  final String value;
}

class CashierClosureGetClosureEvent extends CashierClosureEvent {
  const CashierClosureGetClosureEvent({
    required this.institutionId,
    required this.userId,
    required this.date,
  });
  final int institutionId;
  final int userId;
  final DateTime date;
}

class CashierClosureGetClosurePreviouslyEvent extends CashierClosureEvent {
  const CashierClosureGetClosurePreviouslyEvent({
    required this.institutionId,
    required this.userId,
  });
  final int institutionId;
  final int userId;
}
