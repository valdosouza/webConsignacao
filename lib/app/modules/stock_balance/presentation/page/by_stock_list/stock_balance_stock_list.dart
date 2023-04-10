import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/core/shared/widgets/custom_circular_progress_indicator.dart';
import 'package:appweb/app/modules/stock_balance/data/model/params_get_list_stock_balance_model.dart';
import 'package:appweb/app/modules/stock_balance/presentation/bloc/stock_balance_bloc.dart';
import 'package:appweb/app/modules/stock_balance/presentation/bloc/stock_balance_event.dart';
import 'package:appweb/app/modules/stock_balance/presentation/bloc/stock_balance_state.dart';
import 'package:appweb/app/modules/stock_balance/presentation/page/stock_balance_by_stock_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StockBalanceStockList extends StatefulWidget {
  const StockBalanceStockList({super.key});

  @override
  State<StockBalanceStockList> createState() =>
      _ContentStockBalanceByStockListState();
}

class _ContentStockBalanceByStockListState
    extends State<StockBalanceStockList> {
  late final StockBalanceBloc bloc;

  @override
  void initState() {
    super.initState();

    bloc = Modular.get<StockBalanceBloc>();
    bloc.add(GetStockListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StockBalanceBloc, StockBalanceState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is StockBalanceErrorState) {
          CustomToast.showToast(
              "Erro ao buscar os dados. Tente novamente mais tarde.");
        }
      },
      builder: (context, state) {
        if (state is StockBalanceLoadingState) {
          return const Center(
            child: CustomCircularProgressIndicator(),
          );
        }
        if (state is GetListByStockListLoadedState) {
          return const StockBalanceByStockListPage();
        }

        return Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: kBoxDecorationflexibleSpace,
            ),
            title: const Text('Lista de estoques'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildSearchInput(),
                  const SizedBox(height: 30.0),
                  Expanded(
                    child: bloc.stockListList.isEmpty
                        ? const Center(
                            child: Text(
                                "Não encontramos nenhum registro em nossa base."))
                        : ListView.separated(
                            itemCount: bloc.stockListList.length,
                            itemBuilder: (context, index) => InkWell(
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: (Colors.black),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Text((index + 1).toString()),
                                  ),
                                ),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(bloc.stockListList[index].description),
                                  ],
                                ),
                                trailing: IconButton(
                                  icon: const Icon(Icons.arrow_forward_ios),
                                  onPressed: () {
                                    bloc.add(
                                      StockBalanceGetListEvent(
                                        ParamsGetlistStockBalanceModel(
                                          tbInstitutionId: 0,
                                          tbSalesmanId: 0,
                                          tbStockListId:
                                              bloc.stockListList[index].id,
                                          page: 0,
                                          id: 0,
                                          nameProduct: "",
                                        ),
                                      ),
                                    );
                                    //   bloc.add(StockBalanceGetListEvent(
                                    //       tbStockListId:
                                    //           bloc.stockListList[index].id));
                                  },
                                ),
                              ),
                            ),
                            separatorBuilder: (_, __) => const Divider(),
                          ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Container _buildSearchInput() {
    return Container(
      decoration: kBoxDecorationStyle,
      child: TextFormField(
        keyboardType: TextInputType.text,
        autofocus: false,
        onChanged: (value) {
          bloc.add(StockBalanceSearcheStocksListEvent(search: value));
        },
        style: const TextStyle(
          color: Colors.white,
          fontFamily: 'OpenSans',
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(left: 10.0),
          hintText: "Pesquise pelo nome",
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }
}
