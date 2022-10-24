import 'package:appweb/app/modules/payment_type_register/data/model/payment_model.dart';
import 'package:appweb/app/modules/payment_type_register/presentation/payment_type_bloc/payment_type_bloc.dart';
import 'package:appweb/app/modules/payment_type_register/presentation/payment_type_bloc/payment_type_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ListPaymentType extends StatefulWidget {
  final List<PaymentTypeModel> paymentMethods;
  final bool checkBoxNoActive;

  const ListPaymentType(
      {required this.paymentMethods,
      required this.checkBoxNoActive,
      super.key});

  @override
  State<ListPaymentType> createState() => _ListPaymentTypeState();
}

class _ListPaymentTypeState extends State<ListPaymentType> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: widget.paymentMethods.length,
      itemBuilder: (context, index) {
        bool checkActiveShow =
            !widget.paymentMethods[index].active && widget.checkBoxNoActive;
        if (widget.paymentMethods[index].active || checkActiveShow) {
          return InkWell(
            onTap: () {
              Modular.to.pushNamed('/paymenttype/interaction/',
                  arguments: widget.paymentMethods[index]);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
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
                  widget.paymentMethods[index].active
                      ? TextButton(
                          onPressed: () => Modular.get<PaymentTypeBloc>().add(
                              PaymentTypeDeleteEvent(
                                  idPayment: widget.paymentMethods[index].id)),
                          child: const Text("Excluir"))
                      : const SizedBox(width: 60)
                ],
              ),
            ),
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
}
