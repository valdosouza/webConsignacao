import 'package:appweb/app/modules/order_attendence_register/data/models/order_attendance_checkpoint_model.dart';
import 'package:appweb/app/modules/order_attendence_register/data/models/order_attendance_model.dart';
import 'package:appweb/app/modules/order_attendence_register/data/models/order_attendance_supplying_model.dart';
import 'package:equatable/equatable.dart';

class OrderAttendanceRegisterEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class OrderAttendanceRegisterCheckpointGetEvent extends OrderAttendanceRegisterEvent {
  final int tbInstitutionId;
  final int id;
  
  OrderAttendanceRegisterCheckpointGetEvent(this.tbInstitutionId, this.id);
  @override
  List<Object> get props => [tbInstitutionId, id];
}

class OrderAttendanceRegisterPostCheckPointEvent extends OrderAttendanceRegisterEvent {
  final OrderAttendanceCheckpointModel orderAttendanceModel;

  OrderAttendanceRegisterPostCheckPointEvent(this.orderAttendanceModel);
  @override
  List<Object> get props => [orderAttendanceModel];
}

class OrderAttendanceRegisterPostEvent extends OrderAttendanceRegisterEvent {
  final OrderAttendanceModel orderAttendanceModel;

  OrderAttendanceRegisterPostEvent(this.orderAttendanceModel);
  @override
  List<Object> get props => [orderAttendanceModel];
}

class OrderAttendanceRegisterPostSupplyingEvent extends OrderAttendanceRegisterEvent {
  final OrderAttendanceSupplyingModel orderAttendanceSupplyingModel;

  OrderAttendanceRegisterPostSupplyingEvent(this.orderAttendanceSupplyingModel);
  @override
  List<Object> get props => [];
}


class OrderAttendanceRegisterGetSupplyingEvent extends OrderAttendanceRegisterEvent {
  final int tbInstitutionId;
  final int id;
  
  OrderAttendanceRegisterGetSupplyingEvent(this.tbInstitutionId, this.id);
  @override
  List<Object> get props => [tbInstitutionId, id];
}

class OrderAttendanceRegisterGetEvent extends OrderAttendanceRegisterEvent {
  final int tbInstitutionId;
  final int id;
  
  OrderAttendanceRegisterGetEvent(this.tbInstitutionId, this.id);
  @override
  List<Object> get props => [tbInstitutionId, id];
}

class OrderAttendanceRegisterGetAllEvent extends OrderAttendanceRegisterEvent {
  final int tbInstitutionId;
  
  OrderAttendanceRegisterGetAllEvent(this.tbInstitutionId);
  @override
  List<Object> get props => [tbInstitutionId];
}

class OrderAttendanceRegisterDeleteEvent extends OrderAttendanceRegisterEvent {
  final int tbInstitutionId;
  final int id;
  
  OrderAttendanceRegisterDeleteEvent(this.tbInstitutionId, this.id);
  @override
  List<Object> get props => [tbInstitutionId, id];
}

class OrderAttendanceRegisterPutEvent extends OrderAttendanceRegisterEvent {
  final OrderAttendanceModel orderAttendanceModel;

  OrderAttendanceRegisterPutEvent(this.orderAttendanceModel);
  @override
  List<Object> get props => [orderAttendanceModel];
}

class OrderAttendanceRegisterCheckpointPostEvent extends OrderAttendanceRegisterEvent {
  final OrderAttendanceCheckpointModel orderAttendanceCheckpointModel;

  OrderAttendanceRegisterCheckpointPostEvent(this.orderAttendanceCheckpointModel);
  @override
  List<Object> get props => [orderAttendanceCheckpointModel];
}

class OrderAttendanceRegisterSupplyingGetEvent extends OrderAttendanceRegisterEvent {
  final int tbInstitutionId;
  final int id;
  
  OrderAttendanceRegisterSupplyingGetEvent(this.tbInstitutionId, this.id);
  @override
  List<Object> get props => [tbInstitutionId, id];
}

class OrderAttendanceRegisterSupplyingGetlastEvent extends OrderAttendanceRegisterEvent {
  final int tbInstitutionId;
  final int id;
  
  OrderAttendanceRegisterSupplyingGetlastEvent(this.tbInstitutionId, this.id);
  @override
  List<Object> get props => [tbInstitutionId, id];
}

