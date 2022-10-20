import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/stock_list_register/data/model/stock_list_model.dart';
import 'package:appweb/app/modules/stock_list_register/presentation/bloc/stock_list_bloc.dart';
import 'package:appweb/app/modules/stock_list_register/presentation/bloc/stock_list_events.dart';
import 'package:appweb/app/modules/stock_list_register/presentation/bloc/stock_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StockListMain extends StatefulWidget {
  const StockListMain({Key? key}) : super(key: key);

  @override
  State<StockListMain> createState() => StockListMaineState();
}

class StockListMaineState extends State<StockListMain> {
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clientes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_add),
            onPressed: () {
              bloc.add(AddStockListEvent(
                  stocklist: const StockListModel(
                      id: 4,
                      institution: 1,
                      description: 'Cliente 3',
                      active: 'S',
                      main: 'N')));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: BlocBuilder<StockListBloc, StockListState>(
            bloc: bloc,
            builder: (context, state) {
              if (state is StockListInitialState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is StockListSuccessState) {
                final stocklists = state.stocklist;
                return Padding(
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
                                    "Não encontramos nenhum cliente em nossa base."))
                            : ListView.separated(
                                itemCount: stocklists.length,
                                itemBuilder: (context, index) => ListTile(
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
                                      bloc.add(RemoveStockListEvent(
                                          stocklist: stocklists[index]));
                                    },
                                  ),
                                ),
                                separatorBuilder: (_, __) => const Divider(),
                              ),
                      ),
                    ],
                  ),
                );
              }
              return Container();
            }),
      ),
    );
  }

  Container _buildSearchInput() {
    return Container(
      decoration: kBoxDecorationStyle,
      child: TextFormField(
        keyboardType: TextInputType.text,
        autofocus: true,
        onChanged: (value) {
          bloc.add(SearchClientEvent(search: value));
        },
        style: const TextStyle(
          color: Colors.white,
          fontFamily: 'OpenSans',
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(left: 10.0),
          hintText: "Pesquise pelo nome do cliente",
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }
}
