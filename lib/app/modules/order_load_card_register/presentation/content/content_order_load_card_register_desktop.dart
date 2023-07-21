import 'package:appweb/app/modules/order_load_card_register/order_load_card_register_module.dart';
import 'package:appweb/app/modules/order_load_card_register/presentation/bloc/order_load_card_register_bloc.dart';
import 'package:appweb/app/modules/order_load_card_register/presentation/bloc/order_load_card_register_event.dart';

import 'package:appweb/app/modules/order_load_card_register/presentation/widget/custom_body_order_load_card_wiget.dart';
import 'package:appweb/app/modules/order_load_card_register/presentation/widget/custom_header_order_load_card_widget.dart';
import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';

class ContentOrderLoadCardRegisterDesktop extends StatefulWidget {
  const ContentOrderLoadCardRegisterDesktop({
    Key? key,
  }) : super(key: key);

  @override
  State<ContentOrderLoadCardRegisterDesktop> createState() =>
      _ContentOrderLoadCardRegisterDesktopState();
}

class _ContentOrderLoadCardRegisterDesktopState
    extends State<ContentOrderLoadCardRegisterDesktop> {
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

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            bloc.add(OrderLoadCardRegisterGetListCardEvent());
          },
        ),
        title: Text(
          "Carregamento do próximo dia - Vendedor: ${bloc.modelLoadCard.nameUser}",
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
            fontFamily: 'OpenSans',
          ),
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                onTap: (() => bloc.add(OrderClosureEvent())),
                value: 0,
                child: const Text("Encerrar"),
              )
            ],
          ),
        ],
      ),
      body: SizedBox(
        height: size.height,
        child: Column(
          children: [
            const CustomHeaderOrderLoadCard(),
            CustomBodyOrderLoadCardWidget(size: size),
          ],
        ),
      ),
    );
  }
}
