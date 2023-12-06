import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/modules/order_load_card_register/domain/usecase/get_new_order_load_card.dart';
import 'package:appweb/app/modules/order_load_card_register/presentation/bloc/order_load_card_register_bloc.dart';
import 'package:appweb/app/modules/order_load_card_register/presentation/bloc/order_load_card_register_event.dart';
import 'package:appweb/app/modules/order_load_card_register/presentation/bloc/order_load_card_register_state.dart';
import 'package:flutter/material.dart';

statesOrderLoadCard(OrderLoadCardRegisterState state) {
  if (state is OrderLoadCardGetListErrorState) {
    CustomToast.showToast(
        "Erro ao buscar os dados. Tente novamente mais tarde");
  } else if (state is OrderLoadCardGetListErrorState) {
    CustomToast.showToast(state.error);
  } else if (state is OrderClosureSuccessState) {
    CustomToast.showToast("Registro Encerrado com sucesso");
  } else if (state is OrderClosureErrorState) {
    CustomToast.showToast("Erro ao encerrar o registro");
  }
}

buildSearchInput(OrderLoadCardRegisterBloc bloc) {
  return Container(
    decoration: kBoxDecorationStyle,
    child: TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      onChanged: (value) {
        bloc.add(OrderLoadCardRegisterSearchEvent(search: value));
      },
      style: const TextStyle(
        color: Colors.white,
        fontFamily: 'OpenSans',
      ),
      decoration: const InputDecoration(
        border: InputBorder.none,
        contentPadding: EdgeInsets.only(left: 10.0),
        hintText: "Pesquise Ordem de carregamento por usuário",
        hintStyle: kHintTextStyle,
      ),
    ),
  );
}

buildListView(OrderLoadCardRegisterBloc bloc) {
  return Expanded(
    child: bloc.listLoadCard.isEmpty
        ? const Center(
            child: Text("Não encontramos nenhum registro em nossa base."))
        : ListView.separated(
            itemCount: bloc.listLoadCard.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                bloc.modelLoadCard = bloc.listLoadCard[index];
                bloc.add(
                  OrderLoadCardRegisterGetCardEvent(
                    params: ParamsGetNewOrderLoadCard(
                      tbSalesmanId: bloc.listLoadCard[index].tbUserId,
                      dtRecord: "",
                    ),
                  ),
                );
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
                          Text(bloc.listLoadCard[index].nameUser),
                          const SizedBox(height: 5.0),
                          Text(bloc.listLoadCard[index].dtRecord)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            separatorBuilder: (_, __) => const Divider(),
          ),
  );
}
