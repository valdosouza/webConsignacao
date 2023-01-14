import 'package:appweb/app/modules/cashier_balance/cashier_balance_module.dart';
import 'package:appweb/app/modules/cashier_balance/presentation/bloc/cashier_balance_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CashierBalanceWidget extends StatefulWidget {
  const CashierBalanceWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<CashierBalanceWidget> createState() => _CashierBalanceWidgetState();
}

class _CashierBalanceWidgetState extends State<CashierBalanceWidget> {
  late CashierBalanceBloc bloc;
  @override
  void initState() {
    super.initState();
    bloc = Modular.get<CashierBalanceBloc>();
    Future.delayed(const Duration(milliseconds: 100)).then((_) async {
      await Modular.isModuleReady<CashierBalanceModule>();
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
            child: const Center(
                child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Saldo Atual",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            )),
          ),
          const SizedBox(height: 15),
          Text("Data: ${bloc.cashierBalance.dtRecord}"),
          const SizedBox(
            height: 5,
          ),
          Text("Valor: R\$ ${totalCashier()}"),
          const SizedBox(height: 15),
          Container(
              color: Theme.of(context).primaryColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Forma de Pagamento",
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
            itemCount: bloc.cashierBalance.items.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(bloc.cashierBalance.items[index].namePaymentType),
                    Text(bloc.cashierBalance.items[index].balanceValue
                        .toStringAsFixed(2)),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => const Divider(),
          )
        ],
      ),
    );
  }

  totalCashier() {
    double total = 0;
    for (var element in bloc.cashierBalance.items) {
      total += element.balanceValue;
    }
    return total.toStringAsFixed(2);
  }
}
