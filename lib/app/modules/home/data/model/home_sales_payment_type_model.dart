import 'package:appweb/app/modules/home/domain/entity/home_sales_payment_type_entity.dart';

class HomeSalesPaymentTypeModel extends HomeSalesPaymentTypeEntity {
  const HomeSalesPaymentTypeModel({
    required super.paymentType,
    required super.totalQtty,
    required super.totalValue,
  });

  factory HomeSalesPaymentTypeModel.fromJson(Map<String, dynamic> json) {
    return HomeSalesPaymentTypeModel(
      paymentType: json['paymentType'].toString(),
      totalQtty: int.parse(json['totalQtty'].toString()),
      totalValue: double.parse(json['totalValue'].toString()),
    );
  }
}
