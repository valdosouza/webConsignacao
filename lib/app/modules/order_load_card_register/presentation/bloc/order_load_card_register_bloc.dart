import 'package:appweb/app/modules/order_load_card_register/data/model/order_load_card_items_model.dart';
import 'package:appweb/app/modules/order_load_card_register/data/model/order_load_card_main_model.dart';
import 'package:appweb/app/modules/order_load_card_register/domain/usecase/order_load_card_register_get_items.dart';
import 'package:appweb/app/modules/order_load_card_register/domain/usecase/order_loca_card_register_post.dart';
import 'package:appweb/app/modules/order_load_card_register/presentation/bloc/order_load_card_register_event.dart';
import 'package:appweb/app/modules/order_load_card_register/presentation/bloc/order_load_card_register_state.dart';
import 'package:bloc/bloc.dart';

class OrderLoadCardRegisterBloc
    extends Bloc<OrderLoadCardRegisterEvent, OrderLoadCardRegisterState> {
  final OrderLoadCardRegiterGetItems getItemsOrderLoadCard;
  final OrderLoadCardRegisterPost postOrderLoadCard;

  OrderLoadCardMainModel modelLoadCard = OrderLoadCardMainModel.isEmpty();

  OrderLoadCardRegisterBloc({
    required this.getItemsOrderLoadCard,
    required this.postOrderLoadCard,
  }) : super(OrderLoadCardRegisterLoadingState()) {
    orderLoadCardGetItems();
    orderLoadCardPost();
    clearOrderLoadCard();
  }

  orderLoadCardGetItems() {
    on<OrderLoadCardRegisterGetCardEvent>((event, emit) async {
      emit(OrderLoadCardRegisterLoadingState());

      modelLoadCard.items.clear();

      final response = await getItemsOrderLoadCard();

      var result = response.fold((l) {
        return OrderLoadCardGetItemsErrorState(l.toString());
      }, (r) {
        modelLoadCard.items = r;
        return OrderLoadCardGetItemsLoadedState();
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
}
