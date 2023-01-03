class CashierBalanceEntity {
  String dtRecord;
  List<CashierBalanceItemsEntity> items;
  CashierBalanceEntity({
    required this.dtRecord,
    required this.items,
  });
}

class CashierBalanceItemsEntity {
  String namePaymentType;
  double balanceValue;
  CashierBalanceItemsEntity({
    required this.namePaymentType,
    required this.balanceValue,
  });
}
