import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/widgets/custom_input.dart';
import 'package:appweb/app/modules/sales_route_register/data/models/sales_model.dart';
import 'package:appweb/app/modules/sales_route_register/presentation/bloc/sales_bloc.dart';
import 'package:appweb/app/modules/sales_route_register/presentation/bloc/sales_events.dart';
import 'package:flutter/material.dart';

import '../../../../core/shared/utils/toast.dart';

class SalesInteractionPage extends StatefulWidget {
  final SalesBloc bloc;
  final SalesModel? model;
  const SalesInteractionPage({
    super.key,
    required this.bloc,
    this.model,
  });

  @override
  State<SalesInteractionPage> createState() => _SalesInteractionPageState();
}

class _SalesInteractionPageState extends State<SalesInteractionPage> {
  String description = "";
  String active = "N";
  bool selectRadio = false;
  SalesModel? salesModel;

  @override
  void initState() {
    if (widget.model?.active != null) {
      selectRadio = widget.model!.active == "S";
    }
    salesModel = widget.model;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.model == null
            ? const Text("SALES PAGE")
            : const Text("Editar"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              if (widget.model != null) {
                if (widget.model!.description.isEmpty) {
                  CustomToast.showToast("Campo descrição é obrigatório.");
                } else {
                  // widget.bloc
                  //     .add(EditLineBusinessEvent(lineBusiness: widget.model!));
                }
              } else {
                if (description.isEmpty) {
                  CustomToast.showToast("Campo descrição é obrigatório.");
                } else {
                  widget.bloc.add(
                    AddSalesEvent(
                      salesModel: SalesModel(
                        id: 0,
                        institution: 1,
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
              initialValue: "",
              keyboardType: TextInputType.number,
              inputAction: TextInputAction.next,
              onChanged: (value) {
                widget.model?.description = value;
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
                              widget.model?.active = "S";
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
                                widget.model?.active = "N";
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
    );
  }
}
