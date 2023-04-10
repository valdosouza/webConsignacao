import 'package:appweb/app/core/shared/widgets/custom_imput_button.dart';
import 'package:appweb/app/core/shared/widgets/custom_input.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/order_stock_transfer_register_module.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/bloc/bloc.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/bloc/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ContentOrderStockTransferRegisterMaster extends StatefulWidget {
  const ContentOrderStockTransferRegisterMaster({
    Key? key,
  }) : super(key: key);

  @override
  State<ContentOrderStockTransferRegisterMaster> createState() =>
      _ContentOrderStockTransferRegisterMasterState();
}

class _ContentOrderStockTransferRegisterMasterState
    extends State<ContentOrderStockTransferRegisterMaster> {
  late final OrderStockTransferRegisterBloc bloc;
  @override
  void initState() {
    super.initState();
    bloc = Modular.get<OrderStockTransferRegisterBloc>();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<OrderStockTransferRegisterModule>();
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
            initialValue: bloc.orderMain.order.nameStockListOri,
            title: "Descrição do estoque de Origem",
            onAction: (() => {
                  (bloc.orderMain.order.status != "F")
                      ? bloc.add(StocksGetEvent(type: "Origem"))
                      : null
                }),
          ),
          const SizedBox(height: 10),
          CustomInputButton(
            initialValue: bloc.orderMain.order.nameStockListDes,
            title: "Descrição do estoque de Destino",
            onAction: (() => {
                  (bloc.orderMain.order.status != "F")
                      ? bloc.add(StocksGetEvent(type: "Destino"))
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
