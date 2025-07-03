import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/order_load_card_register/domain/usecase/get_new_order_load_card.dart';
import 'package:appweb/app/modules/order_load_card_register/order_load_card_register_module.dart';
import 'package:appweb/app/modules/order_load_card_register/presentation/bloc/order_load_card_register_bloc.dart';
import 'package:appweb/app/modules/order_load_card_register/presentation/bloc/order_load_card_register_event.dart';
import 'package:appweb/app/modules/order_load_card_register/presentation/widget/Register/custom_body_order_load_card_wiget.dart';
import 'package:appweb/app/modules/order_load_card_register/presentation/widget/Register/custom_header_order_load_card_widget.dart';
import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';

class ContentOrderLoadCardRegisterMobile extends StatefulWidget {
  const ContentOrderLoadCardRegisterMobile({
    super.key,
  });

  @override
  State<ContentOrderLoadCardRegisterMobile> createState() =>
      _ContentOrderLoadCardRegisterMobileState();
}

class _ContentOrderLoadCardRegisterMobileState
    extends State<ContentOrderLoadCardRegisterMobile> {
  late TextEditingController editcontrol;
  late final OrderLoadCardRegisterBloc bloc;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      Modular.isModuleReady<OrderLoadCardRegisterModule>;
    });

    bloc = Modular.get<OrderLoadCardRegisterBloc>();
  }

  void _showBackDialog() {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmação.'),
          content: const Text(
            "Deseja realmente sair desta Tela?",
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Não'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Sim'),
              onPressed: () {
                Navigator.pop(context);
                Modular.to.navigate('/stock/mobile/');
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bool keyboardHide = (MediaQuery.of(context).viewInsets.bottom == 0);
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        if (didPop) {
          return;
        }
        _showBackDialog();
      },
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: kBoxDecorationflexibleSpace,
            alignment: Alignment.center,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  height: 30,
                  child: const Text(
                    "Carregamento do próximo dia",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                ),
                const CustomHeaderOrderLoadCard(),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: CustomBodyOrderLoadCardWidget(size: size),
        ),
        bottomSheet: (keyboardHide) ? _footer() : null,
      ),
    );
  }

  SizedBox _footer() {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: _custombutton("Voltar", (() {
              _showBackDialog();
            })),
          ),
          Expanded(
            flex: 1,
            child: _custombutton(
                "Limpar", () => bloc.add(OrderLoadCardRegisterClearEvent())),
          ),
          Expanded(
            flex: 1,
            child: _custombutton(
                "Histórico", (() => bloc.add(GetListByUserEvent()))),
          ),
          Expanded(
            flex: 1,
            child: (bloc.modelLoadCard.id == 0)
                ? _custombutton(
                    "Finalizar", (() => {bloc.add(OrderLoadCardPostEvent())}))
                : _custombutton(
                    "Consultar",
                    (() {
                      //no mobile pode passar zero que no datasource ele preenche
                      bloc.add(
                        OrderLoadCardRegisterGetCardEvent(
                            params: ParamsGetNewOrderLoadCard(
                          tbSalesmanId: 0,
                          dtRecord: "",
                        )),
                      );
                    }),
                  ),
          ),
        ],
      ),
    );
  }

  Padding _custombutton(String buttonName, Function() function) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 2, right: 4, bottom: 2),
      child: ElevatedButton(
        style: kElevatedButtonStyleRed,
        onPressed: () {
          function();
          setState(() {});
        },
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(
              left: 2.0, top: 0.0, right: 2.0, bottom: 0.0),
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.red,
            ),
          ),
          child: Text(
            buttonName,
            style: kElevatedButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
