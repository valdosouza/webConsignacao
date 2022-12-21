// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/data/model/order_stock_transfer_register_order_model.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/widgets/order_stock_transfer_generic_suffix_field.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/widgets/order_stock_transfer_register_custom_input_button_generic_widget.dart';
import 'package:flutter/material.dart';

class OrderStockTransferRegisterEditItemWidget extends StatefulWidget {
  const OrderStockTransferRegisterEditItemWidget({
    Key? key,
    this.item,
    this.searchFunction,
    this.onSave,
    this.onClose,
    this.orderId,
  }) : super(key: key);

  final Item? item;
  final int? orderId;
  final Function(String)? searchFunction;
  final Function(Item)? onSave;
  final Function()? onClose;

  @override
  State<OrderStockTransferRegisterEditItemWidget> createState() =>
      _OrderStockTransferRegisterEditItemWidgetState();
}

TextEditingController idController = TextEditingController();
TextEditingController descriptionController = TextEditingController();
TextEditingController quantityController = TextEditingController();

class _OrderStockTransferRegisterEditItemWidgetState
    extends State<OrderStockTransferRegisterEditItemWidget> {
  @override
  void initState() {
    super.initState();
    idController.text = widget.item?.id.toString() ?? '';
    descriptionController.text = widget.item?.description.toString() ?? '';
    quantityController.text = widget.item?.quantity.toString() ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: kBoxDecorationflexibleSpace,
        ),
        title: widget.item == null
            ? const Text('Adicionar Item')
            : const Text('Editar Item'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => widget.onClose?.call(),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.check,
              size: 30.0,
            ),
            onPressed: () => widget.onSave?.call(
              Item(
                id: widget.item?.id ?? 0,
                tbInstitutionId: 1,
                tbOrderId: widget.item?.tbOrderId,
                tbProductId: widget.item?.id ?? 0,
                description: descriptionController.text,
                quantity: quantityController.text,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomInputButtonGenericWidget(
              enabled: true,
              title: "Codigo",
              width: 100,
              controller: idController,
              textInputType: TextInputType.number,
              textInputAction: TextInputAction.go,
              suffixIcon: OrderStockTransferRegisterGenericSuffixField(
                icon: Icons.search,
                onPressed: () => widget.searchFunction?.call(''),
              ),
            ),
            const SizedBox(height: 10.0),
            CustomInputButtonGenericWidget(
              enabled: false,
              title: "Descricão",
              controller: descriptionController,
              textInputType: TextInputType.number,
              textInputAction: TextInputAction.go,
            ),
            const SizedBox(height: 10.0),
            CustomInputButtonGenericWidget(
              enabled: true,
              width: 150,
              title: "Quantidade",
              controller: quantityController,
              textInputType: TextInputType.number,
              textInputAction: TextInputAction.go,
            ),
          ],
        ),
      ),
    );
  }
}
