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
        if (r.order.id > 0) {
          modelSupplying = r;
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
      final response = await postSupplying(event.suplyingmode);
      response.fold((l) {
        emit(OrderConsignmentRegisterSupplyingPostErrorState(
            error: l.toString()));
      }, (r) {
        emit(OrderConsignmentRegisterSupplyingPostSucessState());
      });
    });
  }
}
