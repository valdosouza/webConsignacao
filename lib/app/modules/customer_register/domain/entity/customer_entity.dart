class CustomerEntity {
  int id;
  int tbInstitutionId;
  int tbSalesmanId;
  int tbCarrierId;
  String creditStatus;
  String creditValue;
  String wallet;
  String consumer;
  String multiplier;
  String active;

  CustomerEntity({
    this.id = 0,
    this.tbInstitutionId = 0,
    this.tbSalesmanId = 0,
    this.tbCarrierId = 0,
    this.creditStatus = "",
    this.creditValue = "",
    this.wallet = "",
    this.consumer = "",
    this.multiplier = "",
    this.active = "",
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['tb_institution_id'] = tbInstitutionId;
    data['tb_salesman_id'] = tbSalesmanId;
    data['tb_carrier_id'] = tbCarrierId;
    data['credit_status'] = creditStatus;
    data['credit_value'] = 0;
    data['wallet'] = wallet;
    data['consumer'] = consumer;
    data['multiplier'] = 0;
    data['active'] = active;
    return data;
  }
}
