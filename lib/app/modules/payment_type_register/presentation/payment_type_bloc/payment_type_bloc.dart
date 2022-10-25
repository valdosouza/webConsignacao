import 'package:appweb/app/modules/payment_type_register/data/model/payment_type_model.dart';
import 'package:appweb/app/modules/payment_type_register/domain/usecases/payment_type_post.dart';
import 'package:appweb/app/modules/payment_type_register/domain/usecases/payment_type_delete.dart';
import 'package:appweb/app/modules/payment_type_register/domain/usecases/payment_type_getlist.dart';
import 'package:appweb/app/modules/payment_type_register/domain/usecases/payment_type_put.dart';
import 'package:appweb/app/modules/payment_type_register/presentation/payment_type_bloc/payment_type_events.dart';
import 'package:appweb/app/modules/payment_type_register/presentation/payment_type_bloc/payment_type_states.dart';

import 'package:bloc/bloc.dart';

class PaymentTypeBloc extends Bloc<PaymentTypeEvent, PaymentTypeState> {
  final PaymentTypeGetlist getlist;
  final PaymentTypeDelete delete;
  final PaymentTypePost post;
  final PaymentTypePut put;

  List<PaymentTypeModel> list = [];

  PaymentTypeBloc({
    required this.getlist,
    required this.delete,
    required this.post,
    required this.put,
  }) : super(PaymentTypeInitialState()) {
    on<LoadPaymentTypeEvent>((event, emit) async {
      PaymentTypeInitialState();
      var response = await getlist.call(const Params(institutionId: 1));
      var result = response.fold(
        (l) => PaymentTypeErrorState(),
        (r) {
          list = r;
          return PaymentTypeSuccessState(paymentTypeList: r);
        },
      );
      emit(result);
    });

    on<SearchPaymentTypeEvent>((event, emit) async {
      if (event.search.isNotEmpty) {
        var clienstSearched = list.where((element) {
          String name = element.description;
          return name
              .toLowerCase()
              .trim()
              .contains(event.search.toLowerCase().trim());
        }).toList();
        if (clienstSearched.isEmpty) {}
        emit(PaymentTypeSuccessState(paymentTypeList: clienstSearched));
      } else {
        emit(PaymentTypeSuccessState(paymentTypeList: list));
      }
    });

    on<DeletePaymentTypeEvent>((event, emit) async {
      PaymentTypeInitialState();
      var response = await delete
          .call(DeletePayamentTypeParams(paymentTypeId: event.paymentId));
      var result = response.fold(
        (l) => PaymentTypeDeleteErrorState(paymentTypeList: list),
        (r) {
          list.removeWhere((element) => element.id == event.paymentId);
          return PaymentTypeDeleteSuccessState(paymentTypeList: list);
        },
      );
      emit(result);
    });

    on<PaymentTypeInterationEvent>((event, emit) async {
      emit(PaymentTypeInterationPageState(
          paymentTypeList: list, paymentType: event.paymentType));
    });

    on<AddPaymentTypeEvent>((event, emit) async {
      PaymentTypeInitialState();
      var response = await post
          .call(PostPaymentTypeParams(paymentTypeId: event.paymentType));
      var result = response.fold(
        (l) => PaymentTypeAddErrorState(paymentTypeList: list),
        (r) => PaymentTypeAddSuccessState(
          paymentTypeList: list,
        ),
      );
      emit(result);
    });

    on<EditPaymentTypeEvent>((event, emit) async {
      PaymentTypeInitialState();
      var response =
          await put.call(PutPaymentTypeParams(paymentType: event.paymentType));
      var result = response.fold(
        (l) => PaymentTypePutErrorState(paymentTypeList: list),
        (r) => PaymentTypePutErrorState(paymentTypeList: list),
      );
      emit(result);
    });
  }
}
