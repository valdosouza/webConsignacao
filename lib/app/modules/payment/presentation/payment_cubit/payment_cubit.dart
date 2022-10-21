import 'package:appweb/app/modules/payment/presentation/payment_cubit/payment_state.dart';
import 'package:bloc/bloc.dart';

import '../../data/model/payment_model.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());

  loading() {
    emit(PaymentLoadingState());
  }

  loaded(List<PaymentModel> paymentMethods) {
    emit(PaymentLoadedState(paymentMethods));
  }
  
  search(List<PaymentModel> paymentMethods) {
    emit(PaymentSearchState(paymentMethods));
  }

  success() {
    emit(PaymentSuccessState());
  }

  error(error) {
    emit(PaymentErrorState(error));
  }
}
