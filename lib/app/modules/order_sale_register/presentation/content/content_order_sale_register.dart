import 'dart:io';

import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/modules/order_sale_register/data/model/order_sale_main_card_model.dart';
import 'package:appweb/app/modules/order_sale_register/order_sale_register_module.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/bloc/order_sale_register_bloc.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/bloc/order_sale_register_event.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/widget/ordersale/custom_body_order_sale_wiget.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/widget/ordersale/custom_header_order_sale_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_modular/flutter_modular.dart';

class ContentOrderSaleRegister extends StatefulWidget {
  final OrderSaleMainCardModel orderSale;
  const ContentOrderSaleRegister({
    Key? key,
    required this.orderSale,
  }) : super(key: key);

  @override
  State<ContentOrderSaleRegister> createState() =>
      _ContentOrderSaleRegisterState();
}

class _ContentOrderSaleRegisterState extends State<ContentOrderSaleRegister> {
  late TextEditingController editcontrol;
  late final OrderSaleRegisterBloc bloc;

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ],
    );
    super.initState();

    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      Modular.isModuleReady<OrderSaleRegisterModule>;
    });

    bloc = Modular.get<OrderSaleRegisterBloc>();
  }

  @override
  dispose() {
    if (Platform.isAndroid) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bool keyboardHide = (MediaQuery.of(context).viewInsets.bottom == 0);
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                height: 45,
                child: Text(
                  bloc.modelOrderSale.order.nameCustomer,
                  style: ktittleAppBarStyle,
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
            child: _custombutton(
                "Voltar", (() => Modular.to.navigate('/customer/mobile/'))),
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
                (() =>
                    {CustomToast.showToast("Em desenvolvimento. Aguarde..")})),
          ),
          Expanded(
            flex: 1,
            child: _custombutton(
                "Finalizar",
                (() => {
                      bloc.add(
                          OrderSaleCardPostEvent(model: bloc.modelOrderSale))
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
