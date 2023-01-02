import 'package:dartz/dartz.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import '../../domain/entity/cashier_balance_entity.dart';

class CashierBalanceModel extends CashierBalanceEntity {
  CashierBalanceModel({String? date, List<Tuple2<String, double>>? items})
      : super(date: date ?? "", items: items ?? List.empty());

  factory CashierBalanceModel.fromJson(Map<String?, dynamic> json) {
    return CashierBalanceModel(
        date: json['date'],
        items: (json['items'] as List).map((e) {
          return Tuple2<String, double>(e['description'], double.parse(e['tag_value']));
        }).toList());
  }

  factory CashierBalanceModel.empty() {
    return CashierBalanceModel();
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

   static convertDate(String date) {
    return date.split("/").reversed.join("-");
  }
}
