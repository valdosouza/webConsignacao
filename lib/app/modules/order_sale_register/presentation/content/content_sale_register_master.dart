import 'package:appweb/app/core/shared/widgets/custom_imput_button.dart';
import 'package:appweb/app/core/shared/widgets/custom_input.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/bloc/order_sale_register_bloc.dart';
import 'package:appweb/app/modules/order_sale_register/order_sale_register_module.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/bloc/order_sale_register_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ContentOrderSaleRegisterMaster extends StatefulWidget {
  const ContentOrderSaleRegisterMaster({
    Key? key,
  }) : super(key: key);

  @override
  State<ContentOrderSaleRegisterMaster> createState() =>
      _ContentOrderSaleRegisterMasterState();
}

class _ContentOrderSaleRegisterMasterState
    extends State<ContentOrderSaleRegisterMaster> {
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
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomInput(
            title: "Data",
            controller: MaskedTextController(
                mask: '00/00/0000', text: bloc.orderMain.order.dtRecord),
            keyboardType: TextInputType.datetime,
            inputAction: TextInputAction.go,
            onChanged: null,
            readOnly: true,
          ),
          const SizedBox(height: 10),
          CustomInput(
              readOnly: (bloc.orderMain.order.status == "F"),
              title: "Número",
              initialValue: bloc.orderMain.order.number.toString(),
              keyboardType: TextInputType.number,
              inputAction: TextInputAction.go,
              onChanged: (value) =>
                  {bloc.orderMain.order.number = int.parse(value)}),
          const SizedBox(height: 10),
          CustomInputButton(
            readOnly: (bloc.orderMain.order.status != "F"),
            initialValue: bloc.orderMain.order.nameEntity,
            title: "Descrição da Entidade",
            suffixIcon: const Icon(
              Icons.search,
              size: 20.0,
              color: Colors.white,
            ),
            onAction: (() => {
                  (bloc.orderMain.order.status != "F")
                      ? bloc.add(EntitiesGetEvent())
                      : null
                }),
          ),
          const SizedBox(height: 10),
          CustomInputButton(
            initialValue: bloc.orderMain.order.nameStockList,
            title: "Descrição do estoque",
            onAction: (() => {
                  (bloc.orderMain.order.status != "F")
                      ? bloc.add(StocksGetEvent())
                      : null
                }),
          ),
          const SizedBox(height: 10),
          CustomInput(
              readOnly: (bloc.orderMain.order.status == "F"),
              title: "Observações",
              maxLines: 10,
              initialValue: bloc.orderMain.order.note,
              keyboardType: TextInputType.datetime,
              inputAction: TextInputAction.go,
              onChanged: (value) => bloc.orderMain.order.note = value)
        ],
      ),
    );
  }
}
