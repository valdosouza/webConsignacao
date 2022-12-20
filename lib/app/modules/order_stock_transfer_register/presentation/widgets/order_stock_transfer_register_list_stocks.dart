// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:appweb/app/modules/order_stock_transfer_register/data/model/stock_list_model.dart';
import 'package:flutter/material.dart';

import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/widgets/search_widget.dart';

class OrderStockTransferRegisterStockListWidget extends StatelessWidget {
  const OrderStockTransferRegisterStockListWidget({
    Key? key,
    required this.stocks,
    this.searchFunction,
    this.onClickItem,
    this.onClose,
    this.orderId,
  }) : super(key: key);

  final List<StockListModel> stocks;
  final int? orderId;
  final Function(String)? searchFunction;
  final Function(StockListModel)? onClickItem;
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
            // SearchWidget(
            //   onChange: (value) => searchFunction?.call(value),
            // ),
            const SizedBox(height: 5.0),
            Expanded(
              child: stocks.isEmpty
                  ? const Center(
                      child:
                          Text("Não encontramos nenhum estoque em nossa base."))
                  : ListView.separated(
                      itemCount: stocks.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          onClickItem?.call(stocks[index]);
                        },
                        child: ListTile(
                          leading: CircleAvatar(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Text(stocks[index].id.toString()),
                            ),
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(stocks[index].description),
                            ],
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
