import 'package:appweb/app/modules/order_load_card_register/data/model/order_load_card_main_model.dart';
import 'package:appweb/app/modules/order_load_card_register/presentation/bloc/order_load_card_register_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:appweb/app/modules/order_load_card_register/order_load_card_register_module.dart';
import 'package:appweb/app/modules/order_load_card_register/presentation/bloc/order_load_card_register_bloc.dart';
import 'package:appweb/app/modules/order_load_card_register/presentation/widget/Register/custom_header_order_load_card_widget.dart';
import 'package:appweb/app/modules/order_load_card_register/presentation/widget/historic/custom_body_order_load_card_historic_wiget.dart';

class ContentOrderLoadCardHistoricMobile extends StatefulWidget {
  final OrderLoadCardMainModel orderLoadCard;
  const ContentOrderLoadCardHistoricMobile({
    Key? key,
    required this.orderLoadCard,
  }) : super(key: key);

  @override
  State<ContentOrderLoadCardHistoricMobile> createState() =>
      _ContentOrderLoadCardHistoricMobileState();
}

class _ContentOrderLoadCardHistoricMobileState
    extends State<ContentOrderLoadCardHistoricMobile> {
  late TextEditingController editcontrol;
  late final OrderLoadCardRegisterBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = Modular.get<OrderLoadCardRegisterBloc>();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      Modular.isModuleReady<OrderLoadCardRegisterModule>;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                height: 40,
                child: Text(
                  'Carregamento do dia  ${widget.orderLoadCard.dtRecord}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
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
        child: CustomBodyOrderLoadCardHistoricWidget(
          orderLoadCard: widget.orderLoadCard,
          size: size,
        ),
      ),
      bottomSheet: _footer(),
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
            child: _custombutton("Sair", (() async {
              bloc.add(GetListByUserEvent());
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
