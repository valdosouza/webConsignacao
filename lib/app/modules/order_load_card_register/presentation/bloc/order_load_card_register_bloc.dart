import 'package:appweb/app/modules/order_load_card_register/data/model/order_load_card_items_model.dart';
import 'package:appweb/app/modules/order_load_card_register/data/model/order_load_card_main_model.dart';
import 'package:appweb/app/modules/order_load_card_register/domain/usecase/order_load_card_register_closure.dart';
import 'package:appweb/app/modules/order_load_card_register/domain/usecase/order_load_card_register_get_items.dart';
import 'package:appweb/app/modules/order_load_card_register/domain/usecase/order_load_card_register_get_list.dart';
import 'package:appweb/app/modules/order_load_card_register/domain/usecase/order_load_card_register_post.dart';
import 'package:appweb/app/modules/order_load_card_register/presentation/bloc/order_load_card_register_event.dart';
import 'package:appweb/app/modules/order_load_card_register/presentation/bloc/order_load_card_register_state.dart';
import 'package:bloc/bloc.dart';

class OrderLoadCardRegisterBloc
    extends Bloc<OrderLoadCardRegisterEvent, OrderLoadCardRegisterState> {
  final OrderLoadCardRegiterGetItems getItemsOrderLoadCard;
  final OrderLoadCardRegiterGetList getListOrderLoadCard;
  final OrderLoadCardRegisterPost postOrderLoadCard;
  final OrderLoadCardRegisterClosure closureOrderLoadCard;

  OrderLoadCardMainModel modelLoadCard = OrderLoadCardMainModel.isEmpty();
  List<OrderLoadCardMainModel> listLoadCard = [];

  OrderLoadCardRegisterBloc({
    required this.getItemsOrderLoadCard,
    required this.getListOrderLoadCard,
    required this.postOrderLoadCard,
    required this.closureOrderLoadCard,
  }) : super(OrderLoadCardRegisterLoadingState()) {
    orderLoadCardGetItems();
    orderLoadCardGetList();
    orderLoadCardPost();
    clearOrderLoadCard();
    closureOrder();
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
}
