import 'package:appweb/app/core/shared/widgets/item_drawer.dart';
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
              'Ontem - ${bloc.dtCashierYesterDay}',
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
            //   'Altera data para 24/01/2023',
            //   () async => await LocalStorageService.instance.saveItem(
            //       key: LocalStorageKey.dtCashier, value: CustomDate.yesterday()),
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
            return const Center(child: CircularProgressIndicator());
          }
          return menu();
        });
  }
}
