import 'package:appweb/app/modules/payment/data/model/payment_model.dart';
import 'package:appweb/app/modules/payment/presentation/payment_bloc/payment_bloc.dart';
import 'package:appweb/app/modules/payment/presentation/payment_bloc/payment_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ListPayment extends StatefulWidget {
  final List<PaymentModel> paymentMethods;
  final bool checkBoxNoActive;

  const ListPayment(
      {required this.paymentMethods,
      required this.checkBoxNoActive,
      super.key});

  @override
  State<ListPayment> createState() => _ListPaymentState();
}

class _ListPaymentState extends State<ListPayment> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: widget.paymentMethods.length,
      itemBuilder: (context, index) {
        bool checkActiveShow =
            !widget.paymentMethods[index].active && widget.checkBoxNoActive;
        if (widget.paymentMethods[index].active || checkActiveShow) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  width: 100,
                  child: Text(widget.paymentMethods[index].id.toString())),
              SizedBox(
                  width: 100,
                  child: Text(widget.paymentMethods[index].description)),
              SizedBox(
                  width: 100,
                  child: Text(
                      widget.paymentMethods[index].active ? 'Sim' : 'Não')),
              SizedBox(
                width: 100,
                child: TextButton(
                onPressed: () {
                  _dialogBuilder(context, widget.paymentMethods[index]);
                },  
                  child: const Text("Atualizar"),)
              ),
              widget.paymentMethods[index].active
                  ? TextButton(
                      onPressed: () => Modular.get<PaymentBloc>().add(PaymentDeleteEvent(
                          idPayment: widget.paymentMethods[index].id)),
                      child: const Text("Excluir"))
                  : const SizedBox(width: 60)
            ],
          );
        }
        return const SizedBox.shrink();
      },
      separatorBuilder: (context, index) {
        bool checkActiveShow =
            !widget.paymentMethods[index].active && widget.checkBoxNoActive;
        if (widget.paymentMethods[index].active || checkActiveShow) {
          return const Divider();
        }
        return const SizedBox.shrink();
      },
    );
  }
    Future<void> _dialogBuilder(BuildContext context, PaymentModel payment) {
    TextEditingController controllerDescriptionNameToPayment =
        TextEditingController();
        controllerDescriptionNameToPayment.text = payment.description;
    GlobalKey<FormState> stateToPaymentDescription = GlobalKey<FormState>();
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Atualizar método de pagamento'),
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
                  Modular.get<PaymentBloc>().add(
                    PaymentPutEvent(paymentModel: payment.copyWith(description: controllerDescriptionNameToPayment.text))
                  );
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }
}
