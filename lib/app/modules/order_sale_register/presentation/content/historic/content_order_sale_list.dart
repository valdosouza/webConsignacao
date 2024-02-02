import 'package:appweb/app/modules/order_sale_register/data/model/order_sale_list_model.dart';
import 'package:appweb/app/modules/order_sale_register/domain/usecase/order_sale_getlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/order_sale_register/order_sale_register_module.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/bloc/order_sale_register_bloc.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/bloc/order_sale_register_event.dart';

class ContentOrderSaleList extends StatefulWidget {
  final List<OrderSaleListModel> orderList;
  const ContentOrderSaleList({
    Key? key,
    required this.orderList,
  }) : super(key: key);

  @override
  State<ContentOrderSaleList> createState() => _ContentOrderSaleListState();
}

class _ContentOrderSaleListState extends State<ContentOrderSaleList> {
  late OrderSaleRegisterBloc bloc;
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    bloc = Modular.get<OrderSaleRegisterBloc>();
    _scrollController = ScrollController();
    _scrollController.addListener(infiniteScrolling);
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<OrderSaleRegisterModule>();
    });
  }

  infiniteScrolling() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      bloc.add(
        OrderSaleRegisterGetlistEvent(
          params: ParamsOrderSaleList(
            tbInstitutionId: 0,
            page: bloc.pageOrderSale,
            tbSalesmanId: 0,
            number: 0,
            tbCustomerId: bloc.modelAttendance.tbCustomerId,
            nickTrade: "",
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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
            switch (bloc.stage) {
              case 1:
                bloc.add(ReturnToOrderSaleEvent());
                break;
              case 2:
                bloc.add(ReturnToAttendanceEvent());
            }
          },
        ),
      ),
      body: Column(
        children: [
          buildContentOrderList(),
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
                controller: _scrollController,
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
                        GetOrderSaleCardEvent(
                          orderid: widget.orderList[index].id,
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
