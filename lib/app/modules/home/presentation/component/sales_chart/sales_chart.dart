import 'package:appweb/app/core/shared/theme.dart';
import 'package:appweb/app/modules/home/data/model/home_sales_payment_type_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget salesChart(BuildContext context, List<HomeSalesPaymentTypeModel> list) {
  // ignore: prefer_final_locals
  late List<PieChartSectionData> paiChartSelectionDatas = [];
  double totalValue;
  final brF = NumberFormat.currency(locale: "pt_BR", symbol: "R\$");
  final List colors = [
    kPrimaryColor,
    const Color.fromARGB(255, 255, 255, 255),
    const Color.fromARGB(255, 208, 52, 56),
    const Color.fromARGB(255, 55, 52, 53),
    kPrimaryColor.withValues(alpha: 0.1),
  ];

  totalValue = 0;
  int contador = 0;

  for (HomeSalesPaymentTypeModel p in list) {
    totalValue = totalValue + p.totalValue;

    if (contador < 5) {
      paiChartSelectionDatas.add(
        PieChartSectionData(
          color: colors[contador] as Color,
          value: p.totalValue,
          showTitle: false,
          radius: 25,
        ),
      );
    }
    contador++;
  }

  return SizedBox(
    height: 200,
    child: Stack(
      children: [
        PieChart(
          PieChartData(
            sectionsSpace: 0,
            centerSpaceRadius: 70,
            startDegreeOffset: -90,
            sections: paiChartSelectionDatas,
          ),
        ),
        Positioned.fill(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 16.0),
              Text(
                " ${brF.format(totalValue)}",
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      height: 0.5,
                      fontSize: 20.0,
                    ),
              ),
              const Text("Vendas"),
            ],
          ),
        ),
      ],
    ),
  );
}
