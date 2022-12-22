import 'package:appweb/app/modules/order_consignment_register/data/models/order_consignment_checkpoint_model.dart';
import 'package:appweb/app/modules/order_consignment_register/data/models/order_consignment_supplying_model.dart';

abstract class OrderConsignmentRegisterState {}

class OrderConsignmentRegisterLoadingState
    extends OrderConsignmentRegisterState {}

class OrderConsigngmentGetLastErrorState extends OrderConsignmentRegisterState {
  final String error;

  OrderConsigngmentGetLastErrorState(this.error);
}

class OrderConsignmentGetLastLoadedState extends OrderConsignmentRegisterState {
  OrderConsignmentCheckpointModel checkpointmodel;
  OrderConsignmentSupplyingModel supplyingmodel;
  OrderConsignmentGetLastLoadedState({
    required this.checkpointmodel,
    required this.supplyingmodel,
  });
}

class OrderConsignmentRegisterCheckpointPostErrorState
    extends OrderConsignmentRegisterState {
  final String error;
  OrderConsignmentRegisterCheckpointPostErrorState({
    required this.error,
  });
}

class OrderConsignmentRegisterCheckpointPostSucessState
    extends OrderConsignmentRegisterState {
  final OrderConsignmentSupplyingModel supplyingmode;

  OrderConsignmentRegisterCheckpointPostSucessState(
      {required this.supplyingmode});
}

class OrderConsignmentRegisterCalcDoneState
    extends OrderConsignmentRegisterState {}

class OrderConsignmentRegisterSupplyingPostErrorState
    extends OrderConsignmentRegisterState {
  final String error;
  OrderConsignmentRegisterSupplyingPostErrorState({
    required this.error,
  });
}

class OrderConsignmentRegisterSupplyingPostSucessState
    extends OrderConsignmentRegisterState {}
