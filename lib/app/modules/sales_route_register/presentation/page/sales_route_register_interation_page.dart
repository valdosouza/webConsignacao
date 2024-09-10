import 'package:appweb/app/core/shared/enum.dart';
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

  const SalesRouteRegisterInterationPage({super.key, this.model});

  @override
  State<SalesRouteRegisterInterationPage> createState() =>
      SalesRoutetRegisterInterationPageState();
}

class SalesRoutetRegisterInterationPageState
    extends State<SalesRouteRegisterInterationPage> {
  late final SalesRouteRegisterBloc bloc;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    bloc = Modular.get<SalesRouteRegisterBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        if (didPop) {
          return;
        }
        bloc.add(SalesRouteRegisterGetListEvent());
      },
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: kBoxDecorationflexibleSpace,
          ),
          title: bloc.model.id == 0
              ? const Text('Adicionar')
              : Text('Editar ${bloc.model.description}'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_outlined,
                color: kSecondaryColor),
            onPressed: () {
              bloc.add(SalesRouteRegisterGetListEvent());
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                icon: const Icon(Icons.check, color: kSecondaryColor),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    (bloc.model.id > 0)
                        ? bloc.add(SalesRouteRegisterPutEvent())
                        : bloc.add(SalesRouteRegisterPostEvent());
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
                CustomInput(
                  title: 'Descrição',
                  initialValue: bloc.model.description,
                  validator: (value) => Validators.validateRequired(value),
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.next,
                  onChanged: (value) {
                    bloc.model.description = value;
                  },
                ),
                const SizedBox(height: 30.0),
                const Text("Ativo", style: kLabelStyle),
                const SizedBox(height: 10.0),
                Row(
                  children: [
                    Radio<OptionYesNo>(
                        value: OptionYesNo.N,
                        groupValue: bloc.optionYesNo,
                        activeColor: Colors.red,
                        onChanged: (value) {
                          setState(() {
                            bloc.optionYesNo = value;
                          });
                          bloc.model.active = "N";
                        }),
                    const SizedBox(width: 5.0),
                    const Text("Não", style: kLabelStyle),
                    const SizedBox(width: 5.0),
                    Radio<OptionYesNo>(
                        value: OptionYesNo.S,
                        groupValue: bloc.optionYesNo,
                        activeColor: Colors.red,
                        onChanged: (value) {
                          setState(() {
                            bloc.optionYesNo = value;
                          });

                          bloc.model.active = "S";
                        }),
                    const SizedBox(width: 5.0),
                    const Text("Sim", style: kLabelStyle),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
