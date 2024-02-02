import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/order_load_card_register/order_load_card_register_module.dart';
import 'package:appweb/app/modules/order_load_card_register/presentation/bloc/order_load_card_register_bloc.dart';
import 'package:appweb/app/modules/order_load_card_register/presentation/bloc/order_load_card_register_event.dart';

import 'package:appweb/app/modules/order_load_card_register/presentation/widget/Register/custom_body_order_load_card_wiget.dart';
import 'package:appweb/app/modules/order_load_card_register/presentation/widget/Register/custom_header_order_load_card_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
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
        flexibleSpace: Container(
          decoration: kBoxDecorationflexibleSpace,
        ),
        leading: IconButton(
          icon:
              const Icon(Icons.arrow_back_ios_outlined, color: kSecondaryColor),
          onPressed: () {
            bloc.add(OrderLoadCardRegisterGetListCardEvent());
          },
        ),
        title: AutoSizeText(
          "Carregamento do próximo dia - Vendedor: ${bloc.modelLoadCard.nameUser}",
          textAlign: TextAlign.center,
          style: kTitleAppBarStyle,
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
