import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/core/shared/widgets/custom_circular_progress_indicator.dart';
import 'package:appweb/app/modules/Core/data/model/stock_balance_model.dart';
import 'package:appweb/app/modules/stock_balance/presentation/bloc/stock_balance_bloc.dart';
import 'package:appweb/app/modules/stock_balance/presentation/bloc/stock_balance_event.dart';
import 'package:appweb/app/modules/stock_balance/presentation/bloc/stock_balance_state.dart';
import 'package:appweb/app/modules/stock_balance/presentation/content/content_stock_balance_general.dart';
import 'package:appweb/app/modules/stock_balance/stock_balance_module.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StockBalanceGeneralPageMobile extends StatefulWidget {
  const StockBalanceGeneralPageMobile({super.key});

  @override
  State<StockBalanceGeneralPageMobile> createState() =>
      StockBalanceGeneralPageMobileState();
}

class StockBalanceGeneralPageMobileState
    extends State<StockBalanceGeneralPageMobile> {
  late final StockBalanceBloc bloc;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<StockBalanceModule>();
    });
    bloc = Modular.get<StockBalanceBloc>();
    bloc.add(StockBalanceGeneralGetListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StockBalanceBloc, StockBalanceState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is ErrorState) {
          CustomToast.showToast(state.msg);
        }
      },
      builder: (context, state) {
        if (state is StockBalanceLoadingState) {
          return const Center(
            child: CustomCircularProgressIndicator(),
          );
        }

        return _listastockBalance(bloc.stockBalance);
      },
    );
  }

  Scaffold _listastockBalance(StockBalanceModel customers) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: kBoxDecorationflexibleSpace,
        ),
        title: const AutoSizeText(
          'Estoque Geral',
          style: kTitleAppBarStyle,
        ),
        leading: IconButton(
          icon:
              const Icon(Icons.arrow_back_ios_outlined, color: kSecondaryColor),
          onPressed: () {
            Modular.to.navigate('/stock/mobile/');
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            buildSearchInput(bloc),
            const SizedBox(height: 15),
            buildListView(bloc.stockBalance),
          ],
        ),
      ),
    );
  }
}
