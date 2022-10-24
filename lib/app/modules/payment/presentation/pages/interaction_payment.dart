import 'package:appweb/app/modules/payment/presentation/payment_bloc/payment_events.dart';
import 'package:flutter/material.dart';

import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/core/shared/widgets/custom_input.dart';
import 'package:appweb/app/modules/payment/data/model/payment_model.dart';
import 'package:appweb/app/modules/payment/presentation/payment_bloc/payment_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class InteractionPayment extends StatefulWidget {
  final PaymentModel? payment;
  const InteractionPayment({
    Key? key,
    required this.payment,
  }) : super(key: key);

  @override
  State<InteractionPayment> createState() => _InteractionPaymentState();
}

class _InteractionPaymentState extends State<InteractionPayment> {
  bool selectRadio = false;
  bool selectMain = false;
  PaymentModel? paymentModel;
  late PaymentBloc bloc;
  @override
  void initState() {
    bloc = Modular.get<PaymentBloc>();
    if (widget.payment?.active != null) {
      description = widget.payment!.description;
      active = selectRadio = widget.payment!.active;
    }
    paymentModel = widget.payment;

    super.initState();
  }

  String description = "";
  bool active = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bloc.add(PaymentGetlistEvent(idInstitution: 1));
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: paymentModel == null
              ? const Text('Adicionar')
              : const Text('Editar'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Modular.to.pop();
              bloc.add(PaymentGetlistEvent(idInstitution: 1));
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.check),
              onPressed: () {
                if (paymentModel != null) {
                  if (description.isEmpty) {
                    CustomToast.showToast("Campo descrição é obrigatório.");
                  } else {
                    paymentModel = paymentModel!
                        .copyWith(description: description, active: active);
                    bloc.add(PaymentPutEvent(paymentModel: paymentModel!));
                  }
                } else {
                  if (description.isEmpty) {
                    CustomToast.showToast("Campo descrição é obrigatório.");
                  } else {
                    bloc.add(
                      PaymentAddEvent(
                        paymentModel: PaymentModel(
                          id: 0,
                          idInstitution: bloc.state.payment.last.idInstitution,
                          description: description,
                          active: active,
                        ),
                      ),
                    );
                  }
                }
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomInput(
                title: 'Descrição',
                initialValue: paymentModel?.description ?? "",
                keyboardType: TextInputType.number,
                inputAction: TextInputAction.next,
                onChanged: (value) {
                  description = value;
                },
              ),
              const SizedBox(height: 30.0),
              const Text("Ativo", style: kLabelStyle),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  Row(
                    children: [
                      Radio(
                        value: true,
                        groupValue: selectRadio,
                        activeColor: Colors.red,
                        onChanged: selectRadio
                            ? (value) {}
                            : (value) {
                                setState(() {
                                  selectRadio = true;
                                });
                                active = true;
                              },
                      ),
                      const SizedBox(width: 5.0),
                      const Text("Sim", style: kLabelStyle),
                    ],
                  ),
                  const SizedBox(width: 10.0),
                  Row(
                    children: [
                      Radio(
                          value: false,
                          groupValue: selectRadio,
                          activeColor: Colors.red,
                          onChanged: selectRadio
                              ? (value) {
                                  setState(() {
                                    selectRadio = false;
                                  });
                                  active = false;
                                }
                              : (value) {}),
                      const SizedBox(width: 5.0),
                      const Text("Não", style: kLabelStyle),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
