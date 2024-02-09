import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/core/shared/widgets/custom_input.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/data/model/order_stock_adjustment_register_items_model.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/bloc/order_stock_adjustment_register_bloc.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/bloc/order_stock_adjustment_register_event.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/widget/order_stock_adjustment_register_custom_input_button_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class OrderStockAdjustmentRegisterAddItem extends StatelessWidget {
  const OrderStockAdjustmentRegisterAddItem({
    super.key,
    required this.item,
    required this.bloc,
  });

  final OrderStockAdjustmentRegisterItemsModel item;
  final OrderStockAdjustmentRegisterBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: kBoxDecorationflexibleSpace,
        ),
        leading: IconButton(
          icon:
              const Icon(Icons.arrow_back_ios_outlined, color: kSecondaryColor),
          onPressed: () {
            bloc.add(OrderStockAdjustmentRegisterReturnEvent(tabIndex: 1));
          },
        ),
        title: AutoSizeText(
          item.tbProductId == 0 ? "Adicionar Item" : "Editar Item",
          style: kTitleAppBarStyle,
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.check,
              size: 30.0,
            ),
            onPressed: () {
              if (item.quantity == 0) {
                CustomToast.showToast("A quantidade não pode ser zero.");
              } else {
                bloc.add(OrderStockAdjustmentRegisterReturnEvent(
                    tabIndex: 1, item: item));
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomInputButtonWidget(
                bloc: bloc,
                initialValue: item.description,
                event: OrderStockAdjustmentRegisterGetProductsEvent(),
                title: "Descrição do item"),
            const SizedBox(height: 10),
            CustomInput(
                title: "Código",
                readOnly: true,
                initialValue: item.tbProductId.toString(),
                keyboardType: TextInputType.number,
                inputAction: TextInputAction.go,
                onChanged: (value) => {item.tbProductId = int.parse(value)}),
            const SizedBox(height: 10),
            CustomInput(
                title: "Quantidade",
                initialValue: item.quantity.toString(),
                keyboardType: TextInputType.number,
                inputAction: TextInputAction.go,
                onChanged: (value) => {item.quantity = double.parse(value)})
          ],
        ),
      ),
    );
  }
}
