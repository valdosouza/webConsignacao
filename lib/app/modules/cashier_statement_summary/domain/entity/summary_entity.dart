import 'package:appweb/app/modules/cashier_statement_summary/data/model/product_bonus_model.dart';
import 'package:appweb/app/modules/cashier_statement_summary/data/model/product_load_model.dart';
import 'package:appweb/app/modules/cashier_statement_summary/data/model/product_sold_model.dart';

class SummaryEntity {
  int day;
  String weekDay;
  List<ProductSoldModel> productSoldList;
  double oldDebit;
  double debitBalance;
  double totalReceived;
  int salesPoints;
  List<ProductBonusModel> productBonusList;
  List<ProductLoadModel> productLoadList;

  SummaryEntity({
    required this.day,
    required this.weekDay,
    required this.productSoldList,
    required this.oldDebit,
    required this.debitBalance,
    required this.totalReceived,
    required this.salesPoints,
    required this.productBonusList,
    required this.productLoadList,
  });
}
