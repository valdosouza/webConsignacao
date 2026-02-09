import 'package:appweb/app/modules/home/data/model/home_sales_payment_type_model.dart';
import 'package:appweb/app/modules/home/presentation/component/sales_payment_type.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget listSalesPaymentType(
    BuildContext context, List<HomeSalesPaymentTypeModel> list) {
  final brF = NumberFormat.currency(locale: "pt_BR", symbol: "R\$");
  return Expanded(
    child: ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return SalesPaymentType(
          svgSrc: "../images/icons/Documents.svg",
          paymentType: list[index].paymentType.toString(),
          saleValues: " ${brF.format(list[index].totalValue)}",
        );
      },
    ),
  );
}
