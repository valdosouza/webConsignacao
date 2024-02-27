// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/custom_date.dart';
import 'package:appweb/app/core/shared/utils/function.dart';
import 'package:appweb/app/modules/cashier_statement/data/model/cashier_statement_params.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/bloc/cashier_statement_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:appweb/app/modules/cashier_statement/cashier_statement_module.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/bloc/cashier_statement_bloc.dart';

class ContentCashierStatementSalesmanList extends StatefulWidget {
  const ContentCashierStatementSalesmanList({
    super.key,
  });

  @override
  State<ContentCashierStatementSalesmanList> createState() =>
      _ContentCashierStatementSalesmanListState();
}

class _ContentCashierStatementSalesmanListState
    extends State<ContentCashierStatementSalesmanList> {
  late CashierStatementBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = Modular.get<CashierStatementBloc>();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<CashierStatementModule>();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildSearchInput(),
        buildTittleSalesmanList(),
        const SizedBox(height: 10),
        buildContentSalesmanList(),
        const SizedBox(height: 15),
        buildtotalizar(),
      ],
    );
  }

  totalCashier() {
    double total = 0;
    for (var element in bloc.salesmans) {
      total += element.valuerCharged;
    }
    return total;
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
                  bloc.dateSelected = CustomDate.newDate();
                }
              },
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans',
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 10.0),
                hintText: "Pesquise por dia ou por Vendedor",
                hintStyle: kHintTextStyle,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              hoverColor: Colors.transparent,
              onPressed: () {
                bloc.add(
                  GoToSalesmanListDesktopEvent(
                    params: CashierStatementParams(
                      date: bloc.dateSelected,
                    ),
                  ),
                );
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

  buildTittleSalesmanList() {
    return Container(
      color: kPrimaryColor,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                flex: 3,
                child: Text("Vendedor",
                    style: TextStyle(fontSize: 16, color: Colors.white))),
            Expanded(
                flex: 1,
                child: Text("Valor",
                    style: TextStyle(fontSize: 16, color: Colors.white)))
          ],
        ),
      ),
    );
  }

  buildContentSalesmanList() {
    return Expanded(
      child: ListView.separated(
        itemCount: bloc.salesmans.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {},
          child: ListTile(
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
            title: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(bloc.salesmans[index].nameSalesman),
                ),
                Expanded(
                  flex: 1,
                  child: Text(floatToStrF(bloc.salesmans[index].valuerCharged)),
                )
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.arrow_forward_ios_outlined),
              onPressed: () {
                bloc.nameSalesman = bloc.salesmans[index].nameSalesman;
                bloc.add(GotoCustomerListDesktopEvent(
                  params: CashierStatementParams(
                    date: bloc.dateSelected,
                    tbSalesmanId: bloc.salesmans[index].id,
                  ),
                ));
              },
            ),
          ),
        ),
        separatorBuilder: (_, __) => const Divider(),
      ),
    );
  }

  buildtotalizar() {
    final double valortotal = totalCashier();
    double valorMedio = 0;
    if (bloc.salesmans.isNotEmpty) {
      valorMedio = valortotal / bloc.salesmans.length;
    } else {
      valorMedio = 0;
    }
    return SizedBox(
      height: 100,
      child: Column(
        children: [
          Container(
            color: kPrimaryColor,
            child: const Center(
                child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Totais",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            )),
          ),
          const SizedBox(height: 15),
          Text("Valor: R\$ ${floatToStrF(valortotal)}"),
          const SizedBox(height: 5),
          Text("Média de vendas: R\$ ${floatToStrF(valorMedio)}"),
        ],
      ),
    );
  }
}
