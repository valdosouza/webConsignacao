import 'package:appweb/app/core/shared/utils/custom_date.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/domain/entity/order_stock_transfer_list_entity.dart';

class OrderStockTransferListModel extends OrderStockTransferListEntity {
  OrderStockTransferListModel({
    int? id,
    int? tbUserId,
    int? tbEntityId,
    String? nameEntity,
    int? number,
    String? dtRecord,
    String? status,
  }) : super(
          id: id ?? 0,
          tbUserId: tbUserId ?? 0,
          tbEntityId: tbEntityId ?? 0,
          nameEntity: nameEntity ?? "",
          number: number ?? 0,
          dtRecord: dtRecord ?? "",
          status: status ?? "",
        );

  factory OrderStockTransferListModel.fromJson(Map<String, dynamic> json) {
    return OrderStockTransferListModel(
      id: json['id'],
      tbUserId: json['tb_user_id'],
      tbEntityId: json['tb_entity_id'],
      nameEntity: json['name_entity'] as String? ?? "",
      number: json['number'],
      dtRecord: CustomDate.formatDateIn(json['dt_record']),
      status: json['status'] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['tb_user_id'] = tbUserId;
    data['tb_entity_id'] = tbEntityId;
    data['name_entity'] = nameEntity;
    data['number'] = number;
    data['dt_record'] = CustomDate.formatDateOut(dtRecord);
    data['status'] = status;
    return {"order": data};
  }

  factory OrderStockTransferListModel.empty() {
    return OrderStockTransferListModel();
  }
}
