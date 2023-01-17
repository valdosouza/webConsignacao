import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/data/model/order_stock_transfer_list_model.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/bloc/order_stock_transfer_register_bloc.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/bloc/order_stock_transfer_register_event.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/bloc/order_stock_transfer_register_state.dart';
import 'package:flutter/material.dart';

statesOrderStockTransfer(OrderStockTransferRegisterState state) {
  if (state is OrderGetErrorState) {
    CustomToast.showToast(
        "Erro ao buscar ordem de transferência de estoque. Tente novamente mais tarde");
  } else if (state is OrderPostSuccessState) {
    CustomToast.showToast(
        "Ordem de transferência de estoque adicionada com sucesso.");
  } else if (state is OrderPutSuccessState) {
    CustomToast.showToast(
        "Ordem de transferência de estoque editada com sucesso.");
  } else if (state is OrderPostErrorState) {
    CustomToast.showToast(
        "Ocorreu um erro ao adicionar a ordem de transferência de estoque. Tente novamente mais tarde.");
  } else if (state is OrderPutErrorState) {
    CustomToast.showToast(
        "Ocorreu um erro ao editar ordem de transferência de estoque. Tente novamente mais tarde.");
  } else if (state is OrderGetErrorState) {
    CustomToast.showToast(
        "Ocorreu um erro ao buscar os dados da ordem de transferência de estoque. Tente novamente mais tarde.");
  }
}

buildSearchInput(OrderStockTransferRegisterBloc bloc) {
  return Container(
    decoration: kBoxDecorationStyle,
    child: TextFormField(
      keyboardType: TextInputType.text,
      autofocus: true,
      onChanged: (value) {
        bloc.search = value;
        bloc.add(OrderSearchEvent());
      },
      style: const TextStyle(
        color: Colors.white,
        fontFamily: 'OpenSans',
      ),
      decoration: const InputDecoration(
        border: InputBorder.none,
        contentPadding: EdgeInsets.only(left: 10.0),
        hintText:
            "Pesquise a Ordem de transferência de estoque por Nome do Produto, data ou estoque",
        hintStyle: kHintTextStyle,
      ),
    ),
  );
}

buildListView(OrderStockTransferRegisterBloc bloc,
    List<OrderStockTransferListModel> list) {
  return Expanded(
    child: list.isEmpty
        ? const Center(
            child: Text("Não encontramos nenhum registro em nossa base."))
        : ListView.separated(
            itemCount: list.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                bloc.orderStockTransList = list[index];
                bloc.add(OrderGetEvent());
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
                    Text(list[index].nameEntity),
                    const SizedBox(height: 5.0),
                    Text(list[index].dtRecord)
                  ],
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    CustomToast.showToast("Funcionalidade em desenvolvimento.");
                  },
                ),
              ),
            ),
            separatorBuilder: (_, __) => const Divider(),
          ),
  );
}
