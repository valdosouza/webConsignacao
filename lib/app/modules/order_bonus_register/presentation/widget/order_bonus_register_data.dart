import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/widgets/custom_input.dart';
import 'package:appweb/app/modules/order_bonus_register/data/model/order_bonus_register_model.dart';
import 'package:appweb/app/modules/order_bonus_register/presentation/bloc/order_bonus_register_bloc.dart';
import 'package:appweb/app/modules/order_bonus_register/presentation/bloc/order_bonus_register_event.dart';
import 'package:appweb/app/modules/order_bonus_register/presentation/widget/order_bonus_register_custom_input_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class OrderBonusRegisterData extends StatelessWidget {
  const OrderBonusRegisterData({
    Key? key,
    required this.orderBonus,
    required this.bloc,
    required this.controllerDate,
  }) : super(key: key);

  final OrderBonusRegisterModel orderBonus;
  final OrderBonusRegisterBloc bloc;
  final MaskedTextController controllerDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomInput(
              readOnly: (bloc.orderBonus.status == "F"),
              title: "Data",
              controller: controllerDate,
              keyboardType: TextInputType.datetime,
              inputAction: TextInputAction.go,
              onChanged: (value) => {orderBonus.dtRecord = value}),
          const SizedBox(height: 10),
          CustomInput(
              readOnly: (bloc.orderBonus.status == "F"),
              title: "Número",
              initialValue: orderBonus.number.toString(),
              keyboardType: TextInputType.number,
              inputAction: TextInputAction.go,
              onChanged: (value) => {orderBonus.number = int.parse(value)}),
          const SizedBox(height: 10),
          CustomInputButtonWidget(
              readOnly: (bloc.orderBonus.status == "F"),
              bloc: bloc,
              initialValue: orderBonus.nameCustomer,
              event: OrderBonusRegisterGetEntityEvent(),
              title: "Descrição da Entidade"),
          const SizedBox(height: 10),
          CustomInputButtonWidget(
              readOnly: (bloc.orderBonus.status == "F"),
              bloc: bloc,
              initialValue: bloc.stock.description,
              event: OrderBonusRegisterGetStocksEvent(),
              title: "Descrição do estoque"),
          const SizedBox(height: 10),
          const Text("Direção da Operação", style: kLabelStyle),
          const SizedBox(height: 10),
          const SizedBox(height: 10),
          CustomInput(
              readOnly: (bloc.orderBonus.status == "F"),
              title: "Observações",
              maxLines: 10,
              initialValue: orderBonus.note,
              keyboardType: TextInputType.datetime,
              inputAction: TextInputAction.go,
              onChanged: (value) => {orderBonus.note = value})
        ],
      ),
    );
  }
}
