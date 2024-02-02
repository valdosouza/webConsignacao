import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/core/shared/widgets/custom_circular_progress_indicator.dart';
import 'package:appweb/app/core/shared/widgets/item_drawer.dart';
import 'package:appweb/app/modules/stock/presentation/bloc/bloc.dart';
import 'package:appweb/app/modules/stock/presentation/bloc/event.dart';
import 'package:appweb/app/modules/stock/presentation/bloc/state.dart';
import 'package:appweb/app/modules/stock/stock_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StockMenuMobile extends StatefulWidget {
  const StockMenuMobile({super.key});

  @override
  State<StockMenuMobile> createState() => _StockMenuMobileState();
}

class _StockMenuMobileState extends State<StockMenuMobile> {
  late final StockBloc bloc;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<StockModule>();
    });
    bloc = Modular.get<StockBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StockBloc, StockState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is ValidateOrderLoadState) {
          if (state.msg != "Aberto") {
            CustomToast.showToast(state.msg);
          } else {
            Modular.to.navigate('/orderloadCard/');
          }
        }
      },
      builder: (context, state) {
        if (state is LoadingState) {
          return const CustomCircularProgressIndicator();
        }
        return drawer();
      },
    );
  }

  Widget drawer() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          itemMenuDraw(Icons.home, 'Carregamento',
              () async => bloc.add(ValidateOrderLoadEvent())),
          itemMenuDraw(
            Icons.home,
            'Cliente',
            () async => Modular.to.navigate('/stockbalance/customer/all/'),
          ),
          itemMenuDraw(
            Icons.home,
            'Vendedor',
            () async => Modular.to.navigate('/stockbalance/salesman/get/'),
          ),
          itemMenuDraw(
            Icons.home,
            'Estoque Geral',
            () async => Modular.to.navigate('/stockbalance/general/get/'),
          ),
        ],
      ),
    );
  }
}
