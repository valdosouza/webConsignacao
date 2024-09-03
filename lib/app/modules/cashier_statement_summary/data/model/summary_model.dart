import 'package:appweb/app/modules/cashier_statement_summary/data/model/product_bonus_model.dart';
import 'package:appweb/app/modules/cashier_statement_summary/data/model/product_load_model.dart';
import 'package:appweb/app/modules/cashier_statement_summary/data/model/product_sold_model.dart';
import 'package:appweb/app/modules/cashier_statement_summary/domain/entity/summary_entity.dart';

class SummaryModel extends SummaryEntity {
  SummaryModel({
    int? day,
    String? weekDay,
    List<ProductSoldModel>? productSoldList,
    double? oldDebit,
    double? debitBalance,
    double? totalReceived,
    int? salesPoints,
    List<ProductBonusModel>? productBonusList,
    List<ProductLoadModel>? productLoadList,
  }) : super(
          day: day ?? 0,
          weekDay: weekDay ?? "",
          productSoldList: productSoldList ?? [],
          oldDebit: oldDebit ?? 0.0,
          debitBalance: debitBalance ?? 0.0,
          totalReceived: totalReceived ?? 0.0,
          salesPoints: salesPoints ?? 0,
          productBonusList: productBonusList ?? [],
          productLoadList: productLoadList ?? [],
        );

  factory SummaryModel.fromJson(Map<String, dynamic> json) {
    return SummaryModel(
      day: json['day'],
      weekDay: json['week_day'],
      productSoldList: List<ProductSoldModel>.from(
        json["product_sold_list"].map(
          (x) => ProductSoldModel.fromJson(x),
        ),
      ),
      oldDebit: json['old_debit'] is int
          ? json['old_debit'].toDouble()
          : json['old_debit'],
      debitBalance: json['debit_balance'] is int
          ? json['debit_balance'].toDouble()
          : json['debit_balance'],
      totalReceived: json['total_received'] is int
          ? json['total_received'].toDouble()
          : json['total_received'],
      salesPoints: json['sales_points'],
      productBonusList: List<ProductBonusModel>.from(
        json["product_bonus_list"].map(
          (x) => ProductBonusModel.fromJson(x),
        ),
      ),
      productLoadList: List<ProductLoadModel>.from(
        json["product_load_list"].map(
          (x) => ProductLoadModel.fromJson(x),
        ),
      ),
    );
  }

  factory SummaryModel.empty() {
    return SummaryModel(
      day: 1,
      weekDay: "",
      productSoldList: [ProductSoldModel.empty(), ProductSoldModel()],
      oldDebit: 0.0,
      debitBalance: 0.0,
      totalReceived: 0.0,
    );
  }
}
