import 'package:appweb/app/modules/order_sale_register/presentation/bloc/order_sale_register_bloc.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/bloc/order_sale_register_event.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/bloc/order_sale_register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:appweb/app/core/shared/theme.dart';

class OrderSaleRegisterEntitiesListWidget extends StatefulWidget {
  const OrderSaleRegisterEntitiesListWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<OrderSaleRegisterEntitiesListWidget> createState() =>
      OrderSaleRegisterEntitiesListWidgetState();
}

class OrderSaleRegisterEntitiesListWidgetState
    extends State<OrderSaleRegisterEntitiesListWidget> {
  late final OrderSaleRegisterBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = Modular.get<OrderSaleRegisterBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderSaleRegisterBloc, OrderSaleRegisterState>(
      bloc: bloc,
      builder: (context, state) {
        if (state is EntitiesLoadSuccessState) {
          return _orderSaleEntitiesList(state);
        } else {
          return Container();
        }
      },
    );
  }

  _orderSaleEntitiesList(EntitiesLoadSuccessState state) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: kBoxDecorationflexibleSpace,
        ),
        title: const Text('Lista de entidades'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            bloc.tabIndex = 0;
            bloc.add(OrderReturnMasterEvent());
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
                  bloc.search = value;
                  bloc.add(EntitySearchEvent());
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
              child: bloc.entities.isEmpty
                  ? const Center(
                      child: Text(
                          "Não encontramos nenhum registro em nossa base."))
                  : ListView.separated(
                      itemCount: bloc.entities.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          bloc.orderMain.order.nameEntity =
                              bloc.entities[index].nickTrade;
                          bloc.orderMain.order.tbEntityId =
                              bloc.entities[index].id;
                          bloc.tabIndex = 0;
                          bloc.add(OrderReturnMasterEvent());
                        },
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: (Colors.black),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Text(bloc.entities[index].id.toString()),
                            ),
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(bloc.entities[index].nickTrade),
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
