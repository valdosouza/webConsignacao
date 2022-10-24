import 'package:appweb/app/modules/payment/data/model/payment_model.dart';
import 'package:appweb/app/modules/payment/domain/usescases/payment_add.dart';
import 'package:appweb/app/modules/payment/domain/usescases/payment_delete.dart';
import 'package:appweb/app/modules/payment/domain/usescases/payment_getlist.dart';
import 'package:appweb/app/modules/payment/domain/usescases/payment_put.dart';
import 'package:bloc/bloc.dart';
import 'package:appweb/app/modules/payment/presentation/payment_bloc/payment_events.dart';
import 'package:appweb/app/modules/payment/presentation/payment_bloc/payment_states.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final PaymentGetlist getlistPayment;
  final PaymentDelete deletePayment;
  final PaymentAdd addPayment;
  final PaymentPut putPayment;

  late List<PaymentModel> paymentModel;

  PaymentBloc(
      {required this.addPayment,
      required this.deletePayment,
      required this.getlistPayment,
      required this.putPayment})
      : super(PaymentInitialState()) {
    on<PaymentGetlistEvent>((event, emit) async {
      final response = await getlistPayment
          .call(GetlistPaymentParams(idInstitution: event.idInstitution));
      final result = response.fold((l) => PaymentGetlistErrorState(), (r) {
        paymentModel = r;
        return PaymentGetlistSuccessEvent(payment: paymentModel);
      });
      emit(result);
    });
    on<PaymentAddEvent>((event, emit) async {
      final response = await addPayment.call(AddPaymentParams(paymentModel: event.paymentModel));
      final result = response.fold((l) => PaymentAddErrorState(payment: paymentModel), (r) {
        return PaymentAddSuccessState();
      });
      emit(result);
    });
    on<PaymentPutEvent>((event, emit) async {
      final response = await putPayment
          .call(PutPaymentParams(paymentModel: event.paymentModel));
      final result = response.fold((l) => PaymentPutErrorState(payment: paymentModel), (r) {
        return PaymentPutSuccessState();
      });
      emit(result);
    });
    on<PaymentDeleteEvent>((event, emit) async {
      final response = await deletePayment
          .call(DeletePaymentParams(idPayment: event.idPayment));
      final result = response.fold((l) => PaymentDeleteErrorState(payment: paymentModel), (r) {
        paymentModel.removeWhere((element) => element.id == event.idPayment);
        return PaymentDeleteErrorState(payment: paymentModel);
      });
      emit(result);
    });
    on<PaymentSearchEvent>((event, emit) async {
      String search = event.search.trim().toUpperCase();
      List<PaymentModel> searchedPayments = paymentModel.where((element) {
        bool containsSearchedPayment =
            element.description.trim().toUpperCase().contains(search);
        return containsSearchedPayment;
      }).toList();
      emit(PaymentSearchState(payment: searchedPayments));
    });
  }
}
