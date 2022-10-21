import 'package:appweb/app/modules/payment/data/model/payment_model.dart';
import 'package:appweb/app/modules/payment/presentation/payment_cubit/payment_cubit.dart';
import 'package:appweb/app/modules/payment/presentation/payment_cubit/payment_events.dart';
import 'package:appweb/app/modules/payment/presentation/payment_cubit/payment_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ContentPaymentMobile extends StatefulWidget {
  const ContentPaymentMobile({super.key});

  @override
  State<ContentPaymentMobile> createState() => _ContentPaymentMobileState();
}

class _ContentPaymentMobileState extends State<ContentPaymentMobile> {
  late PaymentCubit paymentCubit;
  late List<PaymentModel> paymentMethods;

  @override
  void initState() {
    paymentCubit = Modular.get<PaymentCubit>();
    Modular.get<PaymentEventsImpl>().getAllPayments();
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
            onPressed: () => _dialogBuilder(context),
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
                      onChanged: search,
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
            child: BlocBuilder<PaymentCubit, PaymentState>(
              bloc: paymentCubit,
              builder: (context, state) {
                if (state is PaymentLoadedState) {
                  if ((state is! PaymentSearchState)) {
                    paymentMethods = state.paymentMethods.toList();
                  }
                  PaymentLoadedState paymentLoaded = state;
                  return ListView.separated(
                    itemCount: paymentLoaded.paymentMethods.length,
                    itemBuilder: (context, index) {
                      bool checkActiveShow =
                          !paymentLoaded.paymentMethods[index].active &&
                              checkBoxNoActive;
                      if (paymentLoaded.paymentMethods[index].active ||
                          checkActiveShow) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: 100,
                                child: Text(
                                    paymentLoaded.paymentMethods[index].id)),
                            SizedBox(
                                width: 100,
                                child: Text(paymentLoaded
                                    .paymentMethods[index].description)),
                            SizedBox(
                                width: 100,
                                child: Text(
                                    paymentLoaded.paymentMethods[index].active
                                        ? 'Sim'
                                        : 'Não')),
                            paymentLoaded.paymentMethods[index].active
                                ? TextButton(
                                    onPressed: () => deletePayment(
                                        paymentLoaded.paymentMethods[index]),
                                    child: const Text("Excluir"))
                                : const SizedBox(width: 60)
                          ],
                        );
                      }
                      return const SizedBox.shrink();
                    },
                    separatorBuilder: (context, index) {
                      bool checkActiveShow =
                          !paymentLoaded.paymentMethods[index].active &&
                              checkBoxNoActive;
                      if (paymentLoaded.paymentMethods[index].active ||
                          checkActiveShow) {
                        return const Divider();
                      }
                      return const SizedBox.shrink();
                    },
                  );
                }

                if (state is PaymentErrorState) {
                  _dialogBuilderError(context, state.error);
                }

                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    TextEditingController controllerDescriptionNameToPayment =
        TextEditingController();
    GlobalKey<FormState> stateToPaymentDescription = GlobalKey<FormState>();
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Adicionar método de pagamento'),
          content: Form(
            key: stateToPaymentDescription,
            child: TextFormField(
              controller: controllerDescriptionNameToPayment,
              decoration: const InputDecoration(
                hintText: 'Descrição',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Descrição não pode ser vazia';
                }
                return null;
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Confirmar'),
              onPressed: () {
                if (stateToPaymentDescription.currentState!.validate()) {
                  createPayment(controllerDescriptionNameToPayment.text);
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _dialogBuilderError(BuildContext context, String messageError) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Row(children: const [
              Text("Erro"),
              Icon(Icons.warning),
            ]),
            content: Text(messageError));
      },
    );
  }

  createPayment(String description) {
    Modular.get<PaymentEvents>().addPayment(description: description);
  }

  deletePayment(PaymentModel payment) {
    PaymentModel deletePayment = payment.copyWith(active: !payment.active);
    Modular.get<PaymentEvents>().deletePayment(paymentModel: deletePayment);
  }

  search(String value) {
    final List<PaymentModel> paymentMethodsSearched = paymentMethods
        .where((element) =>
            element.description.toUpperCase().contains(value.toUpperCase()))
        .toList();

    paymentCubit.search(paymentMethodsSearched);
  }
}
