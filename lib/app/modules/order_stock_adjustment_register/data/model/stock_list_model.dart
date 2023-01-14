import 'package:appweb/app/modules/stock_list_register/domain/entity/stock_list_entity.dart';

// ignore: must_be_immutable
class StockListModel extends StockListEntity {
  StockListModel({
    int? id,
    int? tbInstitutionId,
    String? description,
    String? main,
    String? active,
  }) : super(
            id: id ?? 0,
            tbInstitutionId: tbInstitutionId ?? 1,
            description: description ?? "",
            main: main ?? "",
            active: active ?? "S");

  factory StockListModel.fromJson(Map<String, dynamic> json) {
    return StockListModel(
      id: int.parse(json['id'].toString()),
      tbInstitutionId: int.parse(json['tb_institution_id'].toString()),
      description: json['description'] as String,
      main: json['main'] as String,
      active: json['active'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id.toString();
    data['tb_institution_id'] = tbInstitutionId.toString();
    data['description'] = description;
    data['main'] = main;
    data['active'] = active;
    return data;
  }
}
