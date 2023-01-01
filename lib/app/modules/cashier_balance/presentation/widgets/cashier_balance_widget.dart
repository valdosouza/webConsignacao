// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

class CashierBalanceWidget extends StatelessWidget {
  final List<Tuple2<String, double>> cashier;
  final String date;
  const CashierBalanceWidget({
    Key? key,
    required this.date,
    required this.cashier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Text("Data: $date"),
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
            itemCount: cashier.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(cashier[index].value1),
                    Text(cashier[index].value2.toString()),
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
    for (var element in cashier) {
      total += element.value2;
    }
    return total;
  }
}
