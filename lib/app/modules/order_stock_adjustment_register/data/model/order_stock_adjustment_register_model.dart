import 'package:appweb/app/modules/order_stock_adjustment_register/data/model/order_stock_adjustment_register_items_model.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/domain/entity/order_stock_adjustment_register_entity.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class OrderStockAdjustmentRegisterModel
    extends OrderStockAdjustmentRegisterEntity {
  OrderStockAdjustmentRegisterModel({
    int? id,
    int? tbInstitutionId,
    int? tbOrderid,
    int? tbUserId,
    int? tbEntityid,
    String? nameEntity,
    int? number,
    String? dtRecord,
    String? direction,
    String? note,
    String? status,
    List<OrderStockAdjustmentRegisterItemsModel>? items,
  }) : super(
          id: id ?? 0,
          tbInstitutionId: tbInstitutionId ?? 1,
          tbOrderid: tbOrderid ?? 0,
          tbUserId: tbUserId ?? 2,
          tbEntityid: tbEntityid ?? 0,
          nameEntity: nameEntity ?? "",
          number: number ?? 0,
          dtRecord: dtRecord ?? "",
          direction: direction ?? "E",
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
        tbOrderid: json['tb_order_id'] is String
            ? int.parse(json['tb_order_id'])
            : json['tb_order_id'],
        tbUserId: json['tb_user_id'] is String
            ? int.parse(json['tb_user_id'])
            : json['tb_user_id'],
        tbEntityid: json['tb_entity_id'] is String
            ? int.parse(json['tb_entity_id'])
            : json['tb_entity_id'],
        nameEntity: json['name_entity'] as String? ?? "",
        number: json['number'] is String
            ? int.parse(json['number'])
            : json['number'],
        dtRecord: formatDate(json['dt_record'], "dd/MM/yyyy"),
        direction: json['direction'] as String? ?? "",
        note: json['note'] as String? ?? "",
        status: json['status'] as String? ?? "",
        items: json['items'] == null
            ? null
            : (json['items'] as List)
                .map((e) => OrderStockAdjustmentRegisterItemsModel.fromJson(e))
                .toList());
  }

  factory OrderStockAdjustmentRegisterModel.fromListJson(
      Map<String, dynamic> json) {
    return OrderStockAdjustmentRegisterModel(
        id: json['Order']['id'] is String
            ? int.parse(json['Order']['id'])
            : json['Order']['id'],
        tbInstitutionId: json['Order']['tb_institution_id'] is String
            ? int.parse(json['Order']['tb_institution_id'])
            : json['Order']['tb_institution_id'],
        tbOrderid: json['Order']['tb_order_id'] is String
            ? int.parse(json['Order']['tb_order_id'])
            : json['Order']['tb_order_id'],
        tbUserId: json['Order']['tb_user_id'] is String
            ? int.parse(json['Order']['tb_user_id'])
            : json['Order']['tb_user_id'],
        tbEntityid: json['Order']['tb_entity_id'] is String
            ? int.parse(json['Order']['tb_entity_id'])
            : json['Order']['tb_entity_id'],
        nameEntity: json['Order']['name_entity'] as String? ?? "",
        number: json['Order']['number'] is String
            ? int.parse(json['Order']['number'])
            : json['Order']['number'],
        dtRecord: formatDate(json['Order']['dt_record'], "dd/MM/yyyy"),
        direction: json['Order']['direction'] as String? ?? "",
        note: json['Order']['note'] as String? ?? "",
        status: json['Order']['status'] as String? ?? "",
        items: json['Items'] == null
            ? null
            : (json['Items'] as List)
                .map((e) => OrderStockAdjustmentRegisterItemsModel.fromJson(e))
                .toList());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['tb_institution_id'] = tbInstitutionId;
    data['tb_order_id'] = tbOrderid;
    data['tb_user_id'] = tbUserId;
    data['tb_entity_id'] = tbEntityid;
    data['name_entity'] = nameEntity;
    data['number'] = number;
    data['dt_record'] = convertDate(dtRecord);
    data['direction'] = direction;
    data['note'] = note;
    data['status'] = status;
    return {"Order": data, "Items": items.map((e) => e.toJson()).toList()};
  }

  factory OrderStockAdjustmentRegisterModel.empty() {
    return OrderStockAdjustmentRegisterModel();
  }

  static formatDate(String date, String typeFormat) {
    try {
      initializeDateFormatting('pt_BR,', null);
      DateTime time = DateTime.parse(date);
      return (DateFormat(typeFormat).format(time));
    } catch (e) {
      return "";
    }
  }

  convertDate(String date) {
    return date.split("/").reversed.join("-");
  }
}
