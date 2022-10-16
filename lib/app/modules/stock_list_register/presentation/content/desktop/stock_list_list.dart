import 'package:flutter/material.dart';

class StockListList extends StatelessWidget {
  const StockListList({super.key});

  @override
  Widget build(BuildContext context) {
    /*
    final bloc = Modular.get<StockListBloc>();
    bloc.getlist(1);

    return BlocBuilder<StockListBloc, StockListState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is StockListInitialState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is StockListSuccessState) {
            final stockList = state.stocklist;
            return ListView.separated(
              itemCount: stockList.length,
              itemBuilder: (context, index) => ListTile(
                leading: CircleAvatar(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Text(stockList[index].id.toString()),
                  ),
                ),
                title: Text(stockList[index].description),
                trailing: IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    bloc.add(RemoveStockListEvent(stocklist: stockList[index]));
                  },
                ),
              ),
              separatorBuilder: (_, __) => const Divider(),
            );
          }
          return Container();
        });*/
    return Container();
  }
}
