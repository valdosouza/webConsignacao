import 'package:appweb/app/modules/cashier_balance/presentation/widget/cashier_balance_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../cashier_balance_module.dart';
import '../bloc/cashier_balance_bloc.dart';
import '../bloc/cashier_balance_state.dart';

class ContentMobileCashierBalance extends StatefulWidget {
  const ContentMobileCashierBalance({super.key});

  @override
  State<ContentMobileCashierBalance> createState() =>
      _ContentMobileCashierBalanceState();
}

class _ContentMobileCashierBalanceState
    extends State<ContentMobileCashierBalance> {
  late final CashierBalanceBloc bloc;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 0)).then((_) async {
      await Modular.isModuleReady<CashierBalanceModule>();
    });
    bloc = Modular.get<CashierBalanceBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CashierBalanceBloc, CashierBalanceState>(
      bloc: bloc,
      builder: (context, state) {
        return const CashierBalanceWidget();
      },
    );
  }
}
