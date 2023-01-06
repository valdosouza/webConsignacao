import 'package:appweb/app/modules/Core/domain/entity/order_paid_entity.dart';

class OrderPaidModel extends OrderPaidEntity {
  int tbPaymentTypeId;
  String namePaymentType;
  String? dtExpiration;
  double value;

  OrderPaidModel(
      {required this.tbPaymentTypeId,
      required this.namePaymentType,
      required this.dtExpiration,
      required this.value})
      : super(
          tbPaymentTypeId: tbPaymentTypeId,
          namePaymentType: namePaymentType,
          value: value,
        );

  factory OrderPaidModel.fromJson(Map<String, dynamic> json) {
    return OrderPaidModel(
      tbPaymentTypeId: int.parse(json['tb_payment_type_id'].toString()),
      namePaymentType: json['name_payment_type'].toString(),
      dtExpiration: json['name_payment_type'].toString(),
      value: double.parse(json['value'].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tb_payment_type_id': tbPaymentTypeId,
      'name_payment_type': namePaymentType,
      'dt_expiration': dtExpiration,
      'value': value,
    };
  }
}
