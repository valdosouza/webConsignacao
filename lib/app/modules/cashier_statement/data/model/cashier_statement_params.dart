import 'package:appweb/app/core/shared/utils/custom_date.dart';

class CashierStatementParams {
  String date;
  int? tbCustomerId;
  int? tbOrderId;

  CashierStatementParams(
      {required this.date, this.tbCustomerId, this.tbOrderId}) {
    date = CustomDate.formatDateOut(date);
  }
}
