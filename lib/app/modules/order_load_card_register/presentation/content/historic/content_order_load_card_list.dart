import 'package:appweb/app/modules/order_consignment_register/data/model/order_consignment_list_model.dart';
import 'package:appweb/app/modules/order_load_card_register/domain/usecase/get_new_order_load_card.dart';
import 'package:appweb/app/modules/order_load_card_register/order_load_card_register_module.dart';
import 'package:appweb/app/modules/order_load_card_register/presentation/bloc/order_load_card_register_bloc.dart';
import 'package:appweb/app/modules/order_load_card_register/presentation/bloc/order_load_card_register_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:appweb/app/core/shared/theme.dart';

class ContentOrderLoadCardList extends StatefulWidget {
  final List<OrderConsignmetListModel> orderList;
  const ContentOrderLoadCardList({
    Key? key,
    required this.orderList,
  }) : super(key: key);

  @override
  State<ContentOrderLoadCardList> createState() =>
      _ContentOrderLoadCardListState();
}

class _ContentOrderLoadCardListState extends State<ContentOrderLoadCardList> {
  late OrderLoadCardRegisterBloc bloc;
  @override
  void initState() {
    super.initState();
    bloc = Modular.get<OrderLoadCardRegisterBloc>();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<OrderLoadCardRegisterModule>();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: kBoxDecorationflexibleSpace,
        ),
        title: kAppTitle,
        leading: IconButton(
          icon:
              const Icon(Icons.arrow_back_ios_outlined, color: kSecondaryColor),
          onPressed: () {
            //no mobile pode passar zero que no datasource ele preenche
            bloc.add(
              OrderLoadCardRegisterGetCardEvent(
                params: ParamsGetNewOrderLoadCard(
                  tbSalesmanId: 0,
                  dtRecord: "",
                ),
              ),
            );
          },
        ),
      ),
      body: Column(
        children: [
          buildSearchInput(),
          buildContentOrderList(),
        ],
      ),
    );
  }

  buildSearchInput() {
    return Container(
      decoration: kBoxDecorationStyle,
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              keyboardType: TextInputType.text,
              autofocus: false,
              initialValue: bloc.dateSelected,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  bloc.dateSelected = value;
                } else {
                  bloc.dateSelected = "";
                }
              },
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans',
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 10.0),
                hintText: "Pesquise por dia",
                hintStyle: kHintTextStyle,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              hoverColor: Colors.transparent,
              onPressed: () {
                bloc.add(SearchEvent(search: bloc.dateSelected));
              },
              icon: const Icon(
                Icons.search,
                //size: 20.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  buildTittleOrderList() {
    return Container(
      color: kPrimaryColor,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                flex: 3,
                child: Text("Data",
                    style: TextStyle(fontSize: 16, color: Colors.white))),
            Expanded(
                flex: 1,
                child: Text("Número",
                    style: TextStyle(fontSize: 16, color: Colors.white))),
          ],
        ),
      ),
    );
  }

  Widget buildContentOrderList() {
    final Size size = MediaQuery.of(context).size;
    return widget.orderList.isEmpty
        ? const Center(
            child: Text("Não encontramos nenhum registro em nossa base."))
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: size.height - 149,
              child: ListView.separated(
                itemCount: widget.orderList.length,
                itemBuilder: (context, index) => ListTile(
                  leading: CircleAvatar(
                    backgroundColor: (Colors.black),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Text(
                        (index + 1).toString(),
                        style: kCircleAvatarTextStyle,
                      ),
                    ),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.orderList[index].dtRecord),
                    ],
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.arrow_forward_ios_outlined),
                    onPressed: () {
                      bloc.add(
                        GetOrderLoadCard(
                          orderId: widget.orderList[index].id,
                        ),
                      );
                    },
                  ),
                ),
                separatorBuilder: (_, __) => const Divider(),
              ),
            ),
          );
  }
}
