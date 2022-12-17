import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/widgets/custom_input.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/data/model/order_stock_adjustment_register_items_model.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/bloc/order_stock_adjustment_register_bloc.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/bloc/order_stock_adjustment_register_event.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/widgets/order_stock_adjustment_register_custom_input_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderStockAdjustmentRegisterAddItem extends StatelessWidget {
  const OrderStockAdjustmentRegisterAddItem({
    Key? key,
    required this.item,
    required this.bloc,
  }) : super(key: key);

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
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  bloc.add(OrderStockAdjustmentRegisterReturnEvent(tabIndex: 1));
                },
              ),
              title: Text(
                item.tbProductId == 0
                    ? "Editar Item"
                    : "Adicionar Item",
                style: kHintTextStyle.copyWith(fontSize: 20.0),
              ),
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.check,
                    size: 30.0,
                  ),
                  onPressed: () {
                    
                  
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
                initialValue: item.nameProduct,
                event: OrderStockAdjustmentRegisterGetEntityEvent(),
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
                onChanged: (value) => {item.quantity = int.parse(value)})
          ],
        ),
      ),
    );
  }
}
