import 'package:appweb/app/modules/order_production_register/domain/entity/order_production_register_entity.dart';

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
            tbInstitutionId: tbInstitutionId ?? 0,
            tbUserId: tbUserId ?? 0,
            dtRecord: dtRecord ?? "",
            number: number ?? 0,
            status: status ?? "",
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
      tbUserId: json['tbUserId'] is String
          ? int.parse(json['tbUserId'])
          : json['tbUserId'],
      dtRecord: json['dtRecord'] as String? ?? "",
      number:
          json['number'] is String ? int.parse(json['number']) : json['number'],
      status: json['status'] as String? ?? "",
      tbMerchandiseId: json['tbMerchandiseId'] is String
          ? int.parse(json['tbMerchandiseId'])
          : json['tbMerchandiseId'],
      nameMerchandise: json['nameMerchandise'] as String? ?? "",
      qttyForecast: json['qttyForecast'] is String
          ? int.parse(json['qttyForecast'])
          : json['qttyForecast'],
      tbStockListIdDes: json['tbStockListIdDes'] is String
          ? int.parse(json['tbStockListIdDes'])
          : json['tbStockListIdDes'],
      nameStockListDes: json['nameStockListDes'] as String? ?? "",
      note: json['note'] as String? ?? "",
    );
  }
}
