import 'package:appweb/app/modules/Core/data/model/order_paid_model.dart';
import 'package:appweb/app/modules/order_attendence_register/data/models/order_attendance_model.dart';
import 'package:appweb/app/modules/order_sale_register/data/models/order_sale_main_card_model.dart';
import 'package:appweb/app/modules/order_sale_register/domain/usescases/order_sale_register_get_items.dart';
import 'package:appweb/app/modules/order_sale_register/domain/usescases/order_sale_register_post.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/bloc/order_sale_register_event.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/bloc/order_sale_register_state.dart';
import 'package:bloc/bloc.dart';

class OrderSaleRegisterBloc
    extends Bloc<OrderSaleRegisterEvent, OrderSaleRegisterState> {
  final GetNewOrderSaleCard getNewOrderSaleCard;
  final OrderSaleRegisterPost postOrderSale;

  late OrderAttendanceModel modelAttendance;
  OrderSaleMainCardModel modelOrderSale = OrderSaleMainCardModel.isEmpty();

  OrderSaleRegisterBloc({
    required this.getNewOrderSaleCard,
    required this.postOrderSale,
  }) : super(OrderSaleRegisterLoadingState()) {
    ordersaleGetItem();
    ordersalePost();
  }

  ordersaleGetItem() {
    on<OrderSaleRegisterGetItemsPreSaleEvent>((event, emit) async {
      emit(OrderSaleRegisterLoadingState());

      modelOrderSale.items = [];

      final response = await getNewOrderSaleCard(
        tbInstitutionId: event.tbInstitutionId,
        tbPriceListId: event.tbPriceListId,
      );

      var result = response
          .fold((l) => OrderSaleRegisterGetItemsErrorState(l.toString()), (r) {
        modelOrderSale.items = r;
        if (modelAttendance.tbPriceListId == 2) {
          modelOrderSale.payments.add(
            OrderPaidModel(
              tbPaymentTypeId: 2,
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
        return OrderSaleRegisterGetItemsPreSaleLoadedState(
            model: modelOrderSale);
      });
      emit(result);
    });
  }

  ordersalePost() {
    on<OrderSaleRegisterPostEvent>((event, emit) async {
      emit(OrderSaleRegisterLoadingState());
      event.model.order.id = modelAttendance.id;
      event.model.order.tbInstitutionId = modelAttendance.tbInstitutionId;
      event.model.order.dtRecord = modelAttendance.dtRecord;
      final response = await postOrderSale(event.model);
      var result = response.fold(
          (l) => OrderSaleRegisterPostErrorState(error: l.toString()), (r) {
        modelOrderSale = r;
        return OrderSaleRegisterPostSucessState(ordermodel: modelOrderSale);
      });
      emit(result);
    });
  }

  clearOrderSale() {
    on<OrderSaleRegisterClearEvent>((event, emit) async {
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
    });
  }
}
