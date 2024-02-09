import 'package:appweb/app/modules/cashier_statement_summary/data/model/product_sold_model.dart';
import 'package:appweb/app/modules/cashier_statement_summary/domain/entity/summary_entity.dart';

class SummaryModel extends SummaryEntity {
  SummaryModel({
    int? day,
    String? weekDay,
    List<ProductSoldModel>? productList,
    double? oldDebit,
    double? debitBalance,
    double? totalReceived,
  }) : super(
          day: day ?? 0,
          weekDay: weekDay ?? "",
          productList: productList ?? [],
          oldDebit: oldDebit ?? 0.0,
          debitBalance: debitBalance ?? 0.0,
          totalReceived: totalReceived ?? 0.0,
        );

  factory SummaryModel.fromJson(Map<String, dynamic> json) {
    return SummaryModel(
      day: json['day'],
      weekDay: json['week_day'],
      productList: List<ProductSoldModel>.from(
        json["product_list"].map(
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
    );
  }

  factory SummaryModel.empty() {
    return SummaryModel(
      day: 1,
      weekDay: "",
      productList: [ProductSoldModel.empty(), ProductSoldModel()],
      oldDebit: 0.0,
      debitBalance: 0.0,
      totalReceived: 0.0,
    );
  }
}
