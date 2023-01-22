import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/modules/Core/data/model/stock_balance_model.dart';
import 'package:appweb/app/modules/stock_balance/presentation/bloc/stock_balance_bloc.dart';
import 'package:appweb/app/modules/stock_balance/presentation/bloc/stock_balance_event.dart';
import 'package:appweb/app/modules/stock_balance/presentation/bloc/stock_balance_state.dart';

import 'package:flutter/material.dart';

statesStockBalance(StockBalanceState state) {
  if (state is StockBalanceErrorState) {
    CustomToast.showToast(
        "Erro ao buscar os dados. Tente novamente mais tarde");
  }
}

buildSearchInput(StockBalanceBloc bloc) {
  return Container(
    decoration: kBoxDecorationStyle,
    child: TextFormField(
      keyboardType: TextInputType.text,
      autofocus: true,
      onChanged: (value) {
        bloc.add(StockBalanceSalesmanSearchEvent(search: value));
      },
      style: const TextStyle(
        color: Colors.white,
        fontFamily: 'OpenSans',
      ),
      decoration: const InputDecoration(
        border: InputBorder.none,
        contentPadding: EdgeInsets.only(left: 10.0),
        hintText: "Pesquisar balanço de estoque por nome do produto",
        hintStyle: kHintTextStyle,
      ),
    ),
  );
}

buildListView(StockBalanceModel stockBalance) {
  return Expanded(
    child: stockBalance.items.isEmpty
        ? const Center(
            child: Text("Não encontramos nenhum registro em nossa base."))
        : ListView.separated(
            itemCount: stockBalance.items.length,
            itemBuilder: (context, index) => ListTile(
              leading: CircleAvatar(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Text((index + 1).toString()),
                ),
              ),
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(stockBalance.items[index].nameMerchandise),
                  const SizedBox(height: 5.0),
                  Text(stockBalance.items[index].quantity.toString())
                ],
              ),
            ),
            separatorBuilder: (_, __) => const Divider(),
          ),
  );
}
