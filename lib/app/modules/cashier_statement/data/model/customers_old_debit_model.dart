import 'package:appweb/app/modules/cashier_statement/domain/entity/customers_old_debit_entity.dart';

class CustomersOldDebitModel extends CustomersOldDebitEntity {
  CustomersOldDebitModel({
    required super.tbCustomerId,
    required super.nameCustomer,
    required super.currentDebitBalance,
  });

  factory CustomersOldDebitModel.fromJson(Map<String, dynamic> json) {
    return CustomersOldDebitModel(
      tbCustomerId: json['tb_customer_id'],
      nameCustomer: json['name_customer'],
      currentDebitBalance: json['current_debit_balance'] is int
          ? json['current_debit_balance'].toDouble()
          : json['current_debit_balance'],
    );
  }
  factory CustomersOldDebitModel.empty() {
    return CustomersOldDebitModel(
      currentDebitBalance: 0,
      nameCustomer: "",
      tbCustomerId: 0,
    );
  }
}
