class CustomerEntity {
  int tbSalesmanId;
  int tbCarrierId;
  String creditStatus;
  double creditValue;
  String wallet;
  String consumer;
  double multiplier;
  String active;

  CustomerEntity({
    this.tbSalesmanId = 0,
    this.tbCarrierId = 0,
    this.creditStatus = "",
    this.creditValue = 0.0,
    this.wallet = "",
    this.consumer = "",
    this.multiplier = 0.0,
    this.active = "",
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tb_salesman_id'] = tbSalesmanId;
    data['tb_carrier_id'] = tbCarrierId;
    data['credit_status'] = creditStatus;
    data['credit_value'] = creditValue;
    data['wallet'] = wallet;
    data['consumer'] = consumer;
    data['multiplier'] = multiplier;
    data['active'] = active;
    return data;
  }
}
