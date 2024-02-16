import 'package:appweb/app/modules/sales_average/domain/entity/sales_average_entity.dart';

class SalesAverageModel extends SalesAverageEntity {
  SalesAverageModel({
    required super.tbCustomerId,
    required super.nameCustomer,
    required super.totalValue,
    required super.numberOfSales,
    required super.tagValue,
  });

  factory SalesAverageModel.fromJson(Map<String, dynamic> json) {
    return SalesAverageModel(
        tbCustomerId: json['tb_customer_id'],
        nameCustomer: json['name_customer'],
        totalValue: json['total_value'] is int
            ? json['total_value'].toDouble()
            : json['total_value'],
        tagValue: json['tag_value'] is int
            ? json['tag_value'].toDouble()
            : json['tag_value'],
        numberOfSales: json['number_of_sales']);
  }
}
