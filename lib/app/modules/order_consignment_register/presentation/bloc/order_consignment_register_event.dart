import 'package:appweb/app/modules/order_consignment_register/data/model/order_consignment_checkpoint_model.dart';
import 'package:appweb/app/modules/order_consignment_register/data/model/order_consignment_supplying_model.dart';

abstract class OrderConsignmentRegisterEvent {}

class OrderConsignmentRegisterGetlastEvent
    extends OrderConsignmentRegisterEvent {
  final int tbCustomerId;

  OrderConsignmentRegisterGetlastEvent({required this.tbCustomerId});
}

class OrderConsignmentRegisterGetlistEvent
    extends OrderConsignmentRegisterEvent {
  final int tbCustomerId;

  OrderConsignmentRegisterGetlistEvent({required this.tbCustomerId});
}

class OrderConsignementRegisterCheckpointPostEvent
    extends OrderConsignmentRegisterEvent {
  final OrderConsignmentCheckpointModel checkpointmodel;

  OrderConsignementRegisterCheckpointPostEvent({required this.checkpointmodel});
}

class CheckpointDeleteEvent extends OrderConsignmentRegisterEvent {
  final int tbOrderId;

  CheckpointDeleteEvent({required this.tbOrderId});
}

class OrderConsignementRegisterSupplyngPostEvent
    extends OrderConsignmentRegisterEvent {
  final OrderConsignmentSupplyingModel suplyingmodel;

  OrderConsignementRegisterSupplyngPostEvent({required this.suplyingmodel});
}

class OrderConsignmentRegisterClearCheckoutEvent
    extends OrderConsignmentRegisterEvent {}

class OrderConsignmentRegisterClearSupplyingEvent
    extends OrderConsignmentRegisterEvent {}

class ReturnToCheckpointEvent extends OrderConsignmentRegisterEvent {}

class ReturnToSupplyingEvent extends OrderConsignmentRegisterEvent {}

class ReturnToAttendanceEvent extends OrderConsignmentRegisterEvent {}

class SearchEvent extends OrderConsignmentRegisterEvent {
  String search;

  SearchEvent({
    required this.search,
  });
}

class GetCheckpoint extends OrderConsignmentRegisterEvent {
  int orderid;
  int customerid;
  GetCheckpoint({
    required this.orderid,
    required this.customerid,
  });
}

class GetSupplying extends OrderConsignmentRegisterEvent {
  int orderid;
  GetSupplying({
    required this.orderid,
  });
}
