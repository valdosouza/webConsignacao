import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/Core/data/model/stock_balance_model.dart';
import 'package:appweb/app/modules/stock_balance_general/presentation/bloc/stock_balance_general_bloc.dart';
import 'package:appweb/app/modules/stock_balance_general/presentation/bloc/stock_balance_general_event.dart';
import 'package:appweb/app/modules/stock_balance_general/presentation/bloc/stock_balance_general_state.dart';
import 'package:appweb/app/modules/stock_balance_general/presentation/contents/content_stock_balance_general.dart';
import 'package:appweb/app/modules/stock_balance_general/stock_balance_general_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StockBalanceGeneralPageDesktop extends StatefulWidget {
  const StockBalanceGeneralPageDesktop({super.key});

  @override
  State<StockBalanceGeneralPageDesktop> createState() =>
      StockBalanceGeneralPageDesktopState();
}

class StockBalanceGeneralPageDesktopState
    extends State<StockBalanceGeneralPageDesktop> {
  late final StockBalanceGeneralBloc bloc;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<StockBalanceGeneralModule>();
    });
    bloc = Modular.get<StockBalanceGeneralBloc>();
    bloc.add(StockBalanceGeneralGetListEvent(tbInstitutionId: 1));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StockBalanceGeneralBloc, StockBalanceGeneralState>(
      bloc: bloc,
      listener: (context, state) {
        statesStockBalance(state);
      },
      builder: (context, state) {
        if (state is StockBalanceGeneralLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final stockBalance = state.list;
        return _listastockBalance(stockBalance);
      },
    );
  }

  _listastockBalance(List<StockBalanceModel> customers) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: kBoxDecorationflexibleSpace,
        ),
        title: const Text('Lista de Balanço de Estoque Geral'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              buildSearchInput(bloc),
              const SizedBox(height: 15),
              buildListView(bloc.stockBalance),
            ],
          ),
        ),
      ),
    );
  }
}
