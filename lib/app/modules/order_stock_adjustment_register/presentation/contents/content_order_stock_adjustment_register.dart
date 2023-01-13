import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/data/model/order_stock_adjustment_register_model.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/bloc/order_stock_adjustment_register_bloc.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/bloc/order_stock_adjustment_register_event.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/bloc/order_stock_adjustment_register_state.dart';
import 'package:flutter/material.dart';

statesOrderStockAdjustments(OrderStockAdjustmentRegisterState state) {
  if (state is OrderStockAdjustmentRegisterErrorState) {
    CustomToast.showToast(
        "Erro ao buscar ordem de ajuste de estoque. Tente novamente mais tarde");
  } else if (state is OrderStockAdjustmentRegisterPostSuccessState) {
    CustomToast.showToast("Ordem de ajuste de estoque adicionada com sucesso.");
  } else if (state is OrderStockAdjustmentRegisterPutSuccessState) {
    CustomToast.showToast("Ordem de ajuste de estoque editada com sucesso.");
  } else if (state is OrderStockAdjustmentRegisterPostErrorState) {
    CustomToast.showToast(
        "Ocorreu um erro ao adicionar a ordem de ajuste de estoque. Tente novamente mais tarde.");
  } else if (state is OrderStockAdjustmentRegisterPutErrorState) {
    CustomToast.showToast(
        "Ocorreu um erro ao editar ordem de ajuste de estoque. Tente novamente mais tarde.");
  } else if (state is OrderStockAdjustmentRegisterGetErrorState) {
    CustomToast.showToast(
        "Ocorreu um erro ao buscar os dados da ordem de ajuste de estoque. Tente novamente mais tarde.");
  }
}

buildSearchInput(OrderStockAdjustmentRegisterBloc bloc) {
  return Container(
    decoration: kBoxDecorationStyle,
    child: TextFormField(
      keyboardType: TextInputType.text,
      autofocus: true,
      onChanged: (value) {
        bloc.add(OrderStockAdjustmentRegisterSearchEvent(search: value));
      },
      style: const TextStyle(
        color: Colors.white,
        fontFamily: 'OpenSans',
      ),
      decoration: const InputDecoration(
        border: InputBorder.none,
        contentPadding: EdgeInsets.only(left: 10.0),
        hintText:
            "Pesquise a Ordem de ajuste de estoque por Nome do Produto, data ou estoque",
        hintStyle: kHintTextStyle,
      ),
    ),
  );
}

buildListView(OrderStockAdjustmentRegisterBloc bloc,
    List<OrderStockAdjustmentRegisterModel> orderStockAdjustment) {
  return Expanded(
    child: orderStockAdjustment.isEmpty
        ? const Center(
            child: Text("Não encontramos nenhum registro em nossa base."))
        : ListView.separated(
            itemCount: orderStockAdjustment.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                bloc.edit = true;
                bloc.add(OrderStockAdjustmentRegisterDesktopEvent(
                    model: orderStockAdjustment[index]));
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
                    Text(orderStockAdjustment[index].nameEntity),
                    const SizedBox(height: 5.0),
                    Text(orderStockAdjustment[index].dtRecord)
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
