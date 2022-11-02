import 'package:appweb/app/modules/price_list_register/domain/entity/price_list_register_entity.dart';

class PriceListRegisterModel extends PriceListRegisterEntity {
  PriceListRegisterModel({
    int? id,
    int? tbInstitutionId,
    String? description,
    dynamic validity,
    dynamic modality,
    String? aliqProfit,
    String? active,
  }) : super(
          id: id ?? 0,
          tbInstitutionId: tbInstitutionId ?? 0,
          description: description ?? "",
          validity: validity,
          modality: modality,
          aliqProfit: aliqProfit ?? "",
          active: active ?? "",
        );

  factory PriceListRegisterModel.fromJson(Map<String?, dynamic> json) {
    return PriceListRegisterModel(
      id: json['id'] as int? ?? 0,
      tbInstitutionId: json['tb_institution_id'] as int? ?? 0,
      description: json['description'] as String? ?? "",
      validity: json['validity'],
      modality: json['modality'],
      aliqProfit: json['aliq_profit'] as String? ?? "",
      active: json['active'] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['tb_institution_id'] = tbInstitutionId;
    data['description'] = description;
    data['validity'] = validity;
    data['modality'] = modality;
    data['aliq_profit'] = int.parse(aliqProfit);
    data['active'] = active;
    return data;
  }
}
