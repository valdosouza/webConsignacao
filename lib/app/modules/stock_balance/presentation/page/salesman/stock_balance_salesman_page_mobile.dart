import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/widgets/custom_circular_progress_indicator.dart';
import 'package:appweb/app/modules/stock_balance/data/model/params_get_list_stock_balance_model.dart';
import 'package:appweb/app/modules/stock_balance/presentation/bloc/stock_balance_bloc.dart';
import 'package:appweb/app/modules/stock_balance/presentation/bloc/stock_balance_event.dart';
import 'package:appweb/app/modules/stock_balance/presentation/bloc/stock_balance_state.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StockBalanceSalesmanPageMobile extends StatefulWidget {
  const StockBalanceSalesmanPageMobile({super.key});

  @override
  State<StockBalanceSalesmanPageMobile> createState() =>
      StockBalanceSalesmanPageMobileState();
}

class StockBalanceSalesmanPageMobileState
    extends State<StockBalanceSalesmanPageMobile> {
  late final StockBalanceBloc bloc;
  late final ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(infiniteScrolling);
    bloc = Modular.get<StockBalanceBloc>();
    if (bloc.stockBalance.items.isEmpty) {
      bloc.add(
        StockBalanceSalesmanGetListEvent(
          ParamsGetlistStockBalanceModel(
            tbInstitutionId: 0,
            tbSalesmanId: 0,
            tbStockListId: 0,
            page: 0,
            id: 0,
            nameProduct: "",
          ),
        ),
      );
    }
  }

  infiniteScrolling() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      bloc.add(StockBalanceSalesmanGetListEvent(ParamsGetlistStockBalanceModel(
        tbInstitutionId: 0,
        tbSalesmanId: 0,
        tbStockListId: 0,
        page: bloc.pageStockBalance,
        id: 0,
        nameProduct: bloc.search,
      )));
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StockBalanceBloc, StockBalanceState>(
      bloc: bloc,
      listener: (context, state) {},
      builder: (context, state) {
        if (state is StockBalanceLoadingState) {
          return const Center(
            child: CustomCircularProgressIndicator(),
          );
        }

        return Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: kBoxDecorationflexibleSpace,
            ),
            title: Text('Estoque Vendedor - ${bloc.stockBalance.items.length}'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Modular.to.navigate('/stock/mobile/');
              },
            ),
          ),
          body: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  buildSearchInput(),
                  const SizedBox(height: 15),
                  buildListView(),
                ],
              )),
        );
      },
    );
  }

  buildSearchInput() {
    return Container(
      decoration: kBoxDecorationStyle,
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              keyboardType: TextInputType.text,
              autofocus: false,
              initialValue: bloc.search,
              onChanged: (value) {
                bloc.search = value;
                bloc.add(StockBalanceSearchEvent());
              },
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans',
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 10.0),
                hintText: "Pesquise aqui",
                hintStyle: kHintTextStyle,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              hoverColor: Colors.transparent,
              onPressed: () {
                bloc.add(StockBalanceSalesmanGetListEvent(
                    ParamsGetlistStockBalanceModel(
                  tbInstitutionId: 0, //será alterado no envio
                  tbSalesmanId: 0,
                  tbStockListId: 0,
                  page: 0,
                  id: 0,
                  nameProduct: bloc.search,
                )));
              },
              icon: const Icon(
                Icons.search,
                //size: 20.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  buildListView() {
    return Expanded(
      child: bloc.stockBalance.items.isEmpty
          ? const Center(
              child: Text("Não encontramos nenhum registro em nossa base."))
          : ListView.separated(
              controller: _scrollController,
              key: const PageStorageKey<String>('page'),
              itemCount: bloc.stockBalance.items.length,
              itemBuilder: (context, index) => ListTile(
                leading: CircleAvatar(
                  backgroundColor: (Colors.black),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: AutoSizeText(
                      bloc.stockBalance.items[index].tbMerchandiseId.toString(),
                      maxLines: 1,
                      style: kLabelAvatarStyle,
                    ),
                  ),
                ),
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        flex: 3,
                        child: Text(
                            bloc.stockBalance.items[index].nameMerchandise)),
                    const SizedBox(height: 5.0),
                    Expanded(
                      flex: 1,
                      child: Text(
                        bloc.stockBalance.items[index].quantity.toString(),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
              ),
              separatorBuilder: (_, __) => const Divider(),
            ),
    );
  }
}
