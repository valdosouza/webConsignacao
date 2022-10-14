import 'package:appweb/app/modules/stock_list_register/domain/entities/stock_list_entity.dart';

class StockListModel extends StockListEntity {
  const StockListModel({
    required int id,
    required int institution,
    required String description,
    required String main,
    required String active,
  }) : super(
            id: id,
            institution: institution,
            description: description,
            main: main,
            active: active);

  factory StockListModel.fromJson(Map<String, dynamic> json) {
    return StockListModel(
      id: int.parse(json['id'].toString()),
      institution: int.parse(json['institution'].toString()),
      description: json['description'] as String,
      main: json['main'] as String,
      active: json['active'] as String,
    );
  }
}
