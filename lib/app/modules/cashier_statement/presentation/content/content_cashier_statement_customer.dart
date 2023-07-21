import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/modules/cashier_statement/data/model/cashier_statement_customer_model.dart';
import 'package:appweb/app/modules/cashier_statement/data/model/cashier_statement_params.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/bloc/cashier_statement_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:appweb/app/modules/cashier_statement/cashier_statement_module.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/bloc/cashier_statement_bloc.dart';

class ContentCashierStatementCustomer extends StatefulWidget {
  const ContentCashierStatementCustomer({
    Key? key,
  }) : super(key: key);

  @override
  State<ContentCashierStatementCustomer> createState() =>
      _ContentCashierStatementCustomerState();
}

class _ContentCashierStatementCustomerState
    extends State<ContentCashierStatementCustomer> {
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
    return Column(
      children: [
        Container(
            color: Theme.of(context).primaryColor,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex: 3,
                      child: Text("Cliente",
                          style: TextStyle(fontSize: 16, color: Colors.white))),
                  Expanded(
                      flex: 1,
                      child: Text("Horário",
                          style: TextStyle(fontSize: 16, color: Colors.white))),
                  Expanded(
                      flex: 1,
                      child: Text("Valor",
                          style: TextStyle(fontSize: 16, color: Colors.white)))
                ],
              ),
            )),
        const SizedBox(height: 10),
        SizedBox(
          height: size.height - 315,
          width: size.width,
          child: SingleChildScrollView(
            child: ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                setState(() => (bloc.customers[index].expanded = !isExpanded));
              },
              children: bloc.customers.map<ExpansionPanel>(
                  (CashierStatementCustomerModel customer) {
                return ExpansionPanel(
                    isExpanded: customer.expanded,
                    canTapOnHeader: true,
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                            onTap: () {
                              bloc.customerIndex =
                                  bloc.customers.indexOf(customer);
                              if (customer.valuerCharged > 0) {
                                bloc.add(
                                  GotoOrderDetailDesktopEvent(
                                    params: CashierStatementParams(
                                      date: customer.dtRecord,
                                      tbCustomerId: customer.id,
                                      tbOrderId: customer.tbOrderId,
                                      tbSalesmanId: customer.tbSalesmanId,
                                    ),
                                  ),
                                );
                              } else {
                                CustomToast.showToast(
                                    "Somente atendimento Registrado!");
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      flex: 3,
                                      child: Text(customer.nameCustomer)),
                                  Expanded(
                                      flex: 1,
                                      child: Text(customer.timeAttendace)),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      customer.valuerCharged.toStringAsFixed(2),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      );
                    },
                    body: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "Observações",
                          style: kLabelStyle,
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          customer.note,
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(height: 5),
                      ],
                    ));
              }).toList(),
            ),
          ),
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
