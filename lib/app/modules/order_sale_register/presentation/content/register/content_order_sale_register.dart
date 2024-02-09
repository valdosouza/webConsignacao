import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/order_sale_register/domain/usecase/order_sale_getlist.dart';

import 'package:appweb/app/modules/order_sale_register/order_sale_register_module.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/bloc/order_sale_register_bloc.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/bloc/order_sale_register_event.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/widget/register/ordersale/custom_body_order_sale_wiget.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/widget/register/ordersale/custom_header_order_sale_widget.dart';
import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';

class ContentOrderSaleRegister extends StatefulWidget {
  const ContentOrderSaleRegister({
    super.key,
  });

  @override
  State<ContentOrderSaleRegister> createState() =>
      _ContentOrderSaleRegisterState();
}

class _ContentOrderSaleRegisterState extends State<ContentOrderSaleRegister> {
  late final OrderSaleRegisterBloc bloc;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      Modular.isModuleReady<OrderSaleRegisterModule>;
    });

    bloc = Modular.get<OrderSaleRegisterBloc>();
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
                Modular.to
                    .navigate('/attendance/', arguments: bloc.modelAttendance);
              },
            ),
          ],
        );
      },
    );
  }

  void _showConfirmationFinalize() {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmação.'),
          content: const Text(
            "Deseja realmente finalizar?",
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
                bloc.add(OrderSaleCardPostEvent(model: bloc.modelOrderSale));
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
      onPopInvoked: (bool didPop) {
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
                  height: 40,
                  child: Text(
                    bloc.modelAttendance.nameCustomer,
                    style: kTitleAppBarStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                const CustomHeaderOrderSale(),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: CustomBodyOrderSale(
              size: size, modelOrdersale: bloc.modelOrderSale),
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
              _showBackDialog();
            })),
          ),
          Expanded(
            flex: 1,
            child: _custombutton(
                "Limpar", () => bloc.add(OrderSaleRegisterClearEvent())),
          ),
          Expanded(
            flex: 1,
            child: _custombutton(
                "Informações",
                () => bloc.add(OrderSaleRegisterGetlistEvent(
                        params: ParamsOrderSaleList(
                      tbInstitutionId: 0,
                      page: 0,
                      tbSalesmanId: 0,
                      number: 0,
                      tbCustomerId: bloc.modelAttendance.tbCustomerId,
                      nickTrade: "",
                    )))),
          ),
          Expanded(
            flex: 1,
            child: _custombutton(
                "Finalizar", (() => {_showConfirmationFinalize()})),
          ),
        ],
      ),
    );
  }

  _custombutton(String buttonName, Function() function) {
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
