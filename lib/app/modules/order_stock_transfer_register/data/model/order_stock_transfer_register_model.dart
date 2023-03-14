import 'package:appweb/app/core/shared/utils/custom_date.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/data/model/order_stock_transfer_register_items_model.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/domain/entity/order_stock_transfer_register_entity.dart';

class OrderStockTransferRegisterModel extends OrderStockTransferRegisterEntity {
  OrderStockTransferRegisterModel({
    int? id,
    int? tbInstitutionId,
    int? tbUserId,
    int? tbEntityId,
    String? nameEntity,
    int? number,
    String? dtRecord,
    int? tbStockListIdOri,
    String? nameStockListOri,
    int? tbStockListIdDes,
    String? nameStockListDes,
    String? note,
    String? status,
    List<OrderStockTransferRegisterItemsModel>? items,
  }) : super(
          id: id ?? 0,
          tbInstitutionId: tbInstitutionId ?? 0,
          tbUserId: tbUserId ?? 0,
          tbEntityId: tbEntityId ?? 0,
          nameEntity: nameEntity ?? "",
          number: number ?? 0,
          dtRecord: dtRecord ?? "",
          tbStockListIdOri: tbStockListIdOri ?? 0,
          nameStockListOri: nameStockListOri ?? "",
          tbStockListIdDes: tbStockListIdDes ?? 0,
          nameStockListDes: nameStockListDes ?? "",
          note: note ?? "",
          status: status ?? "",
          items: items ??
              List<OrderStockTransferRegisterItemsModel>.empty(growable: true),
        );

  factory OrderStockTransferRegisterModel.fromJson(Map<String, dynamic> json) {
    return OrderStockTransferRegisterModel(
        id: json['id'] is String ? int.parse(json['id']) : json['id'],
        tbInstitutionId: json['tb_institution_id'] is String
            ? int.parse(json['tb_institution_id'])
            : json['tb_institution_id'],
        tbUserId: json['tb_user_id'] is String
            ? int.parse(json['tb_user_id'])
            : json['tb_user_id'],
        tbEntityId: json['tb_entity_id'] is String
            ? int.parse(json['tb_entity_id'])
            : json['tb_entity_id'],
        nameEntity: json['name_entity'] as String? ?? "",
        number: json['number'] is String
            ? int.parse(json['number'])
            : json['number'],
        dtRecord: CustomDate.formatDateIn(json['dt_record']),
        note: json['note'] as String? ?? "",
        tbStockListIdOri: json['tb_stock_list_id_ori'] is String
            ? int.parse(json['tb_stock_list_id_ori'])
            : json['tb_stock_list_id_ori'],
        nameStockListOri: json['name_stock_list_ori'] as String? ?? "",
        tbStockListIdDes: json['tb_stock_list_id_dess'] is String
            ? int.parse(json['tb_stock_list_id_des'])
            : json['tb_stock_list_id_des'],
        nameStockListDes: json['name_stock_list_des'] as String? ?? "",
        status: json['status'] as String? ?? "",
        items: json['items'] == null
            ? null
            : (json['items'] as List)
                .map((e) => OrderStockTransferRegisterItemsModel.fromJson(e))
                .toList());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['tb_institution_id'] = tbInstitutionId;
    data['tb_user_id'] = tbUserId;
    data['tb_entity_id'] = tbEntityId;
    data['name_entity'] = nameEntity;
    data['number'] = number;
    data['dt_record'] = CustomDate.formatDateOut(dtRecord);
    data['tb_stock_list_id_ori'] = tbStockListIdOri;
    data['name_stock_list_ori'] = nameStockListOri;
    data['tb_stock_list_id_des'] = tbStockListIdDes;
    data['name_stock_list_des'] = nameStockListDes;
    data['note'] = note;
    data['status'] = status;
    return data;
  }

  factory OrderStockTransferRegisterModel.empty() {
    return OrderStockTransferRegisterModel(
      dtRecord: CustomDate.newDate(),
      status: "A",
    );
  }
}
