import 'package:appweb/app/modules/payment_type_register/data/model/payment_model.dart';
import 'package:appweb/app/modules/payment_type_register/domain/usecases/payment_type_add.dart';
import 'package:appweb/app/modules/payment_type_register/domain/usecases/payment_type_delete.dart';
import 'package:appweb/app/modules/payment_type_register/domain/usecases/payment_type_getlist.dart';
import 'package:appweb/app/modules/payment_type_register/domain/usecases/payment_type_put.dart';
import 'package:appweb/app/modules/payment_type_register/presentation/payment_type_bloc/payment_type_events.dart';
import 'package:bloc/bloc.dart';
import 'package:appweb/app/modules/payment_type_register/presentation/payment_type_bloc/payment_type_states.dart';

class PaymentTypeBloc extends Bloc<PaymentTypeEvent, PaymentTypeState> {
  final PaymentTypeGetlist getlistPaymentType;
  final PaymentTypeDelete deletePaymentType;
  final PaymentTypeAdd addPaymentType;
  final PaymentTypePut putPaymentType;

  late List<PaymentTypeModel> paymentTypeModel;

  PaymentTypeBloc(
      {required this.addPaymentType,
      required this.deletePaymentType,
      required this.getlistPaymentType,
      required this.putPaymentType})
      : super(PaymentInitialState()) {
    on<PaymentTypeGetlistEvent>((event, emit) async {
      final response = await getlistPaymentType
          .call(GetlistPaymentTypeParams(idInstitution: event.idInstitution));
      final result = response.fold((l) => PaymentGetlistErrorState(), (r) {
        paymentTypeModel = r;
        return PaymentGetlistSuccessEvent(payment: paymentTypeModel);
      });
      emit(result);
    });
    on<PaymentTypeAddEvent>((event, emit) async {
      final response = await addPaymentType
          .call(AddPaymentTypeParams(paymentTypeModel: event.paymentTypeModel));
      final result = response
          .fold((l) => PaymentAddErrorState(payment: paymentTypeModel), (r) {
        return PaymentAddSuccessState();
      });
      emit(result);
    });
    on<PaymentTypePutEvent>((event, emit) async {
      final response = await putPaymentType
          .call(PutPaymentTypeParams(paymentTypeModel: event.paymentTypeModel));
      final result = response
          .fold((l) => PaymentPutErrorState(payment: paymentTypeModel), (r) {
        return PaymentPutSuccessState();
      });
      emit(result);
    });
    on<PaymentTypeDeleteEvent>((event, emit) async {
      final response = await deletePaymentType
          .call(DeletePaymentTypeParams(idPaymentType: event.idPayment));
      final result = response
          .fold((l) => PaymentDeleteErrorState(payment: paymentTypeModel), (r) {
        paymentTypeModel
            .removeWhere((element) => element.id == event.idPayment);
        return PaymentDeleteErrorState(payment: paymentTypeModel);
      });
      emit(result);
    });
    on<PaymentTypeSearchEvent>((event, emit) async {
      String search = event.search.trim().toUpperCase();
      List<PaymentTypeModel> searchedPayments =
          paymentTypeModel.where((element) {
        bool containsSearchedPayment =
            element.description.trim().toUpperCase().contains(search);
        return containsSearchedPayment;
      }).toList();
      emit(PaymentSearchState(payment: searchedPayments));
    });
  }
}
