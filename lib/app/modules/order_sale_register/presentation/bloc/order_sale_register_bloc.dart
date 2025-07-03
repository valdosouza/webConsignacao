import 'package:appweb/app/core/shared/utils/custom_date.dart';
import 'package:appweb/app/modules/Core/data/model/order_paid_model.dart';
import 'package:appweb/app/modules/order_attendence_register/data/model/order_attendance_model.dart';
import 'package:appweb/app/modules/order_sale_register/data/model/order_sale_list_model.dart';
import 'package:appweb/app/modules/order_sale_register/data/model/order_sale_main_card_model.dart';
import 'package:appweb/app/modules/order_sale_register/domain/usecase/get_order_sale_card.dart';
import 'package:appweb/app/modules/order_sale_register/domain/usecase/order_sale_getlist.dart';
import 'package:appweb/app/modules/order_sale_register/domain/usecase/order_sale_register_get_items.dart';
import 'package:appweb/app/modules/order_sale_register/domain/usecase/order_sale_register_post.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/bloc/order_sale_register_event.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/bloc/order_sale_register_state.dart';
import 'package:bloc/bloc.dart';

class OrderSaleRegisterBloc
    extends Bloc<OrderSaleRegisterEvent, OrderSaleRegisterState> {
  final GetNewOrderSaleCard getNewOrderSaleCard;
  final OrderSaleRegisterPost postOrderSale;
  final OrderSaleGetlist orderSaleGetlist;
  final GetOrderSaleCard getOrderSaleCard;

  late OrderAttendanceModel modelAttendance;
  OrderSaleMainCardModel modelOrderSale = OrderSaleMainCardModel.isEmpty();

  List<OrderSaleListModel> orderSaleList = [];
  List<OrderSaleListModel> orderSaleListSearch = [];
  int stage = 0;
  int pageOrderSale = 0;
  String dateSelected = CustomDate.newDate();

  OrderSaleRegisterBloc({
    required this.getNewOrderSaleCard,
    required this.postOrderSale,
    required this.orderSaleGetlist,
    required this.getOrderSaleCard,
  }) : super(OrderSaleRegisterLoadingState()) {
    ordersaleGetCard();
    ordersaleCardPos();
    _orderSaleGetList();
    _getBackOrderSaleGetList();
    _searchList();
    _getOrderSaleCard();
    _returnToOrderSale();
    _returnToAttendance();
  }

  void ordersaleGetCard() {
    on<OrderSaleRegisterGetCardEvent>((event, emit) async {
      emit(OrderSaleRegisterLoadingState());

      modelOrderSale.items.clear();

      final response =
          await getNewOrderSaleCard(tbPriceListId: event.tbPriceListId);

      var result = response
          .fold((l) => OrderSaleGetNewCardListErrorState(l.toString()), (r) {
        modelOrderSale.items = r;
        modelOrderSale.payments.clear();
        if (modelAttendance.tbPriceListId == 2) {
          modelOrderSale.payments.add(
            OrderPaidModel(
              tbPaymentTypeId: 3,
              namePaymentType: "BOLETO",
              dtExpiration: "",
              value: 0,
            ),
          );
        } else {
          modelOrderSale.payments.add(OrderPaidModel(
            tbPaymentTypeId: 1,
            namePaymentType: "DINHEIRO",
            dtExpiration: "",
            value: 0,
          ));
          modelOrderSale.payments.add(OrderPaidModel(
            tbPaymentTypeId: 2,
            namePaymentType: "PIX",
            dtExpiration: "",
            value: 0,
          ));
        }
        return OrderSaleGetNewCardListLoadedState(model: modelOrderSale);
      });
      emit(result);
    });
  }

  Future<String> _validadePost() async {
    if (modelOrderSale.payments[0].tbPaymentTypeId == 3) {
      modelOrderSale.payments[0].value = modelOrderSale.order.totalValue;
      if (modelOrderSale.payments[0].dtExpiration.isEmpty) {
        return "Informe a data de Vencimento.";
      }
    }
    if (modelOrderSale.order.totalValue == 0) {
      double bonus = 0;
      for (var item in modelOrderSale.items) {
        bonus += item.bonus;
      }
      //Se nenhum bonus foi dado e nenhuma venda informada
      if (bonus == 0) {
        return "Valor total igual a zero. Informe a venda.";
      }
    } else {
      double payment = 0;
      for (var item in modelOrderSale.payments) {
        payment += item.value;
      }
      if (payment < modelOrderSale.order.totalValue) {
        return "Os valores de pagamentos abaixo do esperado.";
      }
    }

    return "";
  }

  void ordersaleCardPos() {
    on<OrderSaleCardPostEvent>((event, emit) async {
      emit(OrderSaleRegisterLoadingState());
      String errorValidate = await _validadePost();

      if (errorValidate.isNotEmpty) {
        emit(OrderSaleCardPostErrorState(error: errorValidate));
      } else {
        event.model.order.id = modelAttendance.id;
        event.model.order.tbInstitutionId = modelAttendance.tbInstitutionId;
        event.model.order.tbCustomerId = modelAttendance.tbCustomerId;
        event.model.order.nameCustomer = modelAttendance.nameCustomer;

        event.model.order.tbSalesmanId = modelAttendance.tbSalesmanId;
        event.model.order.nameSalesman = modelAttendance.nameSalesman;

        event.model.order.tbUserId = modelAttendance.tbUserId;

        event.model.order.dtRecord = modelAttendance.dtRecord;

        final response = await postOrderSale(event.model);
        var result = response
            .fold((l) => OrderSaleCardPostErrorState(error: l.toString()), (r) {
          modelOrderSale.order = r;
          return OrderSaleCardPostSucessState();
        });
        emit(result);
      }
    });
  }

  void clearOrderSale() {
    on<OrderSaleRegisterClearEvent>((event, emit) async {
      emit(OrderSaleRegisterLoadingState());
      for (OrderSaleCardModel item in modelOrderSale.items) {
        item.bonus = 0;
        item.sale = 0;
        item.subtotal = 0;
      }
      modelOrderSale.order.totalValue = 0;
      modelOrderSale.order.changeValue = 0;
      for (OrderPaidModel item in modelOrderSale.payments) {
        item.value = 0;
      }
      emit(OrderSaleRegisterCleanDoneState());
    });
  }

  void _orderSaleGetList() {
    on<OrderSaleRegisterGetlistEvent>((event, emit) async {
      emit(OrderSaleRegisterLoadingState());
      if (event.params.page == 0) {
        orderSaleList.clear();
        pageOrderSale = 1;
      } else {
        pageOrderSale += 1;
      }
      event.params.page = pageOrderSale;
      final response = await orderSaleGetlist(event.params);

      var result = response.fold((l) => OrderSaleErrorState(l.toString()), (r) {
        orderSaleList += r;
        return OrderSaleGetListLoadedState(orderList: orderSaleList);
      });
      emit(result);
    });
  }

  void _getBackOrderSaleGetList() {
    on<OrderGetBackToGetlistEvent>((event, emit) async {
      emit(OrderSaleRegisterLoadingState());
      emit(OrderSaleGetListLoadedState(orderList: orderSaleList));
    });
  }

  void _searchList() {
    on<SearchEvent>((event, emit) async {
      if (event.search.isNotEmpty) {
        orderSaleListSearch =
            orderSaleList.where((x) => x.dtRecord == event.search).toList();
        emit(OrderSaleGetListLoadedState(orderList: orderSaleListSearch));
      } else {
        emit(OrderSaleGetListLoadedState(orderList: orderSaleList));
      }
    });
  }

  void _getOrderSaleCard() {
    on<GetOrderSaleCardEvent>((event, emit) async {
      emit(OrderSaleRegisterLoadingState());
      final response = await getOrderSaleCard(event.orderid);

      var result = response.fold((l) => OrderSaleErrorState(l.toString()), (r) {
        return GetOrderSaleCardLoadedState(orderMain: r);
      });
      emit(result);
    });
  }

  void _returnToOrderSale() {
    on<ReturnToOrderSaleEvent>((event, emit) async {
      emit(ReturnToOrderSaleState());
    });
  }

  void _returnToAttendance() {
    on<ReturnToAttendanceEvent>((event, emit) async {
      emit(ReturnToAttendanceState());
    });
  }
}
