import 'package:appweb/app/modules/payment_type_register/domain/entity/payment_type_entity.dart';

// ignore: must_be_immutable
class PaymentTypeModel extends PaymentTypeEntity {
  PaymentTypeModel({
    required int id,
    required int tbInstitutionId,
    required String description,
    required String active,
  }) : super(
            id: id,
            tbInstitutionId: tbInstitutionId,
            description: description,
            active: active);

  factory PaymentTypeModel.fromJson(Map<String, dynamic> json) {
    return PaymentTypeModel(
      id: json['id'] is String ? int.parse(json['id']) : json['id'],
      tbInstitutionId: json['tb_institution_id'] is String
          ? int.parse(json['tb_institution_id'])
          : json['tb_institution_id'],
      description: json['description'] as String,
      active: json['active'] as String,
    );
  }

  factory PaymentTypeModel.empty() {
    return PaymentTypeModel(
      id: 0,
      tbInstitutionId: 0,
      description: "",
      active: "S",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['tb_institution_id'] = tbInstitutionId;
    data['description'] = description;
    data['active'] = active;
    return data;
  }
}
