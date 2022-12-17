import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/widgets/custom_input.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/data/model/order_stock_adjustment_register_model.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/bloc/order_stock_adjustment_register_bloc.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/bloc/order_stock_adjustment_register_event.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/widgets/order_stock_adjustment_register_custom_input_button_widget.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/widgets/order_stock_adjustment_register_direction_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class OrderStockAdjustmentRegisterData extends StatelessWidget {
  const OrderStockAdjustmentRegisterData({
    Key? key,
    required this.orderStockAdjustment,
    required this.bloc,
    required this.controllerDate,
  }) : super(key: key);

  final OrderStockAdjustmentRegisterModel orderStockAdjustment;
  final OrderStockAdjustmentRegisterBloc bloc;
  final MaskedTextController controllerDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomInput(
              title: "Data",
              controller: controllerDate,
              keyboardType: TextInputType.datetime,
              inputAction: TextInputAction.go,
              onChanged: (value) => {orderStockAdjustment.dtRecord = value}),
          const SizedBox(height: 10),
          CustomInput(
              title: "Número",
              initialValue: orderStockAdjustment.number.toString(),
              keyboardType: TextInputType.number,
              inputAction: TextInputAction.go,
              onChanged: (value) =>
                  {orderStockAdjustment.number = int.parse(value)}),
          const SizedBox(height: 10),
          CustomInputButtonWidget(
              bloc: bloc,
              initialValue: orderStockAdjustment.nameEntity,
              event: OrderStockAdjustmentRegisterGetEntityEvent(),
              title: "Descrição da Entidade"),
          const SizedBox(height: 10),
          CustomInputButtonWidget(
              bloc: bloc,
              initialValue: bloc.sotck.description,
              event: OrderStockAdjustmentRegisterGetStocksEvent(
                  tbInstitutionId: 1),
              title: "Descrição do estoque"),
          const SizedBox(height: 10),
          const Text("Direção da Operação", style: kLabelStyle),
          const SizedBox(height: 10),
          OrderStockAdjustmentRegisterDirectionWidget(
              orderStockAdjustment: orderStockAdjustment),
          const SizedBox(height: 10),
          CustomInput(
              title: "Observações",
              maxLines: 10,
              initialValue: orderStockAdjustment.note,
              keyboardType: TextInputType.datetime,
              inputAction: TextInputAction.go,
              onChanged: (value) => {orderStockAdjustment.note = value})
        ],
      ),
    );
  }
}