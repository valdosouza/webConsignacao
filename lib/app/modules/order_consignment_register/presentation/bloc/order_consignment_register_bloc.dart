import 'package:appweb/app/modules/Core/data/model/order_paid_model.dart';
import 'package:appweb/app/modules/order_attendence_register/data/models/order_attendance_model.dart';
import 'package:appweb/app/modules/order_consignment_register/data/models/order_consignment_checkpoint_model.dart';
import 'package:appweb/app/modules/order_consignment_register/data/models/order_consignment_supplying_model.dart';
import 'package:appweb/app/modules/order_consignment_register/domain/usescases/order_consignment_checkpoint_post.dart';
import 'package:appweb/app/modules/order_consignment_register/domain/usescases/order_consignment_supplying_getlast.dart';
import 'package:appweb/app/modules/order_consignment_register/domain/usescases/order_consignment_supplying_post.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/bloc/order_consignment_register_event.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/bloc/order_consignment_register_state.dart';
import 'package:bloc/bloc.dart';

class OrderConsignmentRegisterBloc
    extends Bloc<OrderConsignmentRegisterEvent, OrderConsignmentRegisterState> {
  final OrderConsignmentSupplyingGetlast getlastSupplying;
  final OrderConsignmentCheckpointPost postCheckpoint;
  final OrderConsignmentSupplyingPost postSupplying;

  late OrderAttendanceModel modelAttendance;
  OrderConsignmentCheckpointModel modelCheckpoint =
      OrderConsignmentCheckpointModel.isEmpty();
  OrderConsignmentSupplyingModel modelSupplying =
      OrderConsignmentSupplyingModel.isEmpty();

  OrderConsignmentRegisterBloc(
      {required this.getlastSupplying,
      required this.postCheckpoint,
      required this.postSupplying})
      : super(OrderConsignmentRegisterLoadingState()) {
    supplyingGetlast();
    checkpointPost();
    supplyingPost();
    clearCheckout();
    clearSupplying();
  }

  supplyingGetlast() {
    on<OrderConsignmentRegisterGetlastEvent>((event, emit) async {
      emit(OrderConsignmentRegisterLoadingState());

      modelCheckpoint = OrderConsignmentCheckpointModel.isEmpty();

      modelSupplying = OrderConsignmentSupplyingModel.isEmpty();

      final response =
          await getlastSupplying(event.tbInstitutionId, event.tbCustomerId);

      var result = response
          .fold((l) => OrderConsigngmentGetLastErrorState(l.toString()), (r) {
        modelSupplying = r;
        if (modelSupplying.order.id > 0) {
          modelCheckpoint =
              OrderConsignmentCheckpointModel.fromSupplying(modelSupplying);
        }
        return OrderConsignmentGetLastLoadedState(
            checkpointmodel: modelCheckpoint, supplyingmodel: modelSupplying);
      });
      emit(result);
    });
  }

  checkpointPost() {
    on<OrderConsignementRegisterCheckpointPostEvent>((event, emit) async {
      emit(OrderConsignmentRegisterLoadingState());
      event.checkpointmodel.order.id = modelAttendance.id;
      event.checkpointmodel.order.tbInstitutionId =
          modelAttendance.tbInstitutionId;
      event.checkpointmodel.order.dtRecord = modelAttendance.dtRecord;
      final response = await postCheckpoint(event.checkpointmodel);
      var result = response.fold(
          (l) => OrderConsignmentRegisterCheckpointPostErrorState(
              error: l.toString()), (r) {
        modelCheckpoint = r;
        modelSupplying =
            OrderConsignmentSupplyingModel.fromCheckpoint(modelCheckpoint);
        return OrderConsignmentRegisterCheckpointPostSucessState(
            supplyingmode: modelSupplying);
      });
      emit(result);
    });
  }

  supplyingPost() {
    on<OrderConsignementRegisterSupplyngPostEvent>((event, emit) async {
      emit(OrderConsignmentRegisterLoadingState());
      event.suplyingmodel.order.id = modelAttendance.id;
      event.suplyingmodel.order.tbInstitutionId =
          modelAttendance.tbInstitutionId;
      event.suplyingmodel.order.dtRecord = modelAttendance.dtRecord;

      final response = await postSupplying(event.suplyingmodel);
      response.fold((l) {
        emit(OrderConsignmentRegisterSupplyingPostErrorState(
            error: l.toString()));
      }, (r) {
        emit(OrderConsignmentRegisterSupplyingPostSucessState());
      });
    });
  }

  clearCheckout() {
    on<OrderConsignmentRegisterClearCheckoutEvent>((event, emit) async {
      for (OrderConsignmentCheckpointCardModel item in modelCheckpoint.items) {
        item.leftover = 0;
        item.qtySold = 0;
        item.subtotal = 0;
      }
      modelCheckpoint.order.totalValue = 0;
      modelCheckpoint.order.changeValue = 0;
      modelCheckpoint.order.currentDebitBalance = 0;
      for (OrderPaidModel item in modelCheckpoint.payments) {
        item.value = 0;
      }
    });
  }

  clearSupplying() {
    on<OrderConsignmentRegisterClearSupplyingEvent>((event, emit) async {
      for (OrderConsignmentSupplyingCardModel item in modelSupplying.items) {
        item.bonus = 0;
        item.devolution = 0;
        item.newConsignment = 0;
      }
    });
  }
}
