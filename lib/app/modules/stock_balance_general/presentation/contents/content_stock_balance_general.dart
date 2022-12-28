import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/modules/Core/data/model/stock_balance_model.dart';
import 'package:appweb/app/modules/stock_balance_general/presentation/bloc/stock_balance_general_state.dart';

import 'package:flutter/material.dart';

statesStockBalance(StockBalanceGeneralState state) {
  if (state is StockBalanceGeneralErrorState) {
    CustomToast.showToast(
        "Erro ao buscar balanço geral de estoque. Tente novamente mais tarde");
  }
}

buildListView(List<StockBalanceModel> stockBalance) {
  return Expanded(
    child: stockBalance.isEmpty
        ? const Center(
            child: Text("Não encontramos nenhum registro em nossa base."))
        : ListView.separated(
            itemCount: stockBalance.length,
            itemBuilder: (context, index) => ListTile(
              leading: CircleAvatar(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Text((index + 1).toString()),
                ),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(stockBalance[index].nameProduct),
                  const SizedBox(height: 5.0),
                  Text(stockBalance[index].quantity.toString())
                ],
              ),
            ),
            separatorBuilder: (_, __) => const Divider(),
          ),
  );
}
