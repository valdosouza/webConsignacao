import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/modules/order_bonus_register/data/model/order_bonus_register_model.dart';
import 'package:appweb/app/modules/order_bonus_register/presentation/bloc/order_bonus_register_bloc.dart';
import 'package:appweb/app/modules/order_bonus_register/presentation/bloc/order_bonus_register_event.dart';
import 'package:appweb/app/modules/order_bonus_register/presentation/bloc/order_bonus_register_state.dart';
import 'package:flutter/material.dart';

statesOrderBonuss(OrderBonusRegisterState state) {
  if (state is OrderBonusRegisterErrorState) {
    CustomToast.showToast(
        "Erro ao buscar os dados. Tente novamente mais tarde");
  } else if (state is OrderBonusRegisterPostSuccessState) {
    CustomToast.showToast("Cadastro atualizado com sucesso.");
  } else if (state is OrderBonusRegisterPutSuccessState) {
    CustomToast.showToast("Cadastro atualizado com sucesso.");
  } else if (state is OrderBonusRegisterPostErrorState) {
    CustomToast.showToast(
        "Erro ao atualizar o cadastro. Tente novamente mais tarde.");
  } else if (state is OrderBonusRegisterPutErrorState) {
    CustomToast.showToast(
        "Erro editar o cadastro. Tente novamente mais tarde.");
  } else if (state is OrderBonusRegisterGetErrorState) {
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

buildSearchInput(OrderBonusRegisterBloc bloc) {
  return Container(
    decoration: kBoxDecorationStyle,
    child: TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      onChanged: (value) {
        bloc.add(OrderBonusRegisterSearchEvent(search: value));
      },
      style: const TextStyle(
        color: Colors.white,
        fontFamily: 'OpenSans',
      ),
      decoration: const InputDecoration(
        border: InputBorder.none,
        contentPadding: EdgeInsets.only(left: 10.0),
        hintText: "Pesquise a Ordem de Bonificação por Nome do Produto, data ",
        hintStyle: kHintTextStyle,
      ),
    ),
  );
}

buildListView(
    OrderBonusRegisterBloc bloc, List<OrderBonusRegisterModel> orderBonus) {
  return Expanded(
    child: orderBonus.isEmpty
        ? const Center(
            child: Text("Não encontramos nenhum registro em nossa base."))
        : ListView.separated(
            itemCount: orderBonus.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                bloc.edit = true;
                bloc.add(
                    OrderBonusRegisterDesktopEvent(model: orderBonus[index]));
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
                          Text(orderBonus[index].nameCustomer),
                          const SizedBox(height: 5.0),
                          Text(orderBonus[index].dtRecord)
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
                          Text((orderBonus[index].status != "F")
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
