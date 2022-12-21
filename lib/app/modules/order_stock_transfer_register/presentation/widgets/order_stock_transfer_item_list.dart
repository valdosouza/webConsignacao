import 'package:appweb/app/core/shared/theme.dart';
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
              ? "Adicionar Item de Estoque"
              : "Editar Item de Estoque",
          style: kHintTextStyle.copyWith(fontSize: 20.0),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.add,
              size: 30.0,
            ),
            onPressed: () {
              bloc.add(
                const OrderStockTransferRegisterEditItemPageEvent(
                  item: null,
                ),
              );
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
            onPressed: () {
              if (bloc.order != null) {
                bloc.isEditing
                    ? bloc.add(
                        OrderStockTransferRegisterPutEvent(
                          model: bloc.order!,
                        ),
                      )
                    : bloc.add(
                        OrderStockTransferRegisterPostEvent(
                          model: bloc.order!,
                        ),
                      );
              }
            },
          ),
        ],
      ),
      body: DataTable(
        columns: const [
          DataColumn(
            label: Expanded(
              child: Text(
                'Código',
                style: kLabelStyle,
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                'Descrição',
                style: kLabelStyle,
              ),
            ),
          ),
          DataColumn(
            numeric: true,
            label: Expanded(
              child: Text(
                'Qtde',
                style: kLabelStyle,
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                '',
              ),
            ),
          ),
        ],
        rows: bloc.order!.items!.map(
          (e) {
            final index = bloc.order!.items!.indexOf(e);
            return DataRow(
              cells: [
                DataCell(
                  Text(
                    bloc.order!.items![index].id.toString(),
                  ),
                ),
                DataCell(
                  Text(bloc.order!.items![index].description),
                ),
                DataCell(
                  Text(bloc.order!.items![index].quantity ?? '0'),
                ),
                DataCell(
                  const Icon(Icons.edit),
                  onTap: () {
                    bloc.add(
                      OrderStockTransferRegisterEditItemPageEvent(
                        item: bloc.order!.items![index],
                      ),
                    );
                  },
                ),
              ],
            );
          },
        ).toList(),
      ),
    );
  }
}
