import 'package:appweb/app/modules/price_list_register/domain/entity/price_list_register_entity.dart';

class PriceListModel extends PriceListRegisterEntity {
  PriceListModel({
    int? id,
    int? tbInstitutionId,
    String? description,
    dynamic validity,
    dynamic modality,
    double? aliqProfit,
    String? active,
  }) : super(
          id: id ?? 0,
          tbInstitutionId: tbInstitutionId ?? 0,
          description: description ?? "",
          validity: validity,
          modality: modality,
          aliqProfit: aliqProfit ?? 0,
          active: active ?? "",
        );

  factory PriceListModel.fromJson(Map<String?, dynamic> json) {
    return PriceListModel(
      id: json['id'] is String ? int.parse(json['id']) : json['id'],
      tbInstitutionId: json['tb_institution_id'] is String
          ? int.parse(json['tb_institution_id'])
          : json['tb_institution_id'],
      description: json['description'] as String? ?? "",
      validity: json['validity'],
      modality: json['modality'],
      aliqProfit: json['aliq_profit'] is String
          ? double.parse(json['aliq_profit'])
          : json['aliq_profit'],
      active: json['active'] as String? ?? "",
    );
  }

  factory PriceListModel.empty() {
    return PriceListModel(
      id: 0,
      tbInstitutionId: 0,
      description: "",
      validity: "",
      modality: "",
      aliqProfit: 0.0,
      active: "S",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['tb_institution_id'] = tbInstitutionId;
    data['description'] = description;
    data['validity'] = validity;
    data['aliq_profit'] = aliqProfit;
    data['active'] = active;
    return data;
  }
}
