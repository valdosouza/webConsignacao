// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:appweb/app/modules/order_stock_adjustment_register/data/model/order_stock_adjustment_register_model.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/bloc/order_stock_adjustment_register_bloc.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/bloc/order_stock_adjustment_register_event.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/presentation/bloc/order_stock_adjustment_register_state.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:appweb/app/core/shared/theme.dart';

class OrderStockAdjustmentRegisterEntitiesListWidget extends StatefulWidget {
  final OrderStockAdjustmentRegisterModel orderStockAdjustment;
  const OrderStockAdjustmentRegisterEntitiesListWidget({
    super.key,
    required this.orderStockAdjustment,
  });

  @override
  State<OrderStockAdjustmentRegisterEntitiesListWidget> createState() =>
      OrderStockAdjustmentRegisterEntitiesListWidgetState();
}

class OrderStockAdjustmentRegisterEntitiesListWidgetState
    extends State<OrderStockAdjustmentRegisterEntitiesListWidget> {
  late final OrderStockAdjustmentRegisterBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = Modular.get<OrderStockAdjustmentRegisterBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderStockAdjustmentRegisterBloc,
        OrderStockAdjustmentRegisterState>(
      bloc: bloc,
      builder: (context, state) {
        if (state is OrderStockAdjustmentRegisterEntitySuccessState) {
          return _orderStockAdjustmentEntitiesList(state);
        } else {
          return Container();
        }
      },
    );
  }

  Scaffold _orderStockAdjustmentEntitiesList(
      OrderStockAdjustmentRegisterEntitySuccessState state) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: kBoxDecorationflexibleSpace,
        ),
        title: const AutoSizeText(
          'Lista de entidades',
          style: kTitleAppBarStyle,
        ),
        leading: IconButton(
          icon:
              const Icon(Icons.arrow_back_ios_outlined, color: kSecondaryColor),
          onPressed: () {
            bloc.add(OrderStockAdjustmentRegisterReturnEvent());
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: kBoxDecorationStyle,
              child: TextFormField(
                keyboardType: TextInputType.text,
                autofocus: false,
                onChanged: (value) {
                  bloc.add(OrderStockAdjustmentRegisterSearchEntityEvent(
                      search: value));
                },
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'OpenSans',
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 4.0),
                  hintText: "Pesquise aqui",
                  hintStyle: kHintTextStyle,
                ),
              ),
            ),
            const SizedBox(height: 5.0),
            Expanded(
              child: state.entity.isEmpty
                  ? const Center(
                      child: Text(
                          "Não encontramos nenhum registro em nossa base."))
                  : ListView.separated(
                      itemCount: state.entity.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          widget.orderStockAdjustment.nameEntity =
                              state.entity[index].nickTrade;
                          widget.orderStockAdjustment.tbEntityid =
                              state.entity[index].id;
                          bloc.add(OrderStockAdjustmentRegisterReturnEvent());
                        },
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: (Colors.black),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Text(
                                state.entity[index].id.toString(),
                                style: kCircleAvatarTextStyle,
                              ),
                            ),
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(state.entity[index].nickTrade),
                            ],
                          ),
                        ),
                      ),
                      separatorBuilder: (_, __) => const Divider(),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
