import 'package:appweb/app/modules/order_attendence_register/data/models/order_attendance_checkpoint_model.dart';
import 'package:appweb/app/modules/order_attendence_register/data/models/order_attendance_model.dart';
import 'package:appweb/app/modules/order_attendence_register/data/models/order_attendance_supplying_model.dart';
import 'package:appweb/app/modules/order_attendence_register/domain/usescases/order_attendance_checkpoint_get_usescases.dart';
import 'package:appweb/app/modules/order_attendence_register/domain/usescases/order_attendance_checkpoint_usescases.dart';
import 'package:appweb/app/modules/order_attendence_register/domain/usescases/order_attendance_delete_usescases.dart';
import 'package:appweb/app/modules/order_attendence_register/domain/usescases/order_attendance_get_all_usescases.dart';
import 'package:appweb/app/modules/order_attendence_register/domain/usescases/order_attendance_get_usescases.dart';
import 'package:appweb/app/modules/order_attendence_register/domain/usescases/order_attendance_post_usescases.dart';
import 'package:appweb/app/modules/order_attendence_register/domain/usescases/order_attendance_put_usescases.dart';
import 'package:appweb/app/modules/order_attendence_register/domain/usescases/order_attendance_supplying_get_usescases.dart';
import 'package:appweb/app/modules/order_attendence_register/domain/usescases/order_attendance_supplying_getlast_usescases.dart';
import 'package:appweb/app/modules/order_attendence_register/domain/usescases/order_attendance_supplying_post_usescases.dart';
import 'package:appweb/app/modules/order_attendence_register/presentation/bloc/order_attendance_register_event.dart';
import 'package:appweb/app/modules/order_attendence_register/presentation/bloc/order_attendance_register_state.dart';
import 'package:bloc/bloc.dart';

class OrderAttendanceRegisterBloc
    extends Bloc<OrderAttendanceRegisterEvent, OrderAttendanceRegisterState> {
  final OrderAttendanceGetUsescases getOrderAttendance;
  final OrderAttendanceGetAllUsescases getAllOrderAttendance;
  final OrderAttendanceDeleteUsescases deleteOrderAttendance;
  final OrderAttendancePostUsescases postOrderAttendance;
  final OrderAttendancePutUsescases putOrderAttendance;
  final OrderAttendanceCheckpointGetUsescases getCheckpoint;
  final OrderAttendanceCheckpointPostUsescases postCheckpoint;
  final OrderAttendanceSupplyingGetUsescases getSupplying;
  final OrderAttendanceSupplyingGetlastUsescases getlastSupplying;
  final OrderAttendanceSupplyingPostUsescases postSupplying;

  OrderAttendanceModel modelAttendance = OrderAttendanceModel.isEmpty();
  OrderAttendanceCheckpointModel modelCheckpoint =
      OrderAttendanceCheckpointModel.isEmpty();
  OrderAttendanceSupplyingModel modelSupplying =
      OrderAttendanceSupplyingModel.isEmpty();
  List<OrderAttendanceModel> orderAttendanceList = [];
  OrderAttendanceRegisterBloc(
      {required this.getOrderAttendance,
      required this.getAllOrderAttendance,
      required this.deleteOrderAttendance,
      required this.postOrderAttendance,
      required this.putOrderAttendance,
      required this.getCheckpoint,
      required this.postCheckpoint,
      required this.getSupplying,
      required this.getlastSupplying,
      required this.postSupplying})
      : super(OrderAttendanceRegisterLoadingState()) {
    attendanceGet();
    attendanceGetAll();
    attendanceDelete();
    attendancePost();
    attendancePut();
    checkpointGet();
    checkpointPost();
    supplyingGet();
    supplyingGetlast();
    supplyingPost();
  }

  attendanceGet() {
    on<OrderAttendanceRegisterGetEvent>((event, emit) async {
      emit(OrderAttendanceRegisterLoadingState());
      final response =
          await getOrderAttendance(event.tbInstitutionId, event.id);
      var result =
          response.fold((l) => OrderAttendanceErrorState(l.toString()), (r) {
        modelAttendance = r;
        return OrderAttendanceRegisterLoadedState(modelAttendance);
      });
      emit(result);
    });
  }

  attendanceGetAll() {
    on<OrderAttendanceRegisterGetAllEvent>((event, emit) async {
      emit(OrderAttendanceRegisterLoadingState());
      final response = await getAllOrderAttendance(event.tbInstitutionId);
      var result =
          response.fold((l) => OrderAttendanceErrorState(l.toString()), (r) {
        orderAttendanceList = r;
        return OrderAttendanceRegisterListLoadingState(orderAttendanceList);
      });
      emit(result);
    });
  }

  attendanceDelete() {
    on<OrderAttendanceRegisterDeleteEvent>((event, emit) async {
      emit(OrderAttendanceRegisterLoadingState());
      final response =
          await deleteOrderAttendance(event.tbInstitutionId, event.id);
      var result =
          response.fold((l) => OrderAttendanceErrorState(l.toString()), (r) {
        return OrderAttendanceRegisterLoadingState();
      });
      emit(result);
    });
  }

  attendancePost() {
    on<OrderAttendanceRegisterPostEvent>((event, emit) async {
      emit(OrderAttendanceRegisterLoadingState());
      final response = await postOrderAttendance(event.orderAttendanceModel);
      var result =
          response.fold((l) => OrderAttendanceErrorState(l.toString()), (r) {
        return OrderAttendanceRegisterLoadingState();
      });
      emit(result);
    });
  }

  attendancePut() {
    on<OrderAttendanceRegisterPutEvent>((event, emit) async {
      emit(OrderAttendanceRegisterLoadingState());
      final response = await putOrderAttendance(event.orderAttendanceModel);
      var result =
          response.fold((l) => OrderAttendanceErrorState(l.toString()), (r) {
        return OrderAttendanceRegisterLoadingState();
      });
      emit(result);
    });
  }

  checkpointGet() {
    on<OrderAttendanceRegisterCheckpointGetEvent>((event, emit) async {
      emit(OrderAttendanceRegisterLoadingState());
      final response = await getCheckpoint(event.tbInstitutionId, event.id);
      var result =
          response.fold((l) => OrderAttendanceErrorState(l.toString()), (r) {
        modelCheckpoint = r;
        return OrderAttendanceRegisterCheckpointLoadedState(modelCheckpoint);
      });
      emit(result);
    });
  }

  checkpointPost() {
    on<OrderAttendanceRegisterCheckpointPostEvent>((event, emit) async {
      emit(OrderAttendanceRegisterLoadingState());
      final response =
          await postCheckpoint(event.orderAttendanceCheckpointModel);
      var result =
          response.fold((l) => OrderAttendanceErrorState(l.toString()), (r) {
        return OrderAttendanceRegisterLoadingState();
      });
      emit(result);
    });
  }

  supplyingGet() {
    on<OrderAttendanceRegisterSupplyingGetEvent>((event, emit) async {
      emit(OrderAttendanceRegisterLoadingState());
      final response = await getSupplying(event.tbInstitutionId, event.id);
      var result =
          response.fold((l) => OrderAttendanceErrorState(l.toString()), (r) {
        modelSupplying = r;
        return OrderAttendanceRegisterSupplyingLoadedState(modelSupplying);
      });
      emit(result);
    });
  }

  supplyingGetlast() {
    on<OrderAttendanceRegisterSupplyingGetlastEvent>((event, emit) async {
      emit(OrderAttendanceRegisterLoadingState());
      final response = await getlastSupplying(event.tbInstitutionId, event.id);

      var result =
          response.fold((l) => OrderAttendanceErrorState(l.toString()), (r) {
        modelSupplying = r;
        modelCheckpoint =
            OrderAttendanceCheckpointModel.fromSupplying(modelSupplying);
        return OrderAttendanceRegisterSupplyingLoadedState(modelSupplying);
      });
      emit(result);
    });
  }

  supplyingPost() {
    on<OrderAttendanceRegisterPostSupplyingEvent>((event, emit) async {
      emit(OrderAttendanceRegisterLoadingState());
      final response = await postSupplying(event.orderAttendanceSupplyingModel);
      var result =
          response.fold((l) => OrderAttendanceErrorState(l.toString()), (r) {
        return OrderAttendanceRegisterLoadingState();
      });
      emit(result);
    });
  }
}
