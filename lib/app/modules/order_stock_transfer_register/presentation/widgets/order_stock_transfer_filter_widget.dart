import 'package:appweb/app/modules/order_stock_transfer_register/enum/order_stock_transfer_search_enum.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/presentation/bloc/order_stock_transfer_register_bloc.dart';
import 'package:flutter/material.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({
    Key? key,
    required this.bloc,
  }) : super(key: key);
  final OrderStockTransferRegisterBloc bloc;
  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

int id = 0;

class _FilterWidgetState extends State<FilterWidget> {
  @override
  Widget build(BuildContext context) {
    const defaultTextStyle = TextStyle(fontSize: 15.0);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Radio(
          value: 0,
          groupValue: id,
          onChanged: (val) {
            setState(() {
              id = 0;
              widget.bloc.typeSearch = OrderStockTransferRegisterSearch.date;
            });
          },
        ),
        const Text('Data', style: defaultTextStyle),
        Radio(
          value: 1,
          groupValue: id,
          onChanged: (val) {
            setState(() {
              id = 1;
              widget.bloc.typeSearch = OrderStockTransferRegisterSearch.entity;
            });
          },
        ),
        const Text('Entidade', style: defaultTextStyle),
        Radio(
          value: 2,
          groupValue: id,
          onChanged: (val) {
            setState(() {
              id = 2;
              widget.bloc.typeSearch =
                  OrderStockTransferRegisterSearch.stockOri;
            });
          },
        ),
        const Text('Estoque Ori', style: defaultTextStyle),
        Radio(
          value: 3,
          groupValue: id,
          onChanged: (val) {
            setState(() {
              id = 3;
              widget.bloc.typeSearch =
                  OrderStockTransferRegisterSearch.stockDes;
            });
          },
        ),
        const Text('Estoque Des', style: defaultTextStyle),
      ],
    );
  }
}
