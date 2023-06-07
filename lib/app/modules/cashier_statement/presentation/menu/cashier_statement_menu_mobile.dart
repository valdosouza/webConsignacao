import 'package:appweb/app/core/shared/widgets/custom_circular_progress_indicator.dart';
import 'package:appweb/app/core/shared/widgets/item_drawer.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/bloc/cashier_statement_bloc.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/bloc/cashier_statement_event.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/bloc/cashier_statement_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CashierStatementMenuMobile extends StatefulWidget {
  const CashierStatementMenuMobile({super.key});

  @override
  State<CashierStatementMenuMobile> createState() =>
      _CashierStatementMenuMobileState();
}

class _CashierStatementMenuMobileState
    extends State<CashierStatementMenuMobile> {
  late CashierStatementBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = Modular.get<CashierStatementBloc>();
    if (bloc.dtCashierToday == "") {
      bloc.add(GetCurrentDateEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    menu() {
      return Drawer(
        child: ListView(
          children: <Widget>[
            itemMenuDraw(
              Icons.home,
              'Do dia - ${bloc.dtCashierToday}',
              () async =>
                  Modular.to.navigate('/cashierstatement/mobile/byday/'),
            ),
            itemMenuDraw(
              Icons.home,
              'Do mês de ${bloc.dtCashierMonth}',
              () async =>
                  Modular.to.navigate('/cashierstatement/mobile/bymonth/'),
            ),
            itemMenuDraw(
              Icons.home,
              'Clientes Atendidos',
              () async => Modular.to
                  .navigate('/cashierstatement/mobile/customerscharged/'),
            ),
          ],
        ),
      );
    }

    return BlocConsumer<CashierStatementBloc, CashierStatementState>(
        bloc: bloc,
        listener: (context, state) {},
        builder: (context, state) {
          if (state is LoadingState) {
            return const CustomCircularProgressIndicator();
          }
          return menu();
        });
  }
}
