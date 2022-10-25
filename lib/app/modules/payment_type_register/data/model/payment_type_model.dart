import 'package:appweb/app/modules/payment_type_register/domain/entities/payment_type_entity.dart';

// ignore: must_be_immutable
class PaymentTypeModel extends PaymentTypeEntity {
  PaymentTypeModel({
    required int id,
    required int institution,
    required String description,
    required String active,
  }) : super(
            id: id,
            institution: institution,
            description: description,
            active: active);

  factory PaymentTypeModel.fromJson(Map<String, dynamic> json) {
    return PaymentTypeModel(
      id: int.parse(json['id'].toString()),
      institution: int.parse(json['tb_institution_id'].toString()),
      description: json['description'] as String,
      active: json['active'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id.toString();
    data['tb_institution_id'] = institution.toString();
    data['description'] = description;
    data['active'] = active;
    return data;
  }
}
