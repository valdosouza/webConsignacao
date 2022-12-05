import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/validators.dart';
import 'package:appweb/app/core/shared/widgets/custom_input.dart';
import 'package:appweb/app/modules/sales_route_register/data/model/sales_route_model.dart';
import 'package:appweb/app/modules/sales_route_register/presentation/bloc/sales_route_register_bloc.dart';
import 'package:appweb/app/modules/sales_route_register/presentation/bloc/sales_route_register_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SalesRouteRegisterInterationPage extends StatefulWidget {
  final SalesRouteRegisterModel? model;
  final int index;
  const SalesRouteRegisterInterationPage(
      {super.key, this.model, required this.index});

  @override
  State<SalesRouteRegisterInterationPage> createState() =>
      SalesRoutetRegisterInterationPageState();
}

class SalesRoutetRegisterInterationPageState
    extends State<SalesRouteRegisterInterationPage> {
  late final SalesRouteRegisterBloc bloc;
  SalesRouteRegisterModel? model;
  final _formKey = GlobalKey<FormState>();

  bool selectRadio = false;

  String description = "";
  String active = "S";

  @override
  void initState() {
    super.initState();
    bloc = Modular.get<SalesRouteRegisterBloc>();
    model = widget.model;
    if (model != null) {
      selectRadio = model!.active == "S";
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bloc.add(SalesRouteRegisterGetListEvent());
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: kBoxDecorationflexibleSpace,
          ),
          title: model == null
              ? const Text('Adicionar')
              : Text('Editar ${model!.description}'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              bloc.add(SalesRouteRegisterGetListEvent());
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
                        ? bloc.add(SalesRouteRegisterPutEvent(model: model!))
                        : bloc.add(SalesRouteRegisterPostEvent(
                            model: SalesRouteRegisterModel(
                            id: 0,
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
