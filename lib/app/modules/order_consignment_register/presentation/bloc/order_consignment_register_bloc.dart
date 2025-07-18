import 'package:appweb/app/core/shared/utils/custom_date.dart';
import 'package:appweb/app/modules/Core/data/model/order_paid_model.dart';
import 'package:appweb/app/modules/order_attendence_register/data/model/order_attendance_model.dart';
import 'package:appweb/app/modules/order_consignment_register/data/model/order_consignment_checkpoint_model.dart';
import 'package:appweb/app/modules/order_consignment_register/data/model/order_consignment_list_model.dart';
import 'package:appweb/app/modules/order_consignment_register/data/model/order_consignment_supplying_model.dart';
import 'package:appweb/app/modules/order_consignment_register/domain/usecase/checkpoint_delete.dart';
import 'package:appweb/app/modules/order_consignment_register/domain/usecase/order_consignment_checkpoint_post.dart';
import 'package:appweb/app/modules/order_consignment_register/domain/usecase/order_consignment_get_checkpoint.dart';
import 'package:appweb/app/modules/order_consignment_register/domain/usecase/order_consignment_get_supplying.dart';
import 'package:appweb/app/modules/order_consignment_register/domain/usecase/order_consignment_getlist.dart';
import 'package:appweb/app/modules/order_consignment_register/domain/usecase/order_consignment_supplying_getlast.dart';
import 'package:appweb/app/modules/order_consignment_register/domain/usecase/order_consignment_supplying_post.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/bloc/order_consignment_register_event.dart';
import 'package:appweb/app/modules/order_consignment_register/presentation/bloc/order_consignment_register_state.dart';
import 'package:bloc/bloc.dart';

class OrderConsignmentRegisterBloc
    extends Bloc<OrderConsignmentRegisterEvent, OrderConsignmentRegisterState> {
  final OrderConsignmentSupplyingGetlast getlastSupplying;
  final OrderConsignmentCheckpointPost postCheckpoint;
  final CheckpointDelete deleteCheckpoint;
  final OrderConsignmentSupplyingPost postSupplying;
  final OrderConsignmentGetlist orderConsignmentGetlist;
  final OrderConsignmentGetCheckpoint orderConsignmentGetCheckpoint;
  final OrderConsignmentGetSupplying orderConsignmentGetSupplying;
  int stage = 0;
  late OrderAttendanceModel modelAttendance;
  OrderConsignmentCheckpointModel modelCheckpoint =
      OrderConsignmentCheckpointModel.isEmpty();
  OrderConsignmentSupplyingModel modelSupplying =
      OrderConsignmentSupplyingModel.isEmpty();
  List<OrderConsignmetListModel> orderList = [];
  List<OrderConsignmetListModel> orderListSearch = [];
  String dateSelected = CustomDate.newDate();

  OrderConsignmentRegisterBloc({
    required this.getlastSupplying,
    required this.postCheckpoint,
    required this.deleteCheckpoint,
    required this.postSupplying,
    required this.orderConsignmentGetlist,
    required this.orderConsignmentGetCheckpoint,
    required this.orderConsignmentGetSupplying,
  }) : super(OrderConsignmentRegisterLoadingState()) {
    supplyingGetlast();
    checkpointPost();
    supplyingPost();
    clearCheckout();
    deleteCheckout();
    clearSupplying();
    getList();
    searchList();
    getCheckpoint();
    getSupplying();
    returnToCheckpoint();
    returnToSupplying();
    returnToAttendance();
  }

  void supplyingGetlast() {
    on<OrderConsignmentRegisterGetlastEvent>((event, emit) async {
      emit(OrderConsignmentRegisterLoadingState());
      stage = 1;
      modelCheckpoint = OrderConsignmentCheckpointModel.isEmpty();

      modelSupplying = OrderConsignmentSupplyingModel.isEmpty();

      final response = await getlastSupplying(event.tbCustomerId);

      var result = response
          .fold((l) => OrderConsigngmentGetLastErrorState(l.toString()), (r) {
        modelSupplying = r;
        if (modelSupplying.order.id > 0) {
          stage = 2;
          modelCheckpoint =
              OrderConsignmentCheckpointModel.fromSupplying(modelSupplying);
        }
        return OrderConsignmentGetLastLoadedState(
            checkpointmodel: modelCheckpoint, supplyingmodel: modelSupplying);
      });
      emit(result);
    });
  }

  Future<String> _validadeCheckPoinPost() async {
    if (modelCheckpoint.order.totalValue > 0) {
      double valuereceived = 0;
      for (var item in modelCheckpoint.payments) {
        valuereceived += item.value;
      }
      if (valuereceived >
          (modelCheckpoint.order.totalValue +
              modelCheckpoint.order.changeValue)) {
        return "Verifique! Valor recebido maior que o devido";
      }
      if (modelCheckpoint.order.changeValue >
          modelCheckpoint.payments[0].value) {
        return "Verifique! Verifique o valor do troco";
      }
    }

    return "";
  }

  void checkpointPost() {
    on<OrderConsignementRegisterCheckpointPostEvent>((event, emit) async {
      emit(OrderConsignmentRegisterLoadingState());
      String errorValidate = await _validadeCheckPoinPost();

      if (errorValidate.isNotEmpty) {
        emit(OrderConsignmentRegisterCheckpointPostErrorState(
            error: errorValidate));
      } else {
        event.checkpointmodel.order.id = modelAttendance.id;
        event.checkpointmodel.order.tbInstitutionId =
            modelAttendance.tbInstitutionId;
        event.checkpointmodel.order.dtRecord = modelAttendance.dtRecord;
        final response = await postCheckpoint(event.checkpointmodel);
        var result = response.fold(
            (l) => OrderConsignmentRegisterCheckpointPostErrorState(
                error: l.toString()), (r) {
          stage = 2;
          modelCheckpoint = r;
          modelSupplying =
              OrderConsignmentSupplyingModel.fromCheckpoint(modelCheckpoint);
          return OrderConsignmentRegisterCheckpointPostSucessState(
              supplyingmode: modelSupplying);
        });
        emit(result);
      }
    });
  }

  void deleteCheckout() {
    on<CheckpointDeleteEvent>((event, emit) async {
      emit(OrderConsignmentRegisterLoadingState());

      final response = await deleteCheckpoint(event.tbOrderId);
      var result = response
          .fold((l) => CheckpointDeleteErrorState(error: l.toString()), (r) {
        return CheckpointDeleteSucessState();
      });
      emit(result);
    });
  }

  Future<String> _validadeSupplyingPost() async {
    double leftover = 0;
    for (var item in modelSupplying.items) {
      leftover += item.leftover;
    }
    if (leftover > 0) {
      if (modelSupplying.order.recall == "S") {
        if (modelSupplying.order.note.length < 10) {
          return "Detalhe melhor por que o produto foi recolhido.";
        }
        for (var item in modelSupplying.items) {
          item.devolution = item.leftover;
        }
      }
    } else {
      double bonus = 0;
      for (var item in modelSupplying.items) {
        bonus += item.bonus;
      }
      double newConsignment = 0;
      for (var item in modelSupplying.items) {
        newConsignment += item.newConsignment;
      }
      if (modelSupplying.order.recall != "S") {
        if ((newConsignment == 0) && (bonus == 0)) {
          return "Preecha a coluna de Bonus ou de Nova Consignação.";
        }
      }
    }

    return "";
  }

  void supplyingPost() {
    on<OrderConsignementRegisterSupplyngPostEvent>((event, emit) async {
      emit(OrderConsignmentRegisterLoadingState());
      String errorValidate = await _validadeSupplyingPost();

      if (errorValidate.isNotEmpty) {
        emit(OrderConsignmentRegisterSupplyingPostErrorState(
            error: errorValidate));
      } else {
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
      }
    });
  }

  void clearCheckout() {
    on<OrderConsignmentRegisterClearCheckoutEvent>((event, emit) async {
      emit(OrderConsignmentRegisterLoadingState());
      for (OrderConsignmentCheckpointCardModel item in modelCheckpoint.items) {
        item.leftover = 0;
        item.sale = 0;
        item.subtotal = 0;
      }
      modelCheckpoint.order.totalValue = 0;
      modelCheckpoint.order.changeValue = 0;
      modelCheckpoint.order.currentDebitBalance = 0;
      for (OrderPaidModel item in modelCheckpoint.payments) {
        item.value = 0;
      }
      emit(OrderConsignmentRegisterCheckpointClearSucessState());
    });
  }

  void clearSupplying() {
    on<OrderConsignmentRegisterClearSupplyingEvent>((event, emit) async {
      emit(OrderConsignmentRegisterLoadingState());
      for (OrderConsignmentSupplyingCardModel item in modelSupplying.items) {
        item.bonus = 0;
        item.devolution = 0;
        item.newConsignment = 0;
        item.qttyConsigned = 0;
      }
      modelSupplying.order.note = "";
      emit(OrderConsignmentRegisterSupplyingClearSucessState());
    });
  }

  void getList() {
    on<OrderConsignmentRegisterGetlistEvent>((event, emit) async {
      emit(OrderConsignmentRegisterLoadingState());

      final response = await orderConsignmentGetlist(event.tbCustomerId);

      var result = response
          .fold((l) => OrderConsigngmentGetListErrorState(l.toString()), (r) {
        orderList = r;
        return OrderConsignmentGetListLoadedState(orderList: r);
      });
      emit(result);
    });
  }

  void searchList() {
    on<SearchEvent>((event, emit) async {
      if (event.search.isNotEmpty) {
        orderListSearch =
            orderList.where((x) => x.dtRecord == event.search).toList();
        emit(OrderConsignmentGetListLoadedState(orderList: orderListSearch));
      } else {
        emit(OrderConsignmentGetListLoadedState(orderList: orderList));
      }
    });
  }

  void getCheckpoint() {
    on<GetCheckpoint>((event, emit) async {
      emit(OrderConsignmentRegisterLoadingState());
      final response = await orderConsignmentGetCheckpoint(event.orderid);

      var result = response.fold(
          (l) => OrderConsigngmentGetCheckpointErrorState(l.toString()), (r) {
        if (r.order.id > 0) {
          return OrderConsignmentGetCheckpointLoadedState(checkpointmodel: r);
        }
        return OrderConsignmentGetCheckpointNotFoundState(
            tbOrderId: event.orderid, tbCustomerId: event.customerid);
      });
      emit(result);
    });
  }

  void getSupplying() {
    on<GetSupplying>((event, emit) async {
      emit(OrderConsignmentRegisterLoadingState());

      final response = await orderConsignmentGetSupplying(event.orderid);

      var result = response.fold(
          (l) => OrderConsigngmentGetSupplyingErrorState(l.toString()), (r) {
        return OrderConsignmentGetSupplyingLoadedState(supplyingModel: r);
      });
      emit(result);
    });
  }

  void returnToCheckpoint() {
    on<ReturnToCheckpointEvent>((event, emit) async {
      emit(ReturnToCheckpointState());
    });
  }

  void returnToSupplying() {
    on<ReturnToSupplyingEvent>((event, emit) async {
      emit(ReturnToSupplyingState());
    });
  }

  void returnToAttendance() {
    on<ReturnToAttendanceEvent>((event, emit) async {
      emit(ReturnToAttendanceState());
    });
  }
}
