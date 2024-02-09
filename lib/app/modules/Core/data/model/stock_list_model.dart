import 'package:appweb/app/modules/stock_list_register/domain/entity/stock_list_entity.dart';

// ignore: must_be_immutable
class StockListModel extends StockListEntity {
  StockListModel({
    required super.id,
    required super.tbInstitutionId,
    required super.description,
    required super.main,
    required super.active,
  });

  factory StockListModel.fromJson(Map<String, dynamic> json) {
    return StockListModel(
      id: int.parse(json['id'].toString()),
      tbInstitutionId: int.parse(json['tb_institution_id'].toString()),
      description: json['description'] as String,
      main: json['main'] as String,
      active: json['active'] as String,
    );
  }
  factory StockListModel.empty() {
    return StockListModel(
      id: 0,
      tbInstitutionId: 0,
      description: "",
      main: "N",
      active: "S",
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
