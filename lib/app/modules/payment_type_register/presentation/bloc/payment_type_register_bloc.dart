import 'package:appweb/app/modules/payment_type_register/data/model/payment_type_model.dart';
import 'package:appweb/app/modules/payment_type_register/domain/usecase/payment_type_register_delete.dart';
import 'package:appweb/app/modules/payment_type_register/domain/usecase/payment_type_register_getlist.dart';
import 'package:appweb/app/modules/payment_type_register/domain/usecase/payment_type_register_post.dart';
import 'package:appweb/app/modules/payment_type_register/domain/usecase/payment_type_register_put.dart';
import 'package:appweb/app/modules/payment_type_register/presentation/bloc/payment_type_register_events.dart';
import 'package:appweb/app/modules/payment_type_register/presentation/bloc/payment_type_register_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentTypeRegisterBloc
    extends Bloc<PaymentTypeRegisterEvent, PaymentTypeRegisterState> {
  final PaymentTypeRegisterGetlist getlist;
  final PaymentTypeRegisterPost post;
  final PaymentTypeRegisterPut put;
  final PaymentTypeRegisterDelete delete;

  List<PaymentTypeModel> prices = [];

  PaymentTypeRegisterBloc({
    required this.getlist,
    required this.post,
    required this.put,
    required this.delete,
  }) : super(PaymentTypeRegisterLoadingState()) {
    getList();

    searchPrices();

    goToInfoPage();

    addFunction();

    editFunction();
  }

  getList() {
    on<PaymentTypeRegisterGetListEvent>((event, emit) async {
      emit(PaymentTypeRegisterLoadingState());

      var response =
          await getlist.call(ParamsPaymentTypeRegisterGet(institutionId: 1));

      var result = response
          .fold((l) => PaymentTypeRegisterErrorState(list: prices), (r) {
        prices = r;
        return PaymentTypeRegisterLoadedState(list: r);
      });

      emit(result);
    });
  }

  searchPrices() {
    on<PaymentTypeRegisterSearchEvent>((event, emit) async {
      if (event.search.isNotEmpty) {
        var priceSearched = prices.where((element) {
          String name = element.description;
          return name
              .toLowerCase()
              .trim()
              .contains(event.search.toLowerCase().trim());
        }).toList();
        emit(PaymentTypeRegisterLoadedState(list: priceSearched));
      } else {
        emit(PaymentTypeRegisterLoadedState(list: prices));
      }
    });
  }

  goToInfoPage() {
    on<PaymentTypeRegisterInfoEvent>((event, emit) async {
      emit(PaymentTypeRegisterInfoPageState(list: prices, model: event.model));
    });
  }

  addFunction() {
    on<PaymentTypeRegisterPostEvent>((event, emit) async {
      PaymentTypeRegisterLoadingState();
      var response = await post.call(ParamsPaymentTypePost(model: event.model));

      var result = response.fold(
        (l) => PaymentTypeRegisterAddErrorState(list: prices),
        (r) {
          prices.add(r);
          return PaymentTypeRegisterAddSuccessState(list: prices);
        },
      );
      emit(result);
    });
  }

  editFunction() {
    on<PaymentTypeRegisterPutEvent>((event, emit) async {
      PaymentTypeRegisterLoadingState();
      var response = await put.call(ParamsPaymentTypePut(model: event.model));

      var result = response.fold(
        (l) => PaymentTypeRegisterEditErrorState(list: prices),
        (r) {
          return PaymentTypeRegisterEditSuccessState(list: prices);
        },
      );
      emit(result);
    });
  }
}
