import 'package:appweb/app/modules/order_load_card_register/order_load_card_register_module.dart';
import 'package:appweb/app/modules/order_load_card_register/presentation/bloc/order_load_card_register_bloc.dart';
import 'package:appweb/app/modules/order_load_card_register/presentation/bloc/order_load_card_register_event.dart';
import 'package:appweb/app/modules/order_load_card_register/presentation/bloc/order_load_card_register_state.dart';
import 'package:appweb/app/modules/order_load_card_register/presentation/content/content_order_load_card_register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';

class OrderLoadCardRegisterPageMobile extends StatefulWidget {
  const OrderLoadCardRegisterPageMobile({
    Key? key,
  }) : super(key: key);

  @override
  State<OrderLoadCardRegisterPageMobile> createState() =>
      OrderLoadCardRegisterPageMobileState();
}

class OrderLoadCardRegisterPageMobileState
    extends State<OrderLoadCardRegisterPageMobile> {
  late final OrderLoadCardRegisterBloc bloc;

  @override
  void initState() {
    super.initState();

    bloc = Modular.get<OrderLoadCardRegisterBloc>();

    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      Modular.isModuleReady<OrderLoadCardRegisterModule>;
    });
    bloc.add(OrderLoadCardRegisterGetCardEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderLoadCardRegisterBloc, OrderLoadCardRegisterState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is OrderLoadCardGetItemsErrorState) {
          CustomToast.showToast(
              "Erro ao buscar os dados. Tente novamente mais tarde");
          Modular.to.navigate('/stock/mobile/');
        } else if (state is OrderLoadCardPostErrorState) {
          CustomToast.showToast("Erro ao gravar a registro.Tente novamente");
        }
        if (state is OrderLoadCardCardPostSucessState) {
          CustomToast.showToast("Registro efetuado com sucesso!");
        }
      },
      builder: (context, state) {
        if (state is OrderLoadCardPostErrorState) {
          return const ContentOrderLoadCardRegister();
        }

        if (state is OrderLoadCardRegisterLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if ((state is OrderLoadCardGetItemsLoadedState) ||
            (state is OrderLoadCardRegisterCleanDoneState)) {
          return const ContentOrderLoadCardRegister();
        }
        if (state is OrderLoadCardCardPostSucessState) {
          Modular.to.navigate('/stock/mobile/');
        }
        return Container();
      },
    );
  }
}
