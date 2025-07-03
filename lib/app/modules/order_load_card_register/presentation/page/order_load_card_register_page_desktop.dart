import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/widgets/custom_circular_progress_indicator.dart';
import 'package:appweb/app/modules/order_load_card_register/data/model/order_load_card_main_model.dart';
import 'package:appweb/app/modules/order_load_card_register/order_load_card_register_module.dart';
import 'package:appweb/app/modules/order_load_card_register/presentation/bloc/order_load_card_register_bloc.dart';
import 'package:appweb/app/modules/order_load_card_register/presentation/bloc/order_load_card_register_event.dart';
import 'package:appweb/app/modules/order_load_card_register/presentation/bloc/order_load_card_register_state.dart';
import 'package:appweb/app/modules/order_load_card_register/presentation/content/register/content_order_load_card_register_desktop.dart';
import 'package:appweb/app/modules/order_load_card_register/presentation/content/register/content_order_load_card_list.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OrderLoadCardRegisterPageDesktop extends StatefulWidget {
  const OrderLoadCardRegisterPageDesktop({super.key});

  @override
  State<OrderLoadCardRegisterPageDesktop> createState() =>
      OrderLoadCardRegisterPageDesktopState();
}

class OrderLoadCardRegisterPageDesktopState
    extends State<OrderLoadCardRegisterPageDesktop> {
  late final OrderLoadCardRegisterBloc bloc;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<OrderLoadCardRegisterModule>();
    });
    bloc = Modular.get<OrderLoadCardRegisterBloc>();
    bloc.add(OrderLoadCardRegisterGetListCardEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderLoadCardRegisterBloc, OrderLoadCardRegisterState>(
      bloc: bloc,
      listener: (context, state) {
        statesOrderLoadCard(state);
      },
      builder: (context, state) {
        if (state is LoadingState) {
          return const Center(
            child: CustomCircularProgressIndicator(),
          );
        }

        if ((state is OrderLoadCardGetItemsLoadedState)) {
          return const ContentOrderLoadCardRegisterDesktop();
        }

        return _listaOrderLoadCard(bloc.listLoadCard);
      },
    );
  }

  Scaffold _listaOrderLoadCard(List<OrderLoadCardMainModel> orders) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: kBoxDecorationflexibleSpace,
        ),
        title: const AutoSizeText(
          'Lista de Ordens de Carregamento',
          style: kTitleAppBarStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              buildSearchInput(bloc),
              const SizedBox(height: 30.0),
              buildListView(bloc),
            ],
          ),
        ),
      ),
    );
  }
}
