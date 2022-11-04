import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/validators.dart';
import 'package:appweb/app/core/shared/widgets/custom_input.dart';
import 'package:appweb/app/modules/payment_type_register/data/model/payment_type_model.dart';
import 'package:appweb/app/modules/payment_type_register/presentation/bloc/payment_type_register_bloc.dart';
import 'package:appweb/app/modules/payment_type_register/presentation/bloc/payment_type_register_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PaymentTypeRegisterInterationPage extends StatefulWidget {
  final PaymentTypeModel? model;
  final int index;
  const PaymentTypeRegisterInterationPage(
      {super.key, this.model, required this.index});

  @override
  State<PaymentTypeRegisterInterationPage> createState() =>
      _PaymentTypeRegisterInterationPageState();
}

class _PaymentTypeRegisterInterationPageState
    extends State<PaymentTypeRegisterInterationPage> {
  late final PaymentTypeRegisterBloc bloc;
  PaymentTypeModel? model;
  final _formKey = GlobalKey<FormState>();

  bool selectRadio = false;

  String description = "";
  String active = "S";

  @override
  void initState() {
    super.initState();
    bloc = Modular.get<PaymentTypeRegisterBloc>();
    model = widget.model;
    if (model != null) {
      selectRadio = model!.active == "S";
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bloc.add(PaymentTypeRegisterGetListEvent());
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: model == null
              ? const Text('Adicionar')
              : Text('Editar ${model!.description}'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              bloc.add(PaymentTypeRegisterGetListEvent());
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                icon: const Icon(Icons.check),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    model != null
                        ? bloc.add(PaymentTypeRegisterPutEvent(model: model!))
                        : bloc.add(PaymentTypeRegisterPutEvent(
                            model: PaymentTypeModel(
                            id: widget.index + 1,
                            tbInstitutionId: 1,
                            description: description,
                            active: active,
                          )));
                  }
                },
              ),
            ),
          ],
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                                  model?.active = "S";
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
                                    model?.active = "N";
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
                CustomInput(
                  title: 'Descrição',
                  initialValue: model?.description ?? "",
                  validator: (value) => Validators.validateRequired(value),
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.next,
                  onChanged: (value) {
                    model?.description = value;
                    description = value;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
