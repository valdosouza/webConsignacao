import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/modules/order_production_register/data/model/order_production_register_model.dart';
import 'package:appweb/app/modules/order_production_register/presentation/bloc/order_production_register_bloc.dart';
import 'package:appweb/app/modules/order_production_register/presentation/bloc/order_production_register_event.dart';
import 'package:appweb/app/modules/order_production_register/presentation/bloc/order_production_register_state.dart';
import 'package:flutter/material.dart';

statesOrderProductions(OrderProductionRegisterState state) {
  if (state is OrderProductionRegisterErrorState) {
    CustomToast.showToast(
        "Erro ao buscar ordem de produção. Tente novamente mais tarde");
  } else if (state is OrderProductionRegisterPostSuccessState) {
    CustomToast.showToast("Ordem de produção adicionada com sucesso.");
  } else if (state is OrderProductionRegisterPutSuccessState) {
    CustomToast.showToast("Ordem de produção editada com sucesso.");
  } else if (state is OrderProductionRegisterPostErrorState) {
    CustomToast.showToast(
        "Ocorreu um erro ao adicionar a ordem de produção. Tente novamente mais tarde.");
  } else if (state is OrderProductionRegisterPutErrorState) {
    CustomToast.showToast(
        "Ocorreu um erro ao editar ordem de produção. Tente novamente mais tarde.");
  } else if (state is OrderProductionRegisterGetErrorState) {
    CustomToast.showToast(
        "Ocorreu um erro ao buscar os dados da ordem de produção. Tente novamente mais tarde.");
  }
}

buildSearchInput(OrderProductionRegisterBloc bloc) {
  return Container(
    decoration: kBoxDecorationStyle,
    child: TextFormField(
      keyboardType: TextInputType.text,
      autofocus: true,
      onChanged: (value) {
        bloc.add(OrderProductionRegisterSearchEvent(search: value));
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
                bloc.edit = true;
                bloc.add(OrderProductionRegisterDesktopEvent(
                    model: orderProductions[index]));
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
                    Text(orderProductions[index].nameMerchandise),
                    const SizedBox(height: 5.0),
                    Text(orderProductions[index].dtRecord)
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
