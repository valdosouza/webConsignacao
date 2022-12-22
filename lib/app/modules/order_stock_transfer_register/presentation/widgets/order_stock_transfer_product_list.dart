// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/Core/domain/entity/product_model.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/widgets/search_widget.dart';
import 'package:flutter/material.dart';

class OrderStockTransferRegisterProductsListWidget extends StatelessWidget {
  const OrderStockTransferRegisterProductsListWidget({
    Key? key,
    required this.products,
    this.searchFunction,
    this.onClickItem,
    this.onClose,
    this.orderId,
  }) : super(key: key);

  final List<ProductModel> products;
  final int? orderId;
  final Function(String)? searchFunction;
  final Function(ProductModel)? onClickItem;
  final Function()? onClose;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: kBoxDecorationflexibleSpace,
        ),
        title: const Text('Lista de Produtos'),
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
              child: products.isEmpty
                  ? const Center(
                      child:
                          Text("Não encontramos nenhum estoque em nossa base."))
                  : ListView.separated(
                      itemCount: products.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          onClickItem?.call(products[index]);
                        },
                        child: ListTile(
                          leading: CircleAvatar(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Text(products[index].id.toString()),
                            ),
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(products[index].description),
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
