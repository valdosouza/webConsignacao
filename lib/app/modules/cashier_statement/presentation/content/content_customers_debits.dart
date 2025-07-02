import 'package:appweb/app/core/shared/utils/function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/cashier_statement/cashier_statement_module.dart';
import 'package:appweb/app/modules/cashier_statement/data/model/cashier_statement_params.dart';
import 'package:appweb/app/modules/cashier_statement/data/model/customers_old_debit_model.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/bloc/cashier_statement_bloc.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/bloc/cashier_statement_event.dart';

class ContentCustomersDebits extends StatefulWidget {
  final List<CustomersOldDebitModel> list;
  final double bodyHeight;
  const ContentCustomersDebits({
    super.key,
    required this.list,
    required this.bodyHeight,
  });

  @override
  State<ContentCustomersDebits> createState() => _ContentCustomersDebitsState();
}

class _ContentCustomersDebitsState extends State<ContentCustomersDebits> {
  late CashierStatementBloc bloc;
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    bloc = Modular.get<CashierStatementBloc>();
    _scrollController = ScrollController();
    _scrollController.addListener(infiniteScrolling);
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<CashierStatementModule>();
    });
  }

  infiniteScrolling() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      bloc.add(
        GetCustomerOldDebitBySalesmanEvent(
          params: CashierStatementParams(
            date: "",
            nameCustomer: bloc.nameCustomer,
            page: bloc.page,
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
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      child: Column(
        children: [
          title(),
          body(size),
          totalizar(),
        ],
      ),
    );
  }

  title() {
    return Container(
      height: 50,
      color: kPrimaryColor,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                flex: 3,
                child: Text("Cliente",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ))),
            Expanded(
                flex: 1,
                child: Text("Valor",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    )))
          ],
        ),
      ),
    );
  }

  body(Size size) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
        alignment: Alignment.topCenter,
        height: size.height - widget.bodyHeight, //- (283 + 60),
        child: ListView.separated(
          controller: _scrollController,
          itemCount: widget.list.length,
          itemBuilder: (_, index) {
            return InkWell(
              splashColor: Colors.red.withValues(alpha: 0.8),
              hoverColor: kPrimaryColor,
              onTap: () async {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(widget.list[index].nameCustomer),
                  ),
                  const SizedBox(height: 1),
                  Expanded(
                    flex: 1,
                    child: Text(
                      floatToStrF(widget.list[index].currentDebitBalance),
                      textAlign: TextAlign.right,
                      style: const TextStyle(),
                    ),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (_, __) => const Divider(),
        ),
      ),
    );
  }

  totalizar() {
    return SizedBox(
      height: 100,
      child: Column(children: [
        Container(
          color: kPrimaryColor,
          child: const Center(
              child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Totalizador",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          )),
        ),
        const SizedBox(height: 5),
        Text("Valor total: R\$ ${total()}"),
        const SizedBox(height: 5),
        Text("Número de Clientes: ${widget.list.length}"),
      ]),
    );
  }

  total() {
    double total = 0;
    for (var element in widget.list) {
      total += element.currentDebitBalance;
    }
    return floatToStrF(total);
  }
}
