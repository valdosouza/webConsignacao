import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/modules/payment/presentation/content/widgets/list_payment.dart';
import 'package:appweb/app/modules/payment/presentation/payment_bloc/payment_bloc.dart';
import 'package:appweb/app/modules/payment/presentation/payment_bloc/payment_events.dart';
import 'package:appweb/app/modules/payment/presentation/payment_bloc/payment_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ContentPaymentTablet extends StatefulWidget {
  const ContentPaymentTablet({super.key});

  @override
  State<ContentPaymentTablet> createState() => _ContentPaymentTabletState();
}

class _ContentPaymentTabletState extends State<ContentPaymentTablet> {
  late PaymentBloc paymentBloc;

  @override
  void initState() {
    paymentBloc = Modular.get<PaymentBloc>();
    super.initState();
  }

  TextEditingController controllerSearchDescription = TextEditingController();
  bool checkBoxNoActive = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Métodos de Pagamento"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => Modular.to
                .pushNamed('/paymenttype/interaction/', arguments: null),
          )
        ],
      ),
      body: Column(
        children: [
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 2,
                  child: TextFormField(
                      controller: controllerSearchDescription,
                      onChanged: (value) =>
                          paymentBloc.add(PaymentSearchEvent(search: value)),
                      decoration: const InputDecoration(
                        hintText: 'Pesquisar',
                      )),
                ),
                Flexible(
                  flex: 1,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        activeColor: Colors.red,
                        value: checkBoxNoActive,
                        onChanged: (bool? value) {
                          setState(() {
                            checkBoxNoActive = value!;
                          });
                        },
                      ),
                      const Text("Desativados")
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: BlocConsumer<PaymentBloc, PaymentState>(
                bloc: paymentBloc,
                listener: (context, state) {
                  if (state is PaymentDeleteSuccessState) {
                    CustomToast.showToast(
                        "Método de pagamento removido com sucesso.");
                  } else if (state is PaymentDeleteErrorState) {
                    CustomToast.showToast(
                        "Erro ao remover o método de pagamento. Tente novamente mais tarde.");
                  } else if (state is PaymentAddSuccessState) {
                    CustomToast.showToast(
                        "Método de pagamento adicionado com sucesso");
                    paymentBloc.add(PaymentGetlistEvent(idInstitution: 1));
                  } else if (state is PaymentAddErrorState) {
                    CustomToast.showToast(
                        "Erro ao adicionar o método de pagamento. Tente novamente mais tarde.");
                  } else if (state is PaymentPutSuccessState) {
                    CustomToast.showToast(
                        "Método de pagamento editado com sucesso");
                    paymentBloc.add(PaymentGetlistEvent(idInstitution: 1));
                  } else if (state is PaymentPutErrorState) {
                    CustomToast.showToast(
                        "Erro ao editar o método de pagamento. Tente novamente mais tarde.");
                  }
                },
                builder: (context, state) {
                  if (state is PaymentInitialState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListPayment(
                      paymentMethods: state.payment,
                      checkBoxNoActive: checkBoxNoActive);
                }),
          ),
        ],
      ),
    );
  }
}
