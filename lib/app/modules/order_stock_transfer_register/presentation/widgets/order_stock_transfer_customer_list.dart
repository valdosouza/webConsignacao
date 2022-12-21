import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/data/model/entity_list_model.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/widgets/search_widget.dart';
import 'package:flutter/material.dart';

class OrderStockCustomerList extends StatelessWidget {
  const OrderStockCustomerList({
    Key? key,
    required this.customers,
    this.searchFunction,
    this.onClose,
    this.onClickItem,
  }) : super(key: key);
  final List<CustomerListModel> customers;
  final Function(CustomerListModel)? onClickItem;
  final Function(String)? searchFunction;
  final Function()? onClose;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: kBoxDecorationflexibleSpace,
        ),
        title: const Text('Lista de estoques'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => onClose?.call(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SearchWidget(
              onChange: (value) => searchFunction?.call(value),
            ),
            const SizedBox(height: 5.0),
            Expanded(
              child: customers.isEmpty
                  ? const Center(
                      child: Text(
                          "Não encontramos nenhum registro em nossa base."))
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
