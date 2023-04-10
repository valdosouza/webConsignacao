import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/core/shared/widgets/custom_imput_button.dart';
import 'package:appweb/app/core/shared/widgets/custom_input.dart';
import 'package:appweb/app/modules/order_sale_register/order_sale_register_module.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/bloc/order_sale_register_bloc.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/bloc/order_sale_register_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ContentOrderSaleRegisterEditItem extends StatefulWidget {
  const ContentOrderSaleRegisterEditItem({
    Key? key,
  }) : super(key: key);

  @override
  State<ContentOrderSaleRegisterEditItem> createState() =>
      _ContentOrderSaleRegisterEditItemState();
}

class _ContentOrderSaleRegisterEditItemState
    extends State<ContentOrderSaleRegisterEditItem> {
  late final OrderSaleRegisterBloc bloc;
  @override
  void initState() {
    super.initState();
    bloc = Modular.get<OrderSaleRegisterBloc>();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<OrderSaleRegisterModule>();
    });
  }

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
            bloc.tabIndex = 1;
            bloc.add(OrderReturnMasterEvent());
          },
        ),
        title: Text(
          bloc.orderItem.tbProductId == 0 ? "Adicionar Item" : "Editar Item",
          style: kHintTextStyle.copyWith(fontSize: 20.0),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.check,
              size: 30.0,
            ),
            onPressed: () {
              if (bloc.orderItem.quantity == 0) {
                CustomToast.showToast("A quantidade não pode ser zero.");
              } else {
                bloc.tabIndex = 1;
                bloc.add(OrderItemUpdateEvent());
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
            CustomInputButton(
              initialValue: bloc.orderItem.nameProduct,
              title: "Descrição do item",
              suffixIcon: const Icon(
                Icons.search,
                size: 20.0,
                color: Colors.white,
              ),
              onAction: (() => {bloc.add(ProductsGetEvent())}),
            ),
            const SizedBox(height: 10),
            CustomInput(
                title: "Código produto",
                readOnly: true,
                initialValue: bloc.orderItem.tbProductId.toString(),
                keyboardType: TextInputType.number,
                inputAction: TextInputAction.go,
                onChanged: (value) =>
                    {bloc.orderItem.tbProductId = int.parse(value)}),
            const SizedBox(height: 10),
            CustomInput(
                title: "Quantidade",
                initialValue: bloc.orderItem.quantity.toString(),
                keyboardType: TextInputType.number,
                inputAction: TextInputAction.go,
                onChanged: (value) =>
                    {bloc.orderItem.quantity = double.parse(value)})
          ],
        ),
      ),
    );
  }
}
