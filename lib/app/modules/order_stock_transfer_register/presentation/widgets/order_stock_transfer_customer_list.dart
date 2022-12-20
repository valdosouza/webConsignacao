import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/data/model/entity_list_model.dart';
import 'package:flutter/material.dart';

class OrderStockCustomerList extends StatelessWidget {
  const OrderStockCustomerList({
    Key? key,
    required this.customers,
    this.onClickItem,
  }) : super(key: key);
  final List<CustomerListModel> customers;
  final Function(CustomerListModel)? onClickItem;
  @override
  Widget build(BuildContext context) {
    return customers.isEmpty
        ? const Center(
            child: Text("Não encontramos nenhum registro em nossa base."))
        : ListView.separated(
            itemCount: customers.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () => onClickItem?.call(customers[index]),
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
                    Text("Nome: ${customers[index].nameCompany}"),
                    const SizedBox(height: 5.0),
                    customers[index].docType == "J"
                        ? Text("CNPJ: ${customers[index].documento}")
                        : Text("CPF: ${customers[index].documento}"),
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
          );
  }
}
