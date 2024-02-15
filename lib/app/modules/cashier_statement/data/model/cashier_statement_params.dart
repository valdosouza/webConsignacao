import 'package:appweb/app/core/shared/utils/custom_date.dart';

class CashierStatementParams {
  int? tbInstitutionId;
  String date;
  int? tbCustomerId;
  int? tbOrderId;
  int? tbSalesmanId;
  String? nameCustomer;
  int page;

  CashierStatementParams({
    this.tbInstitutionId,
    required this.date,
    this.tbCustomerId,
    this.tbOrderId,
    this.tbSalesmanId = 0,
    this.nameCustomer = "",
    this.page = 1,
  }) {
    date = CustomDate.formatDateOut(date);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tb_institution_id'] = tbInstitutionId;
    data['date'] = date;
    data['tb_customer_id'] = tbCustomerId;
    data['tb_order_id'] = tbOrderId;
    data['tb_salesman_id'] = tbSalesmanId;
    data['name_customer'] = nameCustomer;
    data['page'] = page;
    return data;
  }
}
