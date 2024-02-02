import 'package:appweb/app/modules/order_consignment_register/data/model/order_consignment_checkpoint_model.dart';
import 'package:appweb/app/modules/order_consignment_register/data/model/order_consignment_list_model.dart';
import 'package:appweb/app/modules/order_consignment_register/data/model/order_consignment_supplying_model.dart';

abstract class OrderConsignmentRegisterState {}

class OrderConsignmentRegisterLoadingState
    extends OrderConsignmentRegisterState {}

class OrderConsigngmentGetLastErrorState extends OrderConsignmentRegisterState {
  final String error;
  OrderConsigngmentGetLastErrorState(this.error);
}

class OrderConsigngmentGetListErrorState extends OrderConsignmentRegisterState {
  final String error;
  OrderConsigngmentGetListErrorState(this.error);
}

class OrderConsigngmentGetCheckpointErrorState
    extends OrderConsignmentRegisterState {
  final String error;
  OrderConsigngmentGetCheckpointErrorState(this.error);
}

class OrderConsigngmentGetSupplyingErrorState
    extends OrderConsignmentRegisterState {
  final String error;
  OrderConsigngmentGetSupplyingErrorState(this.error);
}

class OrderConsignmentGetLastLoadedState extends OrderConsignmentRegisterState {
  OrderConsignmentCheckpointModel checkpointmodel;
  OrderConsignmentSupplyingModel supplyingmodel;
  OrderConsignmentGetLastLoadedState({
    required this.checkpointmodel,
    required this.supplyingmodel,
  });
}

class OrderConsignmentGetCheckpointLoadedState
    extends OrderConsignmentRegisterState {
  OrderConsignmentCheckpointModel checkpointmodel;
  OrderConsignmentGetCheckpointLoadedState({
    required this.checkpointmodel,
  });
}

class OrderConsignmentGetSupplyingLoadedState
    extends OrderConsignmentRegisterState {
  OrderConsignmentSupplyingModel supplyingModel;
  OrderConsignmentGetSupplyingLoadedState({
    required this.supplyingModel,
  });
}

class OrderConsignmentRegisterCheckpointPostErrorState
    extends OrderConsignmentRegisterState {
  final String error;
  OrderConsignmentRegisterCheckpointPostErrorState({
    required this.error,
  });
}

class CheckpointDeleteSucessState extends OrderConsignmentRegisterState {}

class CheckpointDeleteErrorState extends OrderConsignmentRegisterState {
  final String error;
  CheckpointDeleteErrorState({
    required this.error,
  });
}

class OrderConsignmentRegisterCheckpointPostSucessState
    extends OrderConsignmentRegisterState {
  final OrderConsignmentSupplyingModel supplyingmode;

  OrderConsignmentRegisterCheckpointPostSucessState(
      {required this.supplyingmode});
}

class ReturnToCheckpointState extends OrderConsignmentRegisterState {}

class ReturnToSupplyingState extends OrderConsignmentRegisterState {}

class ReturnToAttendanceState extends OrderConsignmentRegisterState {}

class OrderConsignmentRegisterCalcDoneState
    extends OrderConsignmentRegisterState {}

class OrderConsignmentRegisterSupplyingPostErrorState
    extends OrderConsignmentRegisterState {
  final String error;
  OrderConsignmentRegisterSupplyingPostErrorState({required this.error});
}

class OrderConsignmentRegisterSupplyingPostSucessState
    extends OrderConsignmentRegisterState {}

class OrderConsignmentRegisterSupplyingClearSucessState
    extends OrderConsignmentRegisterState {}

class OrderConsignmentRegisterCheckpointClearSucessState
    extends OrderConsignmentRegisterState {}

class OrderConsignmentGetListLoadedState extends OrderConsignmentRegisterState {
  List<OrderConsignmetListModel> orderList;
  OrderConsignmentGetListLoadedState({required this.orderList});
}
