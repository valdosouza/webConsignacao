import 'package:appweb/app/modules/payment/data/model/payment_model.dart';
import 'package:equatable/equatable.dart';

abstract class PaymentState extends Equatable {
  const PaymentState();
}

class PaymentInitial extends PaymentState {
  @override
  List<Object> get props => [];
}

class PaymentLoadingState extends PaymentState {
  @override
  List<Object> get props => [];
}

class PaymentLoadedState extends PaymentState {
  final List<PaymentModel> paymentMethods;

  const PaymentLoadedState(this.paymentMethods);

  @override
  List<Object> get props => [paymentMethods];
}
class PaymentSearchState extends PaymentLoadedState {

  const PaymentSearchState(super.paymentMethods);

  @override
  List<Object> get props => [super.paymentMethods];
}

class PaymentSuccessState extends PaymentState {
  @override
  List<Object> get props => [];
}

class PaymentLogoutState extends PaymentState {
  @override
  List<Object> get props => [];
}

class PaymentErrorState extends PaymentState {
  final String error;

  const PaymentErrorState(this.error);

  @override
  List<Object> get props => [error];
}
