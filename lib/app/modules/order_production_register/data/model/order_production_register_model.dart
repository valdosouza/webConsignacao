import 'package:appweb/app/modules/order_production_register/domain/entity/order_production_register_entity.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class OrderProductionRegisterModel extends OrderProductionRegisterEntity {
  OrderProductionRegisterModel(
      {int? id,
      int? tbInstitutionId,
      int? tbUserId,
      String? dtRecord,
      int? number,
      String? status,
      int? tbMerchandiseId,
      String? nameMerchandise,
      int? qttyForecast,
      int? tbStockListIdDes,
      String? nameStockListDes,
      String? note})
      : super(
            id: id ?? 0,
            tbInstitutionId: tbInstitutionId ?? 1,
            tbUserId: tbUserId ?? 2,
            dtRecord: dtRecord ?? "",
            number: number ?? 0,
            status: status ?? "A",
            tbMerchandiseId: tbMerchandiseId ?? 0,
            nameMerchandise: nameMerchandise ?? "",
            qttyForecast: qttyForecast ?? 0,
            tbStockListIdDes: tbStockListIdDes ?? 0,
            nameStockListDes: nameStockListDes ?? "",
            note: note ?? "");

  factory OrderProductionRegisterModel.fromJson(Map<String?, dynamic> json) {
    return OrderProductionRegisterModel(
      id: json['id'] is String ? int.parse(json['id']) : json['id'],
      tbInstitutionId: json['tb_institution_id'] is String
          ? int.parse(json['tb_institution_id'])
          : json['tb_institution_id'],
      tbUserId: json['tb_user_id'] is String
          ? int.parse(json['tb_user_id'])
          : json['tb_user_id'],
      dtRecord: formatDate(json['dt_record'], "dd/MM/yyyy") as String? ?? "",
      number:
          json['number'] is String ? int.parse(json['number']) : json['number'],
      status: json['status'] as String? ?? "",
      tbMerchandiseId: json['tb_merchandise_id'] is String
          ? int.parse(json['tb_merchandise_id'])
          : json['tb_merchandise_id'],
      nameMerchandise: json['name_merchandise'] as String? ?? "",
      qttyForecast: json['qtty_forecast'] is String
          ? double.parse(json['qtty_forecast'])
          : json['qtty_forecast'],
      tbStockListIdDes: json['tb_stock_list_id_des'] is String
          ? int.parse(json['tb_stock_list_id_des'])
          : json['tb_stock_list_id_des'],
      nameStockListDes: json['name_stock_list_des'] as String? ?? "",
      note: json['note'] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["tb_institution_id"] = tbInstitutionId;
    data["tb_user_id"] = tbUserId;
    data["dt_record"] = convertDate(dtRecord);
    data["number"] = number;
    data["status"] = status;
    data["tb_merchandise_id"] = tbMerchandiseId;
    data["name_merchandise"] = nameMerchandise;
    data["qtty_forecast"] = qttyForecast;
    data["tb_stock_list_id_des"] = tbStockListIdDes;
    data["name_stock_list_des"] = nameStockListDes;
    data["note"] = note;
    return data;
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