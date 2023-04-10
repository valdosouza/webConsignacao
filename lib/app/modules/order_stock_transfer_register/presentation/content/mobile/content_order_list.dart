import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/data/model/order_stock_transfer_list_model.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/bloc/bloc.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/bloc/event.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/bloc/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ContentOrderList extends StatefulWidget {
  const ContentOrderList({super.key});

  @override
  State<ContentOrderList> createState() => _ContentOrderListState();
}

class _ContentOrderListState extends State<ContentOrderList> {
  late final OrderStockTransferRegisterBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = Modular.get<OrderStockTransferRegisterBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: kBoxDecorationflexibleSpace,
        ),
        title: const Text('Lista de Carregamentos'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Modular.to.navigate('/stock/mobile/');
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            buildSearchInput(),
            const SizedBox(height: 30.0),
            buildListView(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bloc.add(OrderNewEvent());
        },
        backgroundColor: Colors.black,
        child: const Icon(Icons.add),
      ),
    );
  }

  buildSearchInput() {
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
          hintText: "Pesquise por data",
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }

  buildListView() {
    List<OrderStockTransferListModel> list = bloc.orderStockTransfers;
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
                      child: Text((index + 1).toString()),
                    ),
                  ),
                  title: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Data",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            const SizedBox(height: 5.0),
                            Text(list[index].dtRecord),
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
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      CustomToast.showToast(
                          "Funcionalidade em desenvolvimento.");
                    },
                  ),
                ),
              ),
              separatorBuilder: (_, __) => const Divider(),
            ),
    );
  }
}

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
