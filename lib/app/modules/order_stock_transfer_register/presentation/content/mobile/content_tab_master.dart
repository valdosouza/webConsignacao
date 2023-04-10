import 'package:appweb/app/core/shared/widgets/custom_input.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/order_stock_transfer_register_module.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ContentTabMaster extends StatefulWidget {
  const ContentTabMaster({
    Key? key,
  }) : super(key: key);

  @override
  State<ContentTabMaster> createState() => _ContentTabMasterState();
}

class _ContentTabMasterState extends State<ContentTabMaster> {
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
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      //width: size.width,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
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
                  title: "Observações",
                  maxLines: 10,
                  initialValue: bloc.orderMain.order.note,
                  keyboardType: TextInputType.multiline,
                  inputAction: TextInputAction.go,
                  onChanged: (value) => bloc.orderMain.order.note = value)
            ],
          ),
        ),
      ),
    );
  }
}
