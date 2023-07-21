import 'package:appweb/app/core/shared/widgets/custom_circular_progress_indicator.dart';
import 'package:appweb/app/core/shared/widgets/item_drawer.dart';
import 'package:appweb/app/modules/cashier_closure/cashier_closure_module.dart';
import 'package:appweb/app/modules/cashier_closure/presentation/bloc/cashier_closure_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../bloc/cashier_closure_event.dart';
import '../bloc/cashier_closure_state.dart';

class CashierClosureMenuMobile extends StatefulWidget {
  const CashierClosureMenuMobile({super.key});

  @override
  State<CashierClosureMenuMobile> createState() =>
      _CashierClosureMenuMobileState();
}

class _CashierClosureMenuMobileState extends State<CashierClosureMenuMobile> {
  late CashierClosureBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = Modular.get<CashierClosureBloc>();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<CashierClosureModule>();
    });
    bloc.add(CashierClosureGetCurrentDateEvent());
  }

  @override
  Widget build(BuildContext context) {
    menu() {
      return Drawer(
        child: ListView(
          children: <Widget>[
            itemMenuDraw(
              Icons.home,
              'Hoje - ${bloc.dtCashierToday}',
              () async => Modular.to.navigate('/cashierclosure/mobile/today/'),
            ),
            itemMenuDraw(
              Icons.home,
              'Ontem - ${bloc.dtCashierYesterday}',
              () async =>
                  Modular.to.navigate('/cashierclosure/mobile/yesterday/'),
            ),
            itemMenuDraw(
              Icons.home,
              'Anteriores',
              () async =>
                  Modular.to.navigate('/cashierclosure/mobile/allpreviously/'),
            ),
            // itemMenuDraw(
            //   Icons.home,
            //   'Altera data para 11/02/2023',
            //   () async => await LocalStorageService.instance.saveItem(
            //       key: LocalStorageKey.dtCashier, value: "11/02/2023"),
            // ),
          ],
        ),
      );
    }

    return BlocConsumer<CashierClosureBloc, CashierClosureState>(
        bloc: bloc,
        listener: (context, state) {},
        builder: (context, state) {
          if (state is CashierClosureLoadingState) {
            return const CustomCircularProgressIndicator();
          }
          if (state is GetCurrentDateSucessState) {
            return menu();
          }
          return Container();
        });
  }
}
