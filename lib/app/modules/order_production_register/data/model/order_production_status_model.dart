import 'package:appweb/app/core/shared/utils/custom_date.dart';
import 'package:appweb/app/modules/order_production_register/domain/entity/order_production_status_entity.dart';

class OrderProductionStatusModel extends OrderProductionStatusEntity {
  OrderProductionStatusModel({
    required int tbInstitutionId,
    required int id,
    required String dtRecord,
    required String direction,
  }) : super(
          tbInstitutionId: tbInstitutionId,
          id: id,
          dtRecord: dtRecord,
          direction: direction,
        );

  factory OrderProductionStatusModel.fromJson(Map<String?, dynamic> json) {
    return OrderProductionStatusModel(
      tbInstitutionId: json['tb_institution_id'],
      id: json['id'],
      dtRecord: CustomDate.formatDateIn(json['dt_record']),
      direction: json['direction'],
    );
  }
  factory OrderProductionStatusModel.empty() {
    return OrderProductionStatusModel(
      tbInstitutionId: 0,
      id: 0,
      dtRecord: "",
      direction: "",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data["tb_institution_id"] = tbInstitutionId;
    data["id"] = id;
    data["dt_record"] = CustomDate.formatDateOut(dtRecord);
    data["direction"] = direction;
    return data;
  }
}
