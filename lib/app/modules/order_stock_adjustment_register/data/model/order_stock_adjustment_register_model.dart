import 'package:appweb/app/core/shared/utils/custom_date.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/data/model/order_stock_adjustment_register_items_model.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/domain/entity/order_stock_adjustment_register_entity.dart';

class OrderStockAdjustmentRegisterModel
    extends OrderStockAdjustmentRegisterEntity {
  OrderStockAdjustmentRegisterModel({
    int? id,
    int? tbInstitutionId,
    int? tbUserId,
    int? tbEntityId,
    String? nameEntity,
    int? number,
    String? dtRecord,
    int? tbStockListId,
    String? nameStockList,
    String? note,
    String? status,
    List<OrderStockAdjustmentRegisterItemsModel>? items,
  }) : super(
          id: id ?? 0,
          tbInstitutionId: tbInstitutionId ?? 0,
          tbUserId: tbUserId ?? 0,
          tbEntityId: tbEntityId ?? 0,
          nameEntity: nameEntity ?? "",
          number: number ?? 0,
          dtRecord: dtRecord ?? "",
          tbStockListId: tbStockListId ?? 0,
          nameStockList: nameStockList ?? "",
          note: note ?? "",
          status: status ?? "",
          items: items ??
              List<OrderStockAdjustmentRegisterItemsModel>.empty(
                  growable: true),
        );

  factory OrderStockAdjustmentRegisterModel.fromJson(
      Map<String, dynamic> json) {
    return OrderStockAdjustmentRegisterModel(
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
        tbStockListId: json['tb_stock_list_id'] is String
            ? int.parse(json['tb_stock_list_id'])
            : json['tb_stock_list_id'],
        nameStockList: json['name_stock_list'] as String? ?? "",
        status: json['status'] as String? ?? "",
        items: json['items'] == null
            ? null
            : (json['items'] as List)
                .map((e) => OrderStockAdjustmentRegisterItemsModel.fromJson(e))
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
    data['tb_stock_list_id'] = tbStockListId;
    data['name_stock_list'] = nameStockList;
    data['note'] = note;
    data['status'] = status;
    return data;
  }

  factory OrderStockAdjustmentRegisterModel.empty() {
    return OrderStockAdjustmentRegisterModel(
      dtRecord: CustomDate.newDate(),
      status: "A",
    );
  }
}
