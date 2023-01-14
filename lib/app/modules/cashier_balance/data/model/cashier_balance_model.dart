import 'package:appweb/app/core/shared/utils/custom_date.dart';

import '../../domain/entity/cashier_balance_entity.dart';

class CashierBalanceModel extends CashierBalanceEntity {
  CashierBalanceModel({
    required String dtRecord,
    required List<CashierBalanceItemsEntity> items,
  }) : super(
          dtRecord: dtRecord,
          items: items,
        );

  factory CashierBalanceModel.fromJson(Map<String, dynamic> json) {
    return CashierBalanceModel(
      dtRecord: (json['dt_record'] != null)
          ? CustomDate.formatDateIn(json['dt_record'])
          : "",
      items: (json['items'] as List)
          .map((e) => CashierBalanceItemsModel.fromJson(e))
          .toList(),
    );
  }

  factory CashierBalanceModel.empty() {
    return CashierBalanceModel(dtRecord: '', items: []);
  }
}

class CashierBalanceItemsModel extends CashierBalanceItemsEntity {
  CashierBalanceItemsModel({
    required String? namePaymentType,
    required double? balanceValue,
  }) : super(
          namePaymentType: namePaymentType ?? "",
          balanceValue: balanceValue ?? 0.0,
        );

  factory CashierBalanceItemsModel.fromJson(Map<String?, dynamic> json) {
    return CashierBalanceItemsModel(
      namePaymentType: json['name_payment_type'],
      balanceValue: json['balance_value'] is String
          ? double.parse(json['balance_value'])
          : json['balance_value'],
    );
  }

  factory CashierBalanceItemsModel.empty() {
    return CashierBalanceItemsModel(
      namePaymentType: "",
      balanceValue: 0,
    );
  }
}
