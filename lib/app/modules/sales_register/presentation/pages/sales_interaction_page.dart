import 'package:appweb/app/modules/sales_register/data/models/sales_model.dart';
import 'package:appweb/app/modules/sales_register/presentation/bloc/sales_bloc.dart';
import 'package:appweb/app/modules/sales_register/presentation/bloc/sales_events.dart';
import 'package:flutter/material.dart';

import '../../../../core/shared/utils/toast.dart';

class SalesInteractionPage extends StatefulWidget {
  final SalesBloc bloc;
  final SalesModel? model;
  const SalesInteractionPage({
    super.key,
    required this.bloc,
    required this.model,
  });

  @override
  State<SalesInteractionPage> createState() => _SalesInteractionPageState();
}

class _SalesInteractionPageState extends State<SalesInteractionPage> {
  String description = "";
  String active = "N";

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
                        id: (widget.bloc.state.listSalesModel.last.id + 1),
                        institution:
                            widget.bloc.state.listSalesModel.last.institution,
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
    );
  }
}
