// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/core/shared/utils/custom_date.dart';
import 'package:appweb/app/core/shared/utils/function.dart';
import 'package:appweb/app/core/shared/utils/toast.dart';
import 'package:appweb/app/modules/cashier_statement/data/model/cashier_statement_customer_model.dart';
import 'package:appweb/app/modules/cashier_statement/data/model/cashier_statement_params.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/bloc/cashier_statement_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:appweb/app/modules/cashier_statement/cashier_statement_module.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/bloc/cashier_statement_bloc.dart';

class CashierStatementCustomerWidget extends StatefulWidget {
  const CashierStatementCustomerWidget({
    super.key,
  });

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
      child: SingleChildScrollView(
        child: Column(
          children: [
            buildSearchInput(),
            buildTittleCustomerList(),
            //const SizedBox(height: 10),
            buildContentCustomerList(),
            //const SizedBox(height: 15),
            buildtotalizar(),
          ],
        ),
      ),
    );
  }

  Container buildSearchInput() {
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
                bloc.add(
                  CashierStatementGetCustomersMobileEvent(
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

  Container buildTittleCustomerList() {
    return Container(
      color: kPrimaryColor,
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
      ),
    );
  }

  SizedBox buildContentCustomerList() {
    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height - 268,
      width: size.width,
      child: SingleChildScrollView(
        child: ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) {
            setState(() => (bloc.customers[index].expanded = isExpanded));
          },
          children: bloc.customers
              .map<ExpansionPanel>((CashierStatementCustomerModel customer) {
            return ExpansionPanel(
                isExpanded: customer.expanded,
                canTapOnHeader: true,
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                        onTap: () {
                          bloc.customerIndex = bloc.customers.indexOf(customer);
                          if (customer.valuerCharged > 0) {
                            bloc.add(
                              CashierStatementGetByOrderMobileEvent(
                                params: CashierStatementParams(
                                  date: bloc.dateSelected,
                                  tbCustomerId: customer.id,
                                  tbOrderId: customer.tbOrderId,
                                ),
                              ),
                            );
                            Modular.to
                                .navigate('/cashierstatement/mobile/byorder/');
                          } else {
                            CustomToast.showToast(
                                "Somente atendimento Registrado!");
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  flex: 3, child: Text(customer.nameCustomer)),
                              Expanded(
                                  flex: 1, child: Text(customer.timeAttendace)),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  floatToStrF(customer.valuerCharged),
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
    );
  }

  SizedBox buildtotalizar() {
    return SizedBox(
      height: 101,
      child: Column(children: [
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
        const SizedBox(height: 10),
        Text("Valor: R\$ ${totalCashier()}"),
        const SizedBox(height: 5),
        Text("Quantidade de clientes: ${bloc.customers.length}"),
        const SizedBox(height: 5),
      ]),
    );
  }

  double totalCashier() {
    double total = 0;
    for (var element in bloc.customers) {
      total += element.valuerCharged;
    }
    return total;
  }
}
