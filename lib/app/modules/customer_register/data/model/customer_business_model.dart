import 'package:appweb/app/modules/customer_register/domain/entity/customer_business_entity.dart';

class CustomerBusinessModel extends CustomerBusinessEntity {
  CustomerBusinessModel({
    String? nameCompany,
    String? nickTrade,
    int? tbLineBuinessId,
    String? aniversary,
    String? note,
  }) : super(
          nameCompany: nameCompany ?? "",
          nickTrade: nickTrade ?? "",
          tbLineBuinessId: tbLineBuinessId ?? 0,
          aniversary: aniversary ?? "",
          note: note ?? "",
        );

  factory CustomerBusinessModel.fromJson(Map<String, dynamic> json) {
    return CustomerBusinessModel(
      nameCompany: json['name_company'] as String? ?? "",
      nickTrade: json['nick_trade'] as String? ?? "",
      tbLineBuinessId: json['tb_line_buiness_id'] as int? ?? 0,
      aniversary: json['aniversary'] as String? ?? "",
      note: json['note'] as String? ?? "",
    );
  }
}
