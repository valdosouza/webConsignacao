import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/modules/order_load_card_register/order_load_card_register_module.dart';
import 'package:appweb/app/modules/order_load_card_register/presentation/bloc/order_load_card_register_bloc.dart';
import 'package:appweb/app/modules/order_load_card_register/presentation/bloc/order_load_card_register_event.dart';
import 'package:appweb/app/modules/order_load_card_register/presentation/widget/custom_body_order_load_card_wiget.dart';
import 'package:appweb/app/modules/order_load_card_register/presentation/widget/custom_header_order_load_card_widget.dart';
import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';

class ContentOrderLoadCardRegisterMobile extends StatefulWidget {
  const ContentOrderLoadCardRegisterMobile({
    Key? key,
  }) : super(key: key);

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

  Future<bool?> showConfirmationDialog() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Deseja realmente sair desta Tela"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text("Cancelar"),
            ),
            OutlinedButton(
              onPressed: () {
                Modular.to.navigate('/stock/mobile/');
              },
              child: const Text("Sim"),
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
    return WillPopScope(
      onWillPop: (() async {
        final confirmation = await showConfirmationDialog();
        return confirmation ?? false;
      }),
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  height: 40,
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

  _footer() {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: _custombutton("Voltar", (() async {
              final confirmation = await showConfirmationDialog();
              return confirmation ?? false;
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
                "Informações",
                (() =>
                    {CustomToast.showToast("Em desenvolvimento. Aguarde..")})),
          ),
          Expanded(
            flex: 1,
            child: (bloc.modelLoadCard.items[0].id == 0)
                ? _custombutton(
                    "Finalizar", (() => {bloc.add(OrderLoadCardPostEvent())}))
                : _custombutton("Consultar", (() {
                    //no mobile pode passar zero que no datasource ele preenche
                    bloc.add(
                        OrderLoadCardRegisterGetCardEvent(tbSalesmanId: 0));
                  })),
          ),
        ],
      ),
    );
  }

  _custombutton(String buttonName, Function() function) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 2, right: 4, bottom: 2),
      child: ElevatedButton(
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
          child: Text(buttonName),
        ),
      ),
    );
  }
}
