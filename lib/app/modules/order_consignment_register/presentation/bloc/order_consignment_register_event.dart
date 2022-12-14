import 'package:appweb/app/modules/order_consignment_register/data/models/order_consignment_checkpoint_model.dart';
import 'package:appweb/app/modules/order_consignment_register/data/models/order_consignment_supplying_model.dart';

abstract class OrderConsignmentRegisterEvent {}

class OrderConsignmentRegisterGetlastEvent
    extends OrderConsignmentRegisterEvent {
  final int tbInstitutionId;
  final int tbCustomerId;

  OrderConsignmentRegisterGetlastEvent(
      {required this.tbInstitutionId, required this.tbCustomerId});
}

class OrderConsignementRegisterCheckpointPostEvent
    extends OrderConsignmentRegisterEvent {
  final OrderConsignmentCheckpointModel checkpointmodel;

  OrderConsignementRegisterCheckpointPostEvent({required this.checkpointmodel});
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
