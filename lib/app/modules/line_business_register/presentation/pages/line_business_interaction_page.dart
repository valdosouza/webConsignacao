import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/core/shared/widgets/custom_input.dart';
import 'package:appweb/app/modules/line_business_register/data/model/line_business_model.dart';
import 'package:appweb/app/modules/line_business_register/presentation/bloc/line_business_bloc.dart';
import 'package:appweb/app/modules/line_business_register/presentation/bloc/line_business_events.dart';
import 'package:flutter/material.dart';

class LineBusinessInteractionPage extends StatefulWidget {
  final LineBusinessBloc bloc;
  final LineBusinessModel? lineBusiness;
  const LineBusinessInteractionPage({
    super.key,
    required this.bloc,
    this.lineBusiness,
  });

  @override
  State<LineBusinessInteractionPage> createState() =>
      _LineBusinessInterationPageState();
}

class _LineBusinessInterationPageState
    extends State<LineBusinessInteractionPage> {
  bool selectRadio = false;
  bool selectMain = false;
  LineBusinessModel? lineBusiness;

  @override
  void initState() {
    if (widget.lineBusiness?.active != null) {
      selectRadio = widget.lineBusiness!.active == "S";
    }
    lineBusiness = widget.lineBusiness;

    super.initState();
  }

  String descripton = "";
  String active = "N";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        widget.bloc.add(LoadLineBusinessEvent());
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: kBoxDecorationflexibleSpace,
          ),
          title: lineBusiness == null
              ? const Text('Adicionar')
              : const Text('Editar'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              widget.bloc.add(LoadLineBusinessEvent());
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.check),
              onPressed: () {
                if (lineBusiness != null) {
                  if (lineBusiness!.description.isEmpty) {
                    CustomToast.showToast("Campo descrição é obrigatório.");
                  } else {
                    widget.bloc.add(
                        EditLineBusinessEvent(lineBusiness: lineBusiness!));
                  }
                } else {
                  if (descripton.isEmpty) {
                    CustomToast.showToast("Campo descrição é obrigatório.");
                  } else {
                    widget.bloc.add(
                      AddLineBusinessEvent(
                        lineBusiness: LineBusinessModel(
                          id: (widget.bloc.state.lineBusinessList.last.id + 1),
                          institution: widget
                              .bloc.state.lineBusinessList.last.institution,
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
                initialValue: lineBusiness?.description ?? "",
                keyboardType: TextInputType.number,
                inputAction: TextInputAction.next,
                onChanged: (value) {
                  lineBusiness?.description = value;
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
                                lineBusiness?.active = "S";
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
                                  lineBusiness?.active = "N";
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
