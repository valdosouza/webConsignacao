import 'package:appweb/app/modules/payment/presentation/payment_cubit/payment_cubit.dart';
import 'package:appweb/app/modules/payment/data/datasource/payment_datasource.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../data/model/payment_model.dart';

abstract class PaymentEvents {
  addPayment({required String description});
  deletePayment({required PaymentModel paymentModel});
  getAllPayments();
}

class PaymentEventsImpl implements PaymentEvents {
   
  @override
  addPayment({required String description}) async {
    PaymentDataSource paymentDataSource = PaymentDataSourceImpl();

    try {
      await paymentDataSource.postItem(description: description, idInstitution: 1);
      Modular.get<PaymentCubit>().success();
    } catch (e) {
      Modular.get<PaymentCubit>().error("Erro ao criar método de pagamento.");
    } finally {
      getAllPayments();
    }
  }

  @override
  getAllPayments() async {
     PaymentDataSource paymentDataSource = PaymentDataSourceImpl();
    try {
      Modular.get<PaymentCubit>().loading();
      List<PaymentModel> paymentsMethods = await paymentDataSource.getlist(idInstitution: 1);
      Modular.get<PaymentCubit>().loaded(paymentsMethods);
    } catch (e) {
      Modular.get<PaymentCubit>().error("Não foi possível achar nenhum método de pagamento.");
    }
  }

  @override
  deletePayment({required PaymentModel paymentModel}) async {
        PaymentDataSource paymentDataSource = PaymentDataSourceImpl();

    try {
      await paymentDataSource.deleteItem(paymentModel: paymentModel);
      Modular.get<PaymentCubit>().success();
    } catch (e) {
      Modular.get<PaymentCubit>().error("Erro ao excluir método de pagamento.");
    }
    finally{
      getAllPayments();
    }
  }
}
