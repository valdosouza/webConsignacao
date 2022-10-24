import 'package:appweb/app/modules/line_business_register/data/models/line_business_model.dart';
import 'package:appweb/app/modules/line_business_register/presentation/bloc/line_business_bloc.dart';
import 'package:appweb/app/modules/line_business_register/presentation/bloc/line_business_events.dart';
import 'package:flutter/material.dart';

import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/core/shared/widgets/custom_input.dart';
import 'package:flutter_modular/flutter_modular.dart';

class InteractionLineBusiness extends StatefulWidget {
  final LineBusinessModel? lineBusiness;
  const InteractionLineBusiness({
    Key? key,
    required this.lineBusiness,
  }) : super(key: key);

  @override
  State<InteractionLineBusiness> createState() => _InteractionLineBusinessState();
}

class _InteractionLineBusinessState extends State<InteractionLineBusiness> {
  bool selectRadio = false;
  bool selectMain = false;
  LineBusinessModel? lineBusinessModel;
  late LineBusinessBloc bloc;
  @override
  void initState() {
    bloc = Modular.get<LineBusinessBloc>();
    if (widget.lineBusiness?.active != null) {
      description = widget.lineBusiness!.description;
      active = selectRadio = widget.lineBusiness!.active;
    }
    lineBusinessModel = widget.lineBusiness;

    super.initState();
  }

  String description = "";
  bool active = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bloc.add(LineBusinessGetlistEvent(idInstitution: 1));
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: lineBusinessModel == null
              ? const Text('Adicionar')
              : const Text('Editar'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Modular.to.pop();
              bloc.add(LineBusinessGetlistEvent(idInstitution: 1));
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.check),
              onPressed: () {
                if (lineBusinessModel != null) {
                  if (description.isEmpty) {
                    CustomToast.showToast("Campo descrição é obrigatório.");
                  } else {
                    lineBusinessModel = lineBusinessModel!
                        .copyWith(description: description, active: active);
                    bloc.add(LineBusinessPutEvent(lineBusinessModel: lineBusinessModel!));
                  }
                } else {
                  if (description.isEmpty) {
                    CustomToast.showToast("Campo descrição é obrigatório.");
                  } else {
                    bloc.add(
                      LineBusinessAddEvent(
                        lineBusinessModel: LineBusinessModel(
                          id: 0,
                          idInstitution: bloc.state.lineBusiness.last.idInstitution,
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
                initialValue: lineBusinessModel?.description ?? "",
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
