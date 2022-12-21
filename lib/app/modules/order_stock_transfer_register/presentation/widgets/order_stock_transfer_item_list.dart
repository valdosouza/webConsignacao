import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/bloc/order_stock_transfer_register_bloc.dart';
import 'package:flutter/material.dart';

class OrderStockTransferItemList extends StatelessWidget {
  const OrderStockTransferItemList({
    Key? key,
    required this.bloc,
  }) : super(key: key);
  final OrderStockTransferRegisterBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: kBoxDecorationflexibleSpace,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            if (bloc.order?.order.id != null) {
              bloc.add(
                OrderStockTransferRegisterGetEvent(
                  id: bloc.order!.order.id,
                ),
              );
            }
          },
        ),
        title: Text(
          bloc.isEditing
              ? "Adicionar Ordem de Transferencia de Estoque"
              : "Editar Ordem de Transferencia de Estoque",
          style: kHintTextStyle.copyWith(fontSize: 20.0),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.add,
              size: 30.0,
            ),
            onPressed: () {
              print('ADD ITEM');
            },
          ),
          const SizedBox(
            width: 30,
          ),
          IconButton(
            icon: const Icon(
              Icons.check,
              size: 30.0,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: const [
                Text('CODIGO'),
                Text('DESCRIÇÃO'),
                Text('QTDE'),
              ],
            ),
            const SizedBox(height: 5.0),
            Expanded(
              child: bloc.order?.items == null
                  ? const Center(
                      child: Text(
                          "Não encontramos nenhum registro em nossa base."))
                  : ListView.separated(
                      itemCount: bloc.order?.items?.length ?? 0,
                      itemBuilder: (context, index) => InkWell(
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
                              Text("Nome: ${bloc.order?.items?[index].id}"),
                              const SizedBox(height: 5.0),
                              Text(bloc.order?.items?[index].description ?? ''),
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
            ),
          ],
        ),
      ),
    );
  }
}
