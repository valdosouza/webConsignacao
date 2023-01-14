import 'package:appweb/app/core/shared/utils/custom_date.dart';

class CashierStatementParams {
  String date;
  int? tbCustomerId;

  CashierStatementParams({
    required this.date,
    this.tbCustomerId,
  }) {
    date = CustomDate.formatDateOut(date);
  }
}
