import 'package:appweb/app/modules/attendance_ordering/domain/usecase/apply_default_sequence.dart';
import 'package:appweb/app/modules/attendance_ordering/domain/usecase/get_customer.dart';
import 'package:appweb/app/modules/attendance_ordering/domain/usecase/set_default_sequence.dart';

abstract class AttendanceOrderingEvent {}

class GetRegionListEvent extends AttendanceOrderingEvent {}

class GetRouteListEvent extends AttendanceOrderingEvent {}

class GetCustomerListEvent extends AttendanceOrderingEvent {
  final ParamsGetCustomer params;
  GetCustomerListEvent({
    required this.params,
  });
}

class SetDefaultSequenceEvent extends AttendanceOrderingEvent {
  final ParamsDefaultSequence params;
  SetDefaultSequenceEvent({
    required this.params,
  });
}

class ApplyDefaultSequenceEvent extends AttendanceOrderingEvent {
  final ParamsApplyDefaultSequence params;
  ApplyDefaultSequenceEvent({
    required this.params,
  });
}

class MainFormEvent extends AttendanceOrderingEvent {}

class OrderModeEvent extends AttendanceOrderingEvent {
  final int tbCustomerId;
  OrderModeEvent({
    required this.tbCustomerId,
  });
}
