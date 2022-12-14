import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/modules/stock_list_register/presentation/bloc/stock_list_bloc.dart';
import 'package:appweb/app/modules/stock_list_register/presentation/bloc/stock_list_events.dart';
import 'package:appweb/app/modules/stock_list_register/presentation/bloc/stock_list_state.dart';
import 'package:appweb/app/modules/stock_list_register/presentation/pages/stock_list_interation_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ContentDesktopStockList extends StatefulWidget {
  const ContentDesktopStockList({Key? key}) : super(key: key);

  @override
  State<ContentDesktopStockList> createState() =>
      _ContentDesktopStockListeState();
}

class _ContentDesktopStockListeState extends State<ContentDesktopStockList> {
  // final clientsList = [];
  late final StockListBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = Modular.get<StockListBloc>();
    bloc.add(LoadStockListEvent());
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StockListBloc, StockListState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is StockDeleteSuccessState) {
          CustomToast.showToast("Estoque removido com sucesso.");
        } else if (state is StockListDeleteErrorState) {
          CustomToast.showToast(
              "Erro ao remover o estoque. Tente novamente mais tarde.");
        } else if (state is StockAddSuccessState) {
          CustomToast.showToast("Estoque adicionado com sucesso");
          bloc.add(LoadStockListEvent());
        } else if (state is StockAddErrorState) {
          CustomToast.showToast(
              "Erro ao adicionar o estoque. Tente novamente mais tarde.");
        } else if (state is StockEditSuccessState) {
          CustomToast.showToast("Estoque editado com sucesso");
          bloc.add(LoadStockListEvent());
        } else if (state is StockPutErrorState) {
          CustomToast.showToast(
              "Erro ao editar o estoque. Tente novamente mais tarde.");
        }
      },
      builder: (context, state) {
        if (state is StockListInitialState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is StockListInterationPageState) {
          return StockListInterationPage(
            bloc: bloc,
            stock: state.stock,
          );
        }
        final stocklists = state.stocklist;
        return Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: kBoxDecorationflexibleSpace,
            ),
            title: const Text('Lista de estoque'),
            actions: [
              IconButton(
                icon: const Icon(Icons.person_add),
                onPressed: () {
                  bloc.add(StockListInterationEvent());
                },
              ),
            ],
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
                    child: stocklists.isEmpty
                        ? const Center(
                            child: Text(
                                "N??o encontramos nenhum registros em nossa base."))
                        : ListView.separated(
                            itemCount: stocklists.length,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () => bloc.add(StockListInterationEvent(
                                  stock: stocklists[index])),
                              child: ListTile(
                                leading: CircleAvatar(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child:
                                        Text(stocklists[index].id.toString()),
                                  ),
                                ),
                                title: Text(stocklists[index].description),
                                trailing: IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed: () {
                                    CustomToast.showToast(
                                        "Funcionalidade em desenvolvimento.");
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
        autofocus: true,
        onChanged: (value) {
          bloc.add(SearchStockEvent(search: value));
        },
        style: const TextStyle(
          color: Colors.white,
          fontFamily: 'OpenSans',
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(left: 10.0),
          hintText: "Pesquise estoques",
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }
}
