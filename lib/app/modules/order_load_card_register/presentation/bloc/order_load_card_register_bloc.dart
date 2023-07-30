import 'package:appweb/app/core/shared/utils/custom_date.dart';
import 'package:appweb/app/modules/order_load_card_register/data/model/order_load_card_items_model.dart';
import 'package:appweb/app/modules/order_load_card_register/data/model/order_load_card_main_model.dart';
import 'package:appweb/app/modules/order_load_card_register/domain/usecase/order_load_card_register_closure.dart';
import 'package:appweb/app/modules/order_load_card_register/domain/usecase/order_load_card_register_get.dart';
import 'package:appweb/app/modules/order_load_card_register/domain/usecase/order_load_card_register_get_items.dart';
import 'package:appweb/app/modules/order_load_card_register/domain/usecase/order_load_card_register_get_list.dart';
import 'package:appweb/app/modules/order_load_card_register/domain/usecase/order_load_card_register_get_list_by_user.dart';
import 'package:appweb/app/modules/order_load_card_register/domain/usecase/order_load_card_register_post.dart';
import 'package:appweb/app/modules/order_load_card_register/presentation/bloc/order_load_card_register_event.dart';
import 'package:appweb/app/modules/order_load_card_register/presentation/bloc/order_load_card_register_state.dart';
import 'package:bloc/bloc.dart';

class OrderLoadCardRegisterBloc
    extends Bloc<OrderLoadCardRegisterEvent, OrderLoadCardRegisterState> {
  final OrderLoadCardRegiterGetItems getItemsOrderLoadCard;
  final OrderLoadCardRegiterGetList getListOrderLoadCard;
  final OrderLoadCardRegiterGetListByUser getListByUserOrderLoadCard;
  final OrderLoadCardRegisterPost postOrderLoadCard;
  final OrderLoadCardRegisterClosure closureOrderLoadCard;
  final OrderLoadCardRegiterGet getByOrderLoadCard;

  OrderLoadCardMainModel modelLoadCard = OrderLoadCardMainModel.isEmpty();
  List<OrderLoadCardMainModel> listLoadCard = [];
  String dateSelected = CustomDate.newDate();
  OrderLoadCardRegisterBloc({
    required this.getItemsOrderLoadCard,
    required this.getListOrderLoadCard,
    required this.postOrderLoadCard,
    required this.closureOrderLoadCard,
    required this.getListByUserOrderLoadCard,
    required this.getByOrderLoadCard,
  }) : super(OrderLoadCardRegisterLoadingState()) {
    orderLoadCardGetItems();
    orderLoadCardGetList();
    orderLoadCardGetListByUser();
    orderLoadCardPost();
    clearOrderLoadCard();
    closureOrder();
    getOrderLoadCard();
    returnToOrderLoadCard();
  }

  orderLoadCardGetItems() {
    on<OrderLoadCardRegisterGetCardEvent>((event, emit) async {
      emit(OrderLoadCardRegisterLoadingState());

      modelLoadCard.items.clear();

      final response =
          await getItemsOrderLoadCard(tbSalesmanId: event.tbSalesmanId);

      var result = response.fold((l) {
        return OrderLoadCardGetItemsErrorState(l.toString());
      }, (r) {
        modelLoadCard.items = r;
        return OrderLoadCardGetItemsLoadedState();
      });
      emit(result);
    });
  }

  orderLoadCardGetList() {
    on<OrderLoadCardRegisterGetListCardEvent>((event, emit) async {
      emit(OrderLoadCardRegisterLoadingState());

      listLoadCard = [];

      final response = await getListOrderLoadCard();

      var result = response.fold((l) {
        return OrderLoadCardGetListErrorState(l.toString());
      }, (r) {
        listLoadCard = r;
        return OrderLoadCardGetListLoadedState();
      });
      emit(result);
    });
  }

  orderLoadCardGetListByUser() {
    on<GetListByUserEvent>((event, emit) async {
      emit(OrderLoadCardRegisterLoadingState());

      final response = await getListByUserOrderLoadCard();

      var result = response.fold((l) {
        return GetListByUserErrorState(l.toString());
      }, (r) {
        return GetListByUserLoadedState(orderList: r);
      });
      emit(result);
    });
  }

  orderLoadCardPost() {
    on<OrderLoadCardPostEvent>((event, emit) async {
      emit(OrderLoadCardRegisterLoadingState());

      final response = await postOrderLoadCard(modelLoadCard);
      var result = response.fold((l) {
        return OrderLoadCardPostErrorState(error: l.toString());
      }, (r) {
        return OrderLoadCardCardPostSucessState();
      });
      emit(result);
    });
  }

  clearOrderLoadCard() {
    on<OrderLoadCardRegisterClearEvent>((event, emit) async {
      emit(OrderLoadCardRegisterLoadingState());
      for (OrderLoadCardItemsModel item in modelLoadCard.items) {
        item.adjust = 0;
        item.newLoad = 0;
      }
      emit(OrderLoadCardRegisterCleanDoneState());
    });
  }

  closureOrder() {
    on<OrderClosureEvent>((event, emit) async {
      emit(OrderLoadCardRegisterLoadingState());

      var response = await closureOrderLoadCard
          .call(ParamsOrderLoadCardClosure(model: modelLoadCard));

      response.fold((l) {
        emit(OrderClosureErrorState(error: l.toString()));
      }, (r) {
        listLoadCard.removeWhere((item) => item.id == modelLoadCard.id);
        emit(OrderClosureSuccessState(msg: r));
      });
    });
  }

  getOrderLoadCard() {
    on<GetOrderLoadCard>((event, emit) async {
      emit(OrderLoadCardRegisterLoadingState());

      final response = await getByOrderLoadCard(orderId: event.orderId);

      var result =
          response.fold((l) => OrderLoadCardGetErrorState(l.toString()), (r) {
        return OrderLoadCardGetLoadedState(orderLoadCard: r);
      });
      emit(result);
    });
  }

  returnToOrderLoadCard() {
    on<ReturnToLoadCardEvent>((event, emit) async {
      emit(ReturnToLoadCardState());
    });
  }
}
