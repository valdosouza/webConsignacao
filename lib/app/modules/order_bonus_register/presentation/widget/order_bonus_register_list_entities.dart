// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:appweb/app/modules/order_bonus_register/data/model/order_bonus_register_model.dart';
import 'package:appweb/app/modules/order_bonus_register/presentation/bloc/order_bonus_register_bloc.dart';
import 'package:appweb/app/modules/order_bonus_register/presentation/bloc/order_bonus_register_event.dart';
import 'package:appweb/app/modules/order_bonus_register/presentation/bloc/order_bonus_register_state.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:appweb/app/core/shared/theme.dart';

class OrderBonusRegisterEntitiesListWidget extends StatefulWidget {
  final OrderBonusRegisterModel orderBonus;
  const OrderBonusRegisterEntitiesListWidget({
    super.key,
    required this.orderBonus,
  });

  @override
  State<OrderBonusRegisterEntitiesListWidget> createState() =>
      OrderBonusRegisterEntitiesListWidgetState();
}

class OrderBonusRegisterEntitiesListWidgetState
    extends State<OrderBonusRegisterEntitiesListWidget> {
  late final OrderBonusRegisterBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = Modular.get<OrderBonusRegisterBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBonusRegisterBloc, OrderBonusRegisterState>(
      bloc: bloc,
      builder: (context, state) {
        if (state is OrderBonusRegisterEntitySuccessState) {
          return _orderBonusEntitiesList(state);
        } else {
          return Container();
        }
      },
    );
  }

  Scaffold _orderBonusEntitiesList(OrderBonusRegisterEntitySuccessState state) {
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
            bloc.add(OrderBonusRegisterReturnEvent());
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
                  bloc.add(OrderBonusRegisterSearchEntityEvent(search: value));
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
                          widget.orderBonus.nameCustomer =
                              state.entity[index].nickTrade;
                          widget.orderBonus.tbCustomerid =
                              state.entity[index].id;
                          bloc.add(OrderBonusRegisterReturnEvent());
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
