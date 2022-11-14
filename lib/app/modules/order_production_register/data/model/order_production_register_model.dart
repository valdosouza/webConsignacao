// ignore_for_file: must_be_immutable

import 'package:appweb/app/modules/order_production_register/domain/entity/order_production_register_entity.dart';

class OrderProductionModel extends OrderProductionEntity {
  OrderProductionModel({
    int? id,
    int? tbInstitutionId,
    int? tbUserId,
    String? dtRecord,
    int? number,
    String? status,
    int? tbMerchandiseId,
    String? nameMerchandise,
    String? qttyForecast,
    int? tbStockListIdDes,
    String? nameStockListDes,
    String? note,
  }) : super(
          id: id ?? 0,
          tbInstitutionId: tbInstitutionId ?? 0,
          tbUserId: tbUserId ?? 0,
          dtRecord: dtRecord ?? "",
          number: number ?? 0,
          status: status ?? "",
          tbMerchandiseId: tbMerchandiseId ?? 0,
          nameMerchandise: nameMerchandise ?? "",
          qttyForecast: qttyForecast ?? "",
          tbStockListIdDes: tbStockListIdDes ?? 0,
          nameStockListDes: nameStockListDes ?? "",
          note: note ?? "",
        );

  factory OrderProductionModel.fromJson(Map<String, dynamic> json) {
    return OrderProductionModel(
      id: json['id'],
      tbInstitutionId: json['tb_institution_id'],
      tbUserId: json['tb_user_id'],
      dtRecord: json['dt_record'],
      number: json['number'],
      status: json['status'],
      tbMerchandiseId: json['tb_merchandise_id'],
      nameMerchandise: json['name_merchandise'],
      qttyForecast: json['qtty_forecast'],
      tbStockListIdDes: json['tb_stock_list_id_des'],
      nameStockListDes: json['name_stock_list_des'],
      note: json['note'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['tb_institution_id'] = tbInstitutionId;
    data['tb_user_id'] = tbUserId;
    data['dt_record'] = dtRecord;
    data['number'] = number;
    data['status'] = status;
    data['tb_merchandise_id'] = tbMerchandiseId;
    data['name_merchandise'] = nameMerchandise;
    data['qtty_forecast'] = qttyForecast;
    data['tb_stock_list_id_des'] = tbStockListIdDes;
    data['name_stock_list_des'] = nameStockListDes;
    data['note'] = note;
    return data;
  }
}
