import 'package:appweb/app/core/shared/enum.dart';
import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/validators.dart';
import 'package:appweb/app/core/shared/widgets/custom_input.dart';
import 'package:appweb/app/modules/stock_list_register/presentation/bloc/stock_list_bloc.dart';
import 'package:appweb/app/modules/stock_list_register/presentation/bloc/stock_list_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StockListInteractionPage extends StatefulWidget {
  const StockListInteractionPage({super.key});

  @override
  State<StockListInteractionPage> createState() =>
      _StockListInteractionPageState();
}

class _StockListInteractionPageState extends State<StockListInteractionPage> {
  late final StockListBloc bloc;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    bloc = Modular.get<StockListBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        if (didPop) {
          return;
        }
        bloc.add(StockListGetListEvent());
      },
      child: Scaffold(
        appBar: AppBar(
          title: bloc.model.id == 0
              ? const Text('Adicionar')
              : Text('Editar ${bloc.model.description}'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_outlined,
                color: kSecondaryColor),
            onPressed: () {
              bloc.add(StockListGetListEvent());
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                icon: const Icon(Icons.check, color: kSecondaryColor),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    bloc.model.id > 0
                        ? bloc.add(StockListPutEvent())
                        : bloc.add(StockListPostEvent());
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
                    Row(
                      children: [
                        Radio<OptionYesNo>(
                          value: OptionYesNo.S,
                          groupValue: bloc.optionYesNo,
                          activeColor: Colors.red,
                          onChanged: (value) {
                            setState(() {
                              bloc.optionYesNo = value;
                            });
                            bloc.model.active = "S";
                          },
                        ),
                        const SizedBox(width: 5.0),
                        const Text("Sim", style: kLabelStyle),
                      ],
                    ),
                    const SizedBox(width: 10.0),
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
                      ],
                    ),
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
