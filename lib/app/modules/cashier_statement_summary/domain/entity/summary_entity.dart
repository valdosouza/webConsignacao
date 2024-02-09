import 'package:appweb/app/modules/cashier_statement_summary/data/model/product_sold_model.dart';

class SummaryEntity {
  int day;
  String weekDay;
  List<ProductSoldModel> productList;
  double oldDebit;
  double debitBalance;
  double totalReceived;

  SummaryEntity({
    required this.day,
    required this.weekDay,
    required this.productList,
    required this.oldDebit,
    required this.debitBalance,
    required this.totalReceived,
  });
}
