import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/modules/stock_list_register/presentation/bloc/stock_list_bloc.dart';
import 'package:appweb/app/modules/stock_list_register/presentation/bloc/stock_list_events.dart';
import 'package:appweb/app/modules/stock_list_register/presentation/bloc/stock_list_state.dart';
import 'package:appweb/app/modules/stock_list_register/presentation/page/stock_list_interation_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ContentDesktopStockList extends StatefulWidget {
  const ContentDesktopStockList({super.key});

  @override
  State<ContentDesktopStockList> createState() =>
      _ContentDesktopStockListState();
}

class _ContentDesktopStockListState extends State<ContentDesktopStockList> {
  late final StockListBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = Modular.get<StockListBloc>();
    bloc.add(StockListGetListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StockListBloc, StockListState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is StockListErrorState) {
          CustomToast.showToast(
              "Erro ao buscar a lista. Tente novamente mais tarde.");
        } else if (state is StockListAddSuccessState) {
          CustomToast.showToast("Lista de Preço adicionado com sucesso.");
        } else if (state is StockListAddErrorState) {
          CustomToast.showToast(
              "Erro ao adicionar Lista de preço. Tente novamente mais tarde.");
        } else if (state is StockListEditSuccessState) {
          CustomToast.showToast("Lista de Preço editado com sucesso.");
        } else if (state is StockListEditErrorState) {
          CustomToast.showToast(
              "Erro ao editar Lista de preço. Tente novamente mais tarde.");
        }
      },
      builder: (context, state) {
        if (state is StockListLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (state is StockListInfoPageState) {
            return const StockListInteractionPage();
          }
        }
        final stocks = state.list;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Lista de estoques'),
            actions: [
              IconButton(
                icon: const Icon(Icons.person_add),
                onPressed: () {
                  bloc.add(StockListAddEvent());
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
                    child: stocks.isEmpty
                        ? const Center(
                            child: Text(
                                "Não encontramos nenhum dado em nossa base."))
                        : ListView.separated(
                            itemCount: stocks.length,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                bloc.model = stocks[index];
                                bloc.add(StockListEditEvent());
                              },
                              child: ListTile(
                                leading: CircleAvatar(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Text((index + 1).toString()),
                                  ),
                                ),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(stocks[index].description),
                                  ],
                                ),
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
          bloc.add(StockListSearchEvent(search: value));
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
