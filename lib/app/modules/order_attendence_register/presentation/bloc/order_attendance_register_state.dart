import 'package:appweb/app/modules/order_attendence_register/data/models/order_attendance_checkpoint_model.dart';
import 'package:appweb/app/modules/order_attendence_register/data/models/order_attendance_model.dart';
import 'package:appweb/app/modules/order_attendence_register/data/models/order_attendance_supplying_model.dart';
import 'package:equatable/equatable.dart';

class OrderAttendanceRegisterState extends Equatable{
  @override
  List<Object?> get props => [];
}

class OrderAttendanceRegisterLoadingState extends OrderAttendanceRegisterState{
  @override
  List<Object?> get props => [];
}


class OrderAttendanceRegisterLoadedState extends OrderAttendanceRegisterState{
  final OrderAttendanceModel orderAttendanceModel;

  OrderAttendanceRegisterLoadedState(this.orderAttendanceModel);
  @override
  List<Object?> get props => [orderAttendanceModel];
}


class OrderAttendanceRegisterListLoadingState extends OrderAttendanceRegisterState{
  final List<OrderAttendanceModel> orderAttendanceList;

  OrderAttendanceRegisterListLoadingState(this.orderAttendanceList);
  
  @override
  List<Object?> get props => [orderAttendanceList];
}

class OrderAttendanceRegisterSupplyingLoadedState extends OrderAttendanceRegisterState{
  final OrderAttendanceSupplyingModel orderAttendanceSupplying;

  OrderAttendanceRegisterSupplyingLoadedState(this.orderAttendanceSupplying);
  @override
  List<Object?> get props => [orderAttendanceSupplying];
}


class OrderAttendanceErrorState extends OrderAttendanceRegisterState{
  final String message;

  OrderAttendanceErrorState(this.message);

  @override
  List<Object?> get props => [message];
}

class OrderAttendanceRegisterCheckpointLoadedState extends OrderAttendanceRegisterState{
  final OrderAttendanceCheckpointModel orderAttendanceCheckpointModel;

  OrderAttendanceRegisterCheckpointLoadedState(this.orderAttendanceCheckpointModel);
  @override
  List<Object?> get props => [];
}