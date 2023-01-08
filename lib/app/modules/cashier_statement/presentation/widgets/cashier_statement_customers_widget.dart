// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:appweb/app/modules/cashier_statement/data/model/cashier_statement_params.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/bloc/cashier_statement_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:appweb/app/modules/cashier_statement/cashier_statement_module.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/bloc/cashier_statement_bloc.dart';

class CashierStatementCustomerWidget extends StatefulWidget {
  final String date;
  const CashierStatementCustomerWidget({
    Key? key,
    required this.date,
  }) : super(key: key);

  @override
  State<CashierStatementCustomerWidget> createState() =>
      _CashierStatementCustomerWidgetState();
}

class _CashierStatementCustomerWidgetState
    extends State<CashierStatementCustomerWidget> {
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
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Column(
        children: [
          Container(
              color: Theme.of(context).primaryColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Cliente",
                        style: TextStyle(fontSize: 16, color: Colors.white)),
                    Text("Horário",
                        style: TextStyle(fontSize: 16, color: Colors.white)),
                    Text("Valor",
                        style: TextStyle(fontSize: 16, color: Colors.white))
                  ],
                ),
              )),
          const SizedBox(height: 10),
          ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: bloc.customers.length,
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    bloc.add(CashierStatementGetCustomersMobileEvent(
                        params: CashierStatementParams(
                            tbInstitutionId: 1,
                            date: widget.date,
                            tbUserId: 2,
                            tbCustomerId: bloc.customers[index].id)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(bloc.customers[index].nameCustomer),
                        Text(bloc.customers[index].timeAttendace),
                        Text(bloc.customers[index].valuerCharged
                            .toStringAsFixed(2)),
                      ],
                    ),
                  ));
            },
            separatorBuilder: (context, index) => const Divider(),
          ),
          const SizedBox(height: 15),
          Container(
            color: Theme.of(context).primaryColor,
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
          Text("Valor: R\$ ${totalCashier()}"),
          const SizedBox(height: 5),
          Text("Quantidade de clientes: ${bloc.customers.length}"),
        ],
      ),
    );
  }

  totalCashier() {
    double total = 0;
    for (var element in bloc.customers) {
      total += element.valuerCharged;
    }
    return total;
  }
}
