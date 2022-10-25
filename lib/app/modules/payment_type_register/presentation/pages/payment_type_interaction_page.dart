import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/core/shared/widgets/custom_input.dart';
import 'package:appweb/app/modules/payment_type_register/data/model/payment_type_model.dart';
import 'package:appweb/app/modules/payment_type_register/presentation/payment_type_bloc/payment_type_bloc.dart';
import 'package:appweb/app/modules/payment_type_register/presentation/payment_type_bloc/payment_type_events.dart';
import 'package:flutter/material.dart';

class PaymentTypeInteractionPage extends StatefulWidget {
  final PaymentTypeBloc bloc;
  final PaymentTypeModel? paymentType;
  const PaymentTypeInteractionPage({
    super.key,
    required this.bloc,
    this.paymentType,
  });

  @override
  State<PaymentTypeInteractionPage> createState() =>
      PaymentTypetInterationPageState();
}

class PaymentTypetInterationPageState
    extends State<PaymentTypeInteractionPage> {
  bool selectRadio = false;
  bool selectMain = false;
  PaymentTypeModel? paymentType;

  @override
  void initState() {
    if (widget.paymentType?.active != null) {
      selectRadio = widget.paymentType!.active == "S";
    }
    paymentType = widget.paymentType;

    super.initState();
  }

  String descripton = "";
  String active = "N";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        widget.bloc.add(LoadPaymentTypeEvent());
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: paymentType == null
              ? const Text('Adicionar')
              : const Text('Editar'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              widget.bloc.add(LoadPaymentTypeEvent());
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.check),
              onPressed: () {
                if (paymentType != null) {
                  if (paymentType!.description.isEmpty) {
                    CustomToast.showToast("Campo descrição é obrigatório.");
                  } else {
                    widget.bloc
                        .add(EditPaymentTypeEvent(paymentType: paymentType!));
                  }
                } else {
                  if (descripton.isEmpty) {
                    CustomToast.showToast("Campo descrição é obrigatório.");
                  } else {
                    widget.bloc.add(
                      AddPaymentTypeEvent(
                        paymentType: PaymentTypeModel(
                          id: (widget.bloc.state.paymentTypeList.last.id + 1),
                          institution: widget
                              .bloc.state.paymentTypeList.last.institution,
                          description: descripton,
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
                initialValue: paymentType?.description ?? "",
                keyboardType: TextInputType.number,
                inputAction: TextInputAction.next,
                onChanged: (value) {
                  paymentType?.description = value;
                  descripton = value;
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
                                paymentType?.active = "S";
                                active = "S";
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
                                  paymentType?.active = "N";
                                  active = "N";
                                }
                              : (value) {}),
                      const SizedBox(width: 5.0),
                      const Text("Não", style: kLabelStyle),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30.0),
            ],
          ),
        ),
      ),
    );
  }
}
