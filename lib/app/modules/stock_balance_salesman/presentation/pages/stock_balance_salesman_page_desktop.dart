import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/Core/data/model/stock_balance_model.dart';
import 'package:appweb/app/modules/stock_balance_salesman/presentation/bloc/stock_balance_salesman_bloc.dart';
import 'package:appweb/app/modules/stock_balance_salesman/presentation/bloc/stock_balance_salesman_event.dart';
import 'package:appweb/app/modules/stock_balance_salesman/presentation/bloc/stock_balance_salesman_state.dart';
import 'package:appweb/app/modules/stock_balance_salesman/presentation/contents/content_stock_balance_salesman.dart';
import 'package:appweb/app/modules/stock_balance_salesman/stock_balance_salesman_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StockBalanceSalesmanPageDesktop extends StatefulWidget {
  const StockBalanceSalesmanPageDesktop({super.key});

  @override
  State<StockBalanceSalesmanPageDesktop> createState() =>
      StockBalanceSalesmanPageDesktopState();
}

class StockBalanceSalesmanPageDesktopState
    extends State<StockBalanceSalesmanPageDesktop> {
  late final StockBalanceSalesmanBloc bloc;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<StockBalanceSalesmanModule>();
    });
    bloc = Modular.get<StockBalanceSalesmanBloc>();
    bloc.add(StockBalanceSalesmanGetListEvent(tbInstitutionId: 1));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StockBalanceSalesmanBloc,
        StockBalanceSalesmanState>(
      bloc: bloc,
      listener: (context, state) {
        statesStockBalance(state);
      },
      builder: (context, state) {
        if (state is StockBalanceSalesmanLoadingState) {
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
          child: buildListView(bloc.sotckBalance),
        ),
      ),
    );
  }
}
