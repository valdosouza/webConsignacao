import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/Core/data/model/stock_balance_model.dart';
import 'package:appweb/app/modules/stock_balance/presentation/bloc/stock_balance_bloc.dart';
import 'package:appweb/app/modules/stock_balance/presentation/bloc/stock_balance_event.dart';
import 'package:appweb/app/modules/stock_balance/presentation/bloc/stock_balance_state.dart';
import 'package:appweb/app/modules/stock_balance/presentation/contents/content_stock_balance_customer.dart';
import 'package:appweb/app/modules/stock_balance/stock_balance_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StockBalanceCustomerPageMobile extends StatefulWidget {
  const StockBalanceCustomerPageMobile({super.key});

  @override
  State<StockBalanceCustomerPageMobile> createState() =>
      StockBalanceCustomerPageMobileState();
}

class StockBalanceCustomerPageMobileState
    extends State<StockBalanceCustomerPageMobile> {
  late final StockBalanceBloc bloc;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<StockBalanceModule>();
    });
    bloc = Modular.get<StockBalanceBloc>();
    bloc.add(StockBalanceCustomerGetListEvent(tbInstitutionId: 1));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StockBalanceBloc, StockBalanceState>(
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
        title: const Text('Lista de Balan??o de Estoque Cliente'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Modular.to.navigate('/stock/mobile/');
          },
        ),
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
