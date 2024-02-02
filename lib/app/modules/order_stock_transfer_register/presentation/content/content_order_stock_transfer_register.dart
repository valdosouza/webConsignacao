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
        "Erro ao buscar os dados. Tente novamente mais tarde");
  } else if (state is OrderPostSuccessState) {
    CustomToast.showToast("Cadastro atualizado com sucesso.");
  } else if (state is OrderPutSuccessState) {
    CustomToast.showToast("Cadastro atualizado com sucesso.");
  } else if (state is OrderPostErrorState) {
    CustomToast.showToast(
        "Erro ao atualizar o cadastro. Tente novamente mais tarde.");
  } else if (state is OrderPutErrorState) {
    CustomToast.showToast(
        "Erro editar o cadastro. Tente novamente mais tarde.");
  } else if (state is OrderGetErrorState) {
    CustomToast.showToast(
        "Erro ao buscar os dados do cadastro. Tente novamente mais tarde.");
  }
}

buildSearchInput(OrderStockTransferRegisterBloc bloc) {
  return Container(
    decoration: kBoxDecorationStyle,
    child: TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
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
                  backgroundColor: (Colors.black),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Text(
                      (index + 1).toString(),
                      style: kCircleAvatarTextStyle,
                    ),
                  ),
                ),
                title: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(list[index].nameEntity),
                          const SizedBox(height: 5.0),
                          Text(list[index].dtRecord)
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Situação",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 5.0),
                          Text((list[index].status != "F")
                              ? "Aberta"
                              : "Fechada"),
                        ],
                      ),
                    ),
                  ],
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.remove, color: kSecondaryColor),
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
