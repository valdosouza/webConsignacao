import 'package:appweb/app/core/shared/utils/custom_date.dart';
import 'package:appweb/app/modules/Core/domain/entity/order_status_entity.dart';

class OrderStatusModel extends OrderStatusEntity {
  OrderStatusModel({
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

  factory OrderStatusModel.fromJson(Map<String?, dynamic> json) {
    return OrderStatusModel(
      tbInstitutionId: json['tb_institution_id'],
      id: json['id'],
      dtRecord: CustomDate.formatDateIn(json['dt_record']),
      direction: json['direction'],
    );
  }
  factory OrderStatusModel.empty() {
    return OrderStatusModel(
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
