import 'package:appweb/app/core/shared/utils/custom_date.dart';

class CashierStatementParams {
  String date;
  int? tbCustomerId;
  int? tbOrderId;
  int? tbSalesmanId;

  CashierStatementParams({
    required this.date,
    this.tbCustomerId,
    this.tbOrderId,
    this.tbSalesmanId,
  }) {
    date = CustomDate.formatDateOut(date);
  }
}
