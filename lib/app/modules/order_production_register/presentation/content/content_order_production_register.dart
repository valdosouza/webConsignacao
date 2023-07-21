import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/modules/order_production_register/data/model/order_production_register_model.dart';
import 'package:appweb/app/modules/order_production_register/presentation/bloc/order_production_register_bloc.dart';
import 'package:appweb/app/modules/order_production_register/presentation/bloc/order_production_register_event.dart';
import 'package:appweb/app/modules/order_production_register/presentation/bloc/order_production_register_state.dart';
import 'package:flutter/material.dart';

statesOrderProductions(OrderProductionRegisterState state) {
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
  } else if (state is OrderClosureSuccessState) {
    CustomToast.showToast("Registro Encerrado com sucesso");
  } else if (state is OrderClosureErrorState) {
    CustomToast.showToast("Erro ao encerrar o registro");
  } else if (state is OrderReopenSuccessState) {
    CustomToast.showToast("Registro reaberto com sucesso");
  } else if (state is OrderReopenErrorState) {
    CustomToast.showToast("Erro ao reabrir o registro");
  }
}

buildSearchInput(OrderProductionRegisterBloc bloc) {
  return Container(
    decoration: kBoxDecorationStyle,
    child: TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      onChanged: (value) {
        bloc.add(OrderSearchEvent(search: value));
      },
      style: const TextStyle(
        color: Colors.white,
        fontFamily: 'OpenSans',
      ),
      decoration: const InputDecoration(
        border: InputBorder.none,
        contentPadding: EdgeInsets.only(left: 10.0),
        hintText: "Pesquise a Ordem de Produção por Nome do Produto ou data",
        hintStyle: kHintTextStyle,
      ),
    ),
  );
}

buildListView(OrderProductionRegisterBloc bloc,
    List<OrderProductionRegisterModel> orderProductions) {
  return Expanded(
    child: orderProductions.isEmpty
        ? const Center(
            child: Text("Não encontramos nenhum registro em nossa base."))
        : ListView.separated(
            itemCount: orderProductions.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                bloc.orderProduction = orderProductions[index];
                bloc.add(OrderEditEvent());
              },
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: (Colors.black),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Text((index + 1).toString()),
                  ),
                ),
                title: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(orderProductions[index].nameMerchandise),
                          const SizedBox(height: 5.0),
                          Text(orderProductions[index].dtRecord)
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
                          Text((orderProductions[index].status != "F")
                              ? "Aberta"
                              : "Fechada"),
                        ],
                      ),
                    ),
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
