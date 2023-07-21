import 'package:appweb/app/core/shared/utils/custom_date.dart';
import 'package:appweb/app/modules/order_bonus_register/data/model/order_bonus_register_items_model.dart';
import 'package:appweb/app/modules/order_bonus_register/domain/entity/order_bonus_register_entity.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class OrderBonusRegisterModel extends OrderBonusRegisterEntity {
  OrderBonusRegisterModel({
    int? id,
    int? tbInstitutionId,
    int? tbOrderid,
    int? tbUserId,
    int? tbCustomerid,
    String? nameCustomer,
    int? tbSalesmanId,
    int? number,
    String? dtRecord,
    String? direction,
    String? note,
    String? status,
    List<OrderBonusRegisterItemsModel>? items,
  }) : super(
          id: id ?? 0,
          tbInstitutionId: tbInstitutionId ?? 0,
          tbOrderid: tbOrderid ?? 0,
          tbUserId: tbUserId ?? 0,
          tbCustomerid: tbCustomerid ?? 0,
          nameCustomer: nameCustomer ?? "",
          tbSalesmanId: tbSalesmanId ?? 0,
          number: number ?? 0,
          dtRecord: dtRecord ?? "",
          note: note ?? "",
          status: status ?? "",
          items:
              items ?? List<OrderBonusRegisterItemsModel>.empty(growable: true),
        );

  factory OrderBonusRegisterModel.fromListJson(Map<String, dynamic> json) {
    return OrderBonusRegisterModel(
      id: json['id'],
      tbInstitutionId: json['tb_institution_id'],
      tbOrderid: json['tb_order_id'],
      tbUserId: json['tb_user_id'],
      tbCustomerid: json['tb_customer_id'],
      nameCustomer: json['name_customer'] as String? ?? "",
      tbSalesmanId: json['tb_salesman_id'],
      dtRecord: CustomDate.formatDateIn(json['dt_record'] as String? ?? ""),
      number: json['number'],
      status: json['status'] as String? ?? "",
      note: json['note'] as String? ?? "",
    );
  }

  factory OrderBonusRegisterModel.fromJson(Map<String, dynamic> json) {
    return OrderBonusRegisterModel(
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
        tbCustomerid: json['Order']['tb_customer_id'] is String
            ? int.parse(json['Order']['tb_customer_id'])
            : json['Order']['tb_customer_id'],
        tbSalesmanId: json['Order']['tb_salesman_id'],
        nameCustomer: json['Order']['name_customer'] as String? ?? "",
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
                .map((e) => OrderBonusRegisterItemsModel.fromJson(e))
                .toList());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['tb_institution_id'] = tbInstitutionId;
    data['tb_order_id'] = tbOrderid;
    data['tb_user_id'] = tbUserId;
    data['tb_customer_id'] = tbCustomerid;
    data['name_customer'] = nameCustomer;
    data['tb_salesman_id'] = tbSalesmanId;
    data['number'] = number;
    data['dt_record'] = convertDate(dtRecord);

    data['note'] = note;
    data['status'] = status;
    return {"Order": data, "Items": items.map((e) => e.toJson()).toList()};
  }

  factory OrderBonusRegisterModel.empty() {
    return OrderBonusRegisterModel();
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
