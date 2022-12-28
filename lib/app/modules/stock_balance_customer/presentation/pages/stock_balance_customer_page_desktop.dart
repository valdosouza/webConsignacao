import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/Core/data/model/stock_balance_model.dart';
import 'package:appweb/app/modules/stock_balance_customer/presentation/bloc/stock_balance_customer_bloc.dart';
import 'package:appweb/app/modules/stock_balance_customer/presentation/bloc/stock_balance_customer_event.dart';
import 'package:appweb/app/modules/stock_balance_customer/presentation/bloc/stock_balance_customer_state.dart';
import 'package:appweb/app/modules/stock_balance_customer/presentation/contents/content_stock_balance_customer.dart';
import 'package:appweb/app/modules/stock_balance_customer/stock_balance_customer_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StockBalanceCustomerPageDesktop extends StatefulWidget {
  const StockBalanceCustomerPageDesktop({super.key});

  @override
  State<StockBalanceCustomerPageDesktop> createState() =>
      StockBalanceCustomerPageDesktopState();
}

class StockBalanceCustomerPageDesktopState
    extends State<StockBalanceCustomerPageDesktop> {
  late final StockBalanceCustomerBloc bloc;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<StockBalanceCustomerModule>();
    });
    bloc = Modular.get<StockBalanceCustomerBloc>();
    bloc.add(StockBalanceCustomerGetListEvent(tbInstitutionId: 1));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StockBalanceCustomerBloc, StockBalanceCustomerState>(
      bloc: bloc,
      listener: (context, state) {
        statesStockBalance(state);
      },
      builder: (context, state) {
        if (state is StockBalanceCustomerLoadingState) {
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
        title: const Text('Lista de Balanço de Estoque Cliente'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(children: [
            buildSearchInput(bloc),
            const SizedBox(height: 15),
            buildListView(bloc.stockBalance),
          ]),
        ),
      ),
    );
  }
}
