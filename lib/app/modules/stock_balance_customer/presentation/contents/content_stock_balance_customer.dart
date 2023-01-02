import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/modules/Core/data/model/stock_balance_model.dart';
import 'package:appweb/app/modules/stock_balance_customer/presentation/bloc/stock_balance_customer_bloc.dart';
import 'package:appweb/app/modules/stock_balance_customer/presentation/bloc/stock_balance_customer_event.dart';
import 'package:appweb/app/modules/stock_balance_customer/presentation/bloc/stock_balance_customer_state.dart';

import 'package:flutter/material.dart';

statesStockBalance(StockBalanceCustomerState state) {
  if (state is StockBalanceCustomerErrorState) {
    CustomToast.showToast(
        "Erro ao buscar balanço cliente de estoque. Tente novamente mais tarde");
  }
}

buildSearchInput(StockBalanceCustomerBloc bloc) {
  return Container(
    decoration: kBoxDecorationStyle,
    child: TextFormField(
      keyboardType: TextInputType.text,
      autofocus: true,
      onChanged: (value) {
        bloc.add(StockBalanceCustomerSearchEvent(search: value));
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
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(stockBalance[index].nameMerchandise),
                  const SizedBox(height: 5.0),
                  Text(stockBalance[index].quantity.toString())
                ],
              ),
            ),
            separatorBuilder: (_, __) => const Divider(),
          ),
  );
}
