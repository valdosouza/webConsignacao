import 'package:appweb/app/modules/order_attendance_register/domain/entity/order_consignment_check_point_payment_entity.dart';

class OrderConsignmentCheckPointPaymentModel
    extends OrderConsignmentCheckPointPaymentEntity {
  OrderConsignmentCheckPointPaymentModel({
    required String description,
    required double value,
  }) : super(
          description: description,
          value: value,
        );

  factory OrderConsignmentCheckPointPaymentModel.fromJson(
      Map<String, dynamic> json) {
    return OrderConsignmentCheckPointPaymentModel(
      description: json['description'],
      value: json['value'] * 1.0,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    data['value'] = value;
    return data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OrderConsignmentCheckPointPaymentModel &&
        other.description == description &&
        other.value == value;
  }

  @override
  int get hashCode => description.hashCode ^ value.hashCode;
}
