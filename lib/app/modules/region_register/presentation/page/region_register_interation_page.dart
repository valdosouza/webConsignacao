import 'package:appweb/app/core/shared/enum.dart';
import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/validators.dart';
import 'package:appweb/app/core/shared/widgets/custom_input.dart';
import 'package:appweb/app/modules/region_register/presentation/bloc/region_register_bloc.dart';
import 'package:appweb/app/modules/region_register/presentation/bloc/region_register_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegionRegisterInterationPage extends StatefulWidget {
  const RegionRegisterInterationPage({
    super.key,
  });

  @override
  State<RegionRegisterInterationPage> createState() =>
      RegiontRegisterInterationPageState();
}

class RegiontRegisterInterationPageState
    extends State<RegionRegisterInterationPage> {
  late final RegionRegisterBloc bloc;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    bloc = Modular.get<RegionRegisterBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bloc.add(RegionRegisterGetListEvent());
        return true;
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
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              bloc.add(RegionRegisterGetListEvent());
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                icon: const Icon(Icons.check),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    (bloc.model.id > 0)
                        ? bloc.add(RegionRegisterPutEvent())
                        : bloc.add(RegionRegisterPostEvent());
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Vendedor",
                      style: kLabelStyle,
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                        alignment: Alignment.centerLeft,
                        decoration: kBoxDecorationStyle,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text(
                                  bloc.model.salesmanName,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'OpenSans',
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: IconButton(
                                hoverColor: Colors.transparent,
                                onPressed: () {
                                  bloc.add(RegionRegisterGetSalesmanEvent());
                                },
                                icon: const Icon(
                                  Icons.search,
                                  size: 20.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        )),
                  ],
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
